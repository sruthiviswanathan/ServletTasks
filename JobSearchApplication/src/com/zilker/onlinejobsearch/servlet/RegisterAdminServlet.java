package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zilker.onlinejobsearch.beans.Company;
import com.zilker.onlinejobsearch.beans.Technology;
import com.zilker.onlinejobsearch.beans.User;

import com.zilker.onlinejobsearch.delegate.CompanyDelegate;
import com.zilker.onlinejobsearch.delegate.UserDelegate;

/**
 * Servlet implementation class RegisterAdminServlet
 */
@WebServlet("/RegisterAdminServlet")
public class RegisterAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterAdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("signup");
			request.setAttribute("adminRegistrationError","error");
		
			Technology technology = new Technology();
			ArrayList<Technology> tech = new ArrayList<Technology>();
			UserDelegate userDelegate = new UserDelegate();
			tech = userDelegate.displayTechnologies(technology);
			request.setAttribute("technologies",tech);
			
			Company company = new Company();
			ArrayList<Company> displayCompanies = new ArrayList<Company>();
			CompanyDelegate companyDelegate = new CompanyDelegate();
			displayCompanies = companyDelegate.displayCompanies(company);
			request.setAttribute("companies", displayCompanies);
			
			RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/signup.jsp");
			rd.forward(request, response);
			
			}catch(Exception e) {
				
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

			int userId = 0, flag = 0;
			UserDelegate userDelegate = new UserDelegate();
			CompanyDelegate companyDelegate = new CompanyDelegate();
			User user = new User();
			Company company = new Company();
			String name = request.getParameter("userName");
			String password = request.getParameter("psw");
			String confirmPassword = request.getParameter("cpsw");
			String email = request.getParameter("email");
			String companyid = request.getParameter("companyName");

			String companyname = companyDelegate.fetchCompanyName(Integer.parseInt(companyid));

			user.setUserName(name);
			user.setEmail(email);
			user.setPassword(password);
			user.setCompany(companyname);
			user.setDesignation("admin");
			user.setRoleId(2);

			if (userDelegate.registerAsAdmin(user)) {
				userId = userDelegate.fetchUserId(user);
				user.setUserId(userId);
				userDelegate.insertIntoUser(user);

				if (userId != 0) {
					user.setUserId(userId);
//					company.setCompanyName(companyName);
//					companyId = companyDelegate.fetchCompanyId(company);
					company.setCompanyId(Integer.parseInt(companyid));
					flag = userDelegate.insertIntoAdmin(user, company);
//					CompanyDelegate.insertIntoCompanyDetails(user, company);
					if (flag == 1) {
						request.setAttribute("registerSuccess","yes");
						RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/login.jsp");
						rd.forward(request, response);
					}
				}
				
				 //response.sendRedirect("Pages/jsp/login.jsp");
				/*
				 * RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/login.jsp");
				 * rd.forward(request, response);
				 */
			} 

		} 
		
		 catch (SQLIntegrityConstraintViolationException e) {
			  System.out.println("exception here");
			  request.setAttribute("adminRegistrationError","error");
			  response.sendRedirect("RegisterAdminServlet"); 
			  
			  }
			

		catch (Exception e) {
//				response.sendRedirect("/Pages/Retry.jsp");
		}

	}

}
