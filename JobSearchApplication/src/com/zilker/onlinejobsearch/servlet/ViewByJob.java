package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zilker.onlinejobsearch.beans.Company;
import com.zilker.onlinejobsearch.beans.JobMapping;
import com.zilker.onlinejobsearch.delegate.JobDelegate;


/**
 * Servlet implementation class ViewByJob
 */
@WebServlet("/ViewByJob")
public class ViewByJob extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewByJob() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			ArrayList<String> jobRole = new ArrayList<String>();
			ArrayList<Company> vacancyDetails = new ArrayList<Company>();
			JobDelegate jobDelegate = new JobDelegate();
			Company company = new Company();
			JobMapping jobmapping = new JobMapping();

			int jobId = 0;
			
			String jobDesignation = request.getParameter("job");

			jobRole.add(jobDesignation);
			request.setAttribute("job",jobRole);
			jobmapping.setJobRole(jobDesignation);
			jobId = jobDelegate.fetchJobId(jobmapping);
			if (jobId == 0) {
				 out.println("<script type=\"text/javascript\">");
				   out.println("alert('No vacancy in this designation!!!');");
				   out.println("location='Pages/jsp/findjob.jsp';");
				   out.println("</script>");
				  // response.sendRedirect("Pages/jsp/findjob.jsp");
			} else {
				
				company.setJobId(jobId);
				vacancyDetails = jobDelegate.retrieveVacancyByJob1(company);
				if (vacancyDetails.isEmpty()) {
					System.out.println("***No vacancy in this designation!!!***");
				}
				for (Company i : vacancyDetails) {
					request.setAttribute("displayVacancy", vacancyDetails);
					getServletConfig().getServletContext().getRequestDispatcher("/Pages/jsp/viewjobs.jsp").forward(request,response);
				}

			}
			
		} catch (SQLException e) {
		
		}

	}

}
