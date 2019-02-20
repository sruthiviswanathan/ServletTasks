package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class ApplyForJobServlet
 */
@WebServlet("/ApplyForJobServlet")
public class ApplyForJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyForJobServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		HttpSession session = request.getSession();
		ArrayList<String> jobRole = new ArrayList<String>();
		ArrayList<Company> vacancyDetails = new ArrayList<Company>();
		JobDelegate jobDelegate = new JobDelegate();
		Company company = new Company();
		JobMapping jobmapping = new JobMapping();
		if(session.getAttribute("email")==null){
			response.sendRedirect("index.jsp");
		}
		int jobId=0;
		String jobDesignation = (String) session.getAttribute("jobDesignation");
		System.out.println(jobDesignation);		
		jobRole.add(jobDesignation);
		request.setAttribute("job",jobRole);
		jobmapping.setJobRole(jobDesignation);
		
		jobId = jobDelegate.fetchJobId(jobmapping);
		if(jobId == 0) {
			request.setAttribute("noJobDesignation","yes");
			RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/viewjobs.jsp");
			rd.forward(request, response);
		}
		else {
		
			company.setJobId(jobId);
			vacancyDetails = jobDelegate.retrieveVacancyByJob1(company);
			if (vacancyDetails.isEmpty()) {
				request.setAttribute("noVacancy","yes");
				RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/viewjobs.jsp");
				rd.forward(request, response);
			}
			else {
			for (Company i : vacancyDetails) {
				request.setAttribute("displayVacancy", vacancyDetails);
			}
			request.setAttribute("applied","yes");
			getServletConfig().getServletContext().getRequestDispatcher("/Pages/jsp/viewjobs.jsp").forward(request,response);
		
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
		try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			int companyId=0,jobId=0,userId=0;
			Company company = new Company();
			JobMapping jobMapping = new JobMapping();
			CompanyDelegate companyDelegate = new CompanyDelegate();
			UserDelegate userDelegate = new UserDelegate();
			JobDelegate jobDelegate = new JobDelegate();
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("email");
			User user= new User();
			user.setEmail(email);
			userId = userDelegate.fetchUserId(user);
			user.setUserId(userId);
			String companyName = request.getParameter("companyName");
			String jobDesignation = request.getParameter("jobDesignation");
			company.setCompanyName(companyName);
			companyId = companyDelegate.fetchCompanyId(company);
			jobMapping.setJobRole(jobDesignation);
			jobId = jobDelegate.fetchJobId(jobMapping);
			company.setCompanyId(companyId);
			company.setJobId(jobId);
			if(userDelegate.applyForJob(company,user)) {		 	 
				//session.setAttribute("jobDesignation",jobDesignation); 
				//response.sendRedirect("ApplyForJobServlet");
				System.out.println("applied");
			}else {
				
			}
		}catch(Exception e) {
			
		}
	}

}
