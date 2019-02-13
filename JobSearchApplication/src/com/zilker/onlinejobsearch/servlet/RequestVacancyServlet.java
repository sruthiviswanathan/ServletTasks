package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zilker.onlinejobsearch.beans.JobMapping;
import com.zilker.onlinejobsearch.beans.JobRequest;
import com.zilker.onlinejobsearch.beans.User;
import com.zilker.onlinejobsearch.delegate.JobDelegate;
import com.zilker.onlinejobsearch.delegate.UserDelegate;

/**
 * Servlet implementation class RequestVacancyServlet
 */
@WebServlet("/RequestVacancyServlet")
public class RequestVacancyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestVacancyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			//response.getWriter().append("Served at: ").append(request.getContextPath());
			JobMapping jobMapping = new JobMapping();
			ArrayList<JobMapping> job = new ArrayList<JobMapping>();
			JobDelegate jobDelegate = new JobDelegate();
			job = jobDelegate.displayJobs(jobMapping);
			request.setAttribute("jobs", job); 
			response.sendRedirect("Pages/jsp/requestvacancy.jsp");
			}catch(Exception e) {
				
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int jobId=0,userId=0;
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("email");
			User user= new User();
			UserDelegate userDelegate = new UserDelegate();
			JobDelegate jobDelegate = new JobDelegate();
			JobRequest jobrequest = new JobRequest();
			JobMapping jobMapping = new JobMapping();
			user.setEmail(email);
			String jobDesignation = request.getParameter("job");
			String location = request.getParameter("location");
			String salary = request.getParameter("salary");
			jobrequest.setEmail(user.getEmail());
			jobMapping.setJobRole(jobDesignation);
			jobId = jobDelegate.fetchJobId(jobMapping);
			jobrequest.setJobId(jobId);
			jobrequest.setLocation(location);
			jobrequest.setSalary(Float.parseFloat(salary));
			userId = userDelegate.fetchUserId(user);
			user.setUserId(userId);
			if(userDelegate.requestNewVacancy(jobrequest, user)) {
				response.sendRedirect("Pages/jsp/requestvacancy.jsp");
			}else {
				response.sendRedirect("Pages/jsp/error.jsp");
			}
		}catch(Exception e) {
			
		}
	}

}
