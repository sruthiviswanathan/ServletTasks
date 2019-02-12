package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zilker.onlinejobsearch.beans.Company;
import com.zilker.onlinejobsearch.beans.User;
import com.zilker.onlinejobsearch.delegate.CompanyDelegate;
import com.zilker.onlinejobsearch.delegate.UserDelegate;

/**
 * Servlet implementation class AddNewCompany
 */
@WebServlet("/AddNewCompany")
public class AddNewCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddNewCompany() {
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
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("email");
			UserDelegate userDelegate = new UserDelegate();
			User user = new User();
			user.setEmail(email);
			int userId = 0;
			userId = userDelegate.fetchUserId(user);
			user.setUserId(userId);
			Company company = new Company();
			CompanyDelegate companyDelegate = new CompanyDelegate();
			String companyName = request.getParameter("companyName");
			String websiteUrl = request.getParameter("websiteUrl");
			company.setCompanyName(companyName);
			company.setCompanyWebsiteUrl(websiteUrl);

			if (companyDelegate.addNewCompany(company, user)) {
				response.sendRedirect("Pages/jsp/signup.jsp");
			} else {
				response.sendRedirect("Pages/jsp/error.jsp");
			}

		} catch (Exception e) {
			response.sendRedirect("Pages/jsp/error.jsp");
		}
	}

}
