package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.zilker.onlinejobsearch.beans.User;
import com.zilker.onlinejobsearch.delegate.CompanyDelegate;
import com.zilker.onlinejobsearch.delegate.JobDelegate;
import com.zilker.onlinejobsearch.delegate.UserDelegate;

/**
 * Servlet implementation class ViewPublishedJobsServlet
 */
@WebServlet("/ViewPublishedJobsServlet")
public class ViewPublishedJobsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewPublishedJobsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		User user= new User();
		user.setEmail(email);
		Company company = new Company();
		ArrayList<Company> vacancyDetails = new ArrayList<Company>();
		CompanyDelegate companyDelegate = new CompanyDelegate();
		UserDelegate userDelegate = new UserDelegate();
		int userId=0,companyId=0;
		userId = userDelegate.fetchUserId(user);
		user.setUserId(userId);
		companyId = userDelegate.fetchCompanyIdByAdmin(user);
		company.setCompanyId(companyId);
		vacancyDetails = companyDelegate.retrieveVacancyByCompanyAdmin(company);
		
		
			JobMapping jobMapping = new JobMapping();
			ArrayList<JobMapping> job = new ArrayList<JobMapping>();
			JobDelegate jobDelegate = new JobDelegate();
			job = jobDelegate.displayJobs(jobMapping);
			request.setAttribute("jobs", job); 
			
		if (vacancyDetails.isEmpty()) {
			out.println("<script type=\"text/javascript\">");
		 	out.println("alert('You have not published any vacancies till now');");
		 	out.println("location='Pages/jsp/admin.jsp';");
		    out.println("</script>");
			//response.sendRedirect("Pages/jsp/admin.jsp");
		}
		for (Company i : vacancyDetails) {
			request.setAttribute("vacancyDetails", vacancyDetails); 
			RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/viewpublishedjobs.jsp");
			rd.forward(request, response);

		}
		}catch(Exception e) {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
