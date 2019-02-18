package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
			System.out.println("doget");
			HttpSession session=request.getSession(); 
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			if(session.getAttribute("email")==null){
				response.sendRedirect("index.jsp");
			}
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		//HttpSession session = request.getSession();
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
			
			
			request.setAttribute("noVacancy","yes");
			RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/admin.jsp");
			rd.forward(request, response);
			//out.println("<script type=\"text/javascript\">");
		 	//out.println("alert('You have not published any vacancies till now');");
		 	//out.println("location='Pages/jsp/admin.jsp';");
		    //out.println("</script>");
			//response.sendRedirect("Pages/jsp/admin.jsp");
		}else {
		for (Company i : vacancyDetails) {
			request.setAttribute("vacancyDetails", vacancyDetails); 
			RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/viewpublishedjobs.jsp");
			rd.forward(request, response);

		}
		}
		}catch(Exception e) {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * try { System.out.println("dopost"); HttpSession session =
		 * request.getSession(); String email = (String) session.getAttribute("email");
		 * //System.out.println(email); UserDelegate userDelegate = new UserDelegate();
		 * User user= new User(); user.setEmail(email); int userId=0; userId =
		 * userDelegate.fetchUserId(user); user.setUserId(userId);
		 * System.out.println(userId); String jobRole = request.getParameter("newjob");;
		 * JobDelegate jobDelegate = new JobDelegate(); JobMapping jobmapping = new
		 * JobMapping(); jobmapping.setJobRole(jobRole);
		 * if(jobDelegate.addNewJob(jobmapping, user)) {
		 * //response.sendRedirect("PostJobServlet"); int companyId=0; Company company =
		 * new Company(); ArrayList<Company> vacancyDetails = new ArrayList<Company>();
		 * CompanyDelegate companyDelegate = new CompanyDelegate(); companyId =
		 * userDelegate.fetchCompanyIdByAdmin(user); company.setCompanyId(companyId);
		 * vacancyDetails = companyDelegate.retrieveVacancyByCompanyAdmin(company);
		 * 
		 * 
		 * JobMapping jobMapping = new JobMapping(); ArrayList<JobMapping> job = new
		 * ArrayList<JobMapping>(); job = jobDelegate.displayJobs(jobMapping);
		 * request.setAttribute("jobs", job);
		 * 
		 * if (vacancyDetails.isEmpty()) {
		 * 
		 * //response.sendRedirect("Pages/jsp/admin.jsp"); } for (Company i :
		 * vacancyDetails) { request.setAttribute("vacancyDetails", vacancyDetails);
		 * RequestDispatcher rd =
		 * request.getRequestDispatcher("Pages/jsp/viewpublishedjobs.jsp");
		 * rd.forward(request, response);
		 * 
		 * }
		 * 
		 * 
		 * }else { response.sendRedirect("Pages/jsp/error.jsp"); }
		 * 
		 * } catch (SQLException e) {
		 * 
		 * }
		 */
	}

}
