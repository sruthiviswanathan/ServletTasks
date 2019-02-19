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
 * Servlet implementation class ApplyForJobLocationServlet
 */
@WebServlet("/ApplyForJobLocationServlet")
public class ApplyForJobLocationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyForJobLocationServlet() {
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
			String email = (String) session.getAttribute("email");
			User user= new User();
			user.setEmail(email);
			ArrayList<Company> retrieveByLocation = new ArrayList<Company>();
			Company company = new Company();	
			CompanyDelegate companyDelegate = new CompanyDelegate();
			//String location = request.getParameter("location");
			String location = (String) session.getAttribute("location");
				company.setLocation(location);
				retrieveByLocation = companyDelegate.retrieveVacancyByLocation(company);
				if (retrieveByLocation.isEmpty()) {
					request.setAttribute("noVacancy","yes");
					RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/viewbylocation.jsp");
					rd.forward(request, response);
					
				} else {
					for (Company i : retrieveByLocation) {
						request.setAttribute("retrieveByLocation", retrieveByLocation);
					}
					request.setAttribute("applied","yes");
					getServletConfig().getServletContext().getRequestDispatcher("/Pages/jsp/viewbylocation.jsp").forward(request,response);	
				}

		} catch (SQLException e) {
		
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
			String location = request.getParameter("location");
			company.setCompanyName(companyName);
			companyId = companyDelegate.fetchCompanyId(company);
			jobMapping.setJobRole(jobDesignation);
			jobId = jobDelegate.fetchJobId(jobMapping);
			company.setCompanyId(companyId);
			company.setJobId(jobId);
			if(userDelegate.applyForJob(company,user)) {		 	 
				session.setAttribute("location",location); 
				response.sendRedirect("ApplyForJobLocationServlet");
			}else {
				
			}
		}catch(Exception e) {
			
		}
	}

}
