package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zilker.onlinejobsearch.beans.JobMapping;
import com.zilker.onlinejobsearch.beans.Technology;
import com.zilker.onlinejobsearch.beans.User;
import com.zilker.onlinejobsearch.beans.UserTechnologyMapping;
import com.zilker.onlinejobsearch.delegate.JobDelegate;
import com.zilker.onlinejobsearch.delegate.UserDelegate;

/**
 * Servlet implementation class UserProfileServlet
 */
@WebServlet("/UserProfileServlet")
public class UserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfileServlet() {
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
		UserDelegate userDelegate = new UserDelegate();
		User user= new User();
		user.setEmail(email);
		int userId=0;
		userId = userDelegate.fetchUserId(user);
		user.setUserId(userId);
		ArrayList<User> userList = new ArrayList<User>();
		UserTechnologyMapping userTechnologyMapping = new UserTechnologyMapping();
		ArrayList<UserTechnologyMapping> userTechnology = new ArrayList<UserTechnologyMapping>();
		userList = userDelegate.retrieveUserData(user);
		userTechnology = userDelegate.displayUserTechnologies(userTechnologyMapping, user);
		Technology technology = new Technology();
		ArrayList<Technology> tech = new ArrayList<Technology>();
		tech = userDelegate.displayTechnologies(technology);
		request.setAttribute("technologies",tech);
		request.setAttribute("userData", userList); 
		request.setAttribute("userTech", userTechnology); 
		RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/viewprofile.jsp");
		rd.forward(request, response);
		
		
		
		}catch(Exception e) {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		UserDelegate userDelegate = new UserDelegate();
		User user= new User();
		user.setEmail(email);
		int userId=0;
		userId = userDelegate.fetchUserId(user);
		user.setUserId(userId);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		user.setCurrentTime(dtf.format(now));
		String userName=request.getParameter("username");
		String companyName=request.getParameter("cname");
		String designation=request.getParameter("designation");
		user.setUserName(userName);
		if(userDelegate.updateUserName(user)) {
		System.out.println("updated username");	
		}
		user.setCompany(companyName);
		if(userDelegate.updateCompanyName(user)) {
			System.out.println("updated company name");	
		}
		user.setDesignation(designation);
		if(userDelegate.updateUserDesignation(user)) {
			System.out.println("updated designation");
		}
		response.sendRedirect("UserProfileServlet");
		}catch(Exception e) {
			
		}
	}

}
