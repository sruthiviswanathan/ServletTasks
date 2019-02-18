package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zilker.onlinejobsearch.beans.Company;
import com.zilker.onlinejobsearch.beans.JobMapping;
import com.zilker.onlinejobsearch.beans.User;
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
		HttpSession session = request.getSession();
		if(session.getAttribute("email")==null){
			response.sendRedirect("index.jsp");
		}else {
			System.out.println("session attribute "+session.getAttribute("email"));
		}
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
			HttpSession session = request.getSession();
			if(session.getAttribute("email")==null){
				response.sendRedirect("index.jsp");
			}else {
			String email = (String) session.getAttribute("email");
			User user= new User();
			user.setEmail(email);
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
			if(jobId == 0) {
				request.setAttribute("noJobDesignation","yes");
				RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/findjob.jsp");
				rd.forward(request, response);
			}
			else {
			
				company.setJobId(jobId);
				vacancyDetails = jobDelegate.retrieveVacancyByJob1(company);
				if (vacancyDetails.isEmpty()) {
					request.setAttribute("noVacancy","yes");
					RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/findjob.jsp");
					rd.forward(request, response);
				}
				else {
				for (Company i : vacancyDetails) {
					request.setAttribute("displayVacancy", vacancyDetails);
				}
				getServletConfig().getServletContext().getRequestDispatcher("/Pages/jsp/viewjobs.jsp").forward(request,response);
			
				}
		}
				
			}	
		} catch (SQLException e) {
		
		}

	}

}
