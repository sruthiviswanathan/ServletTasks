package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zilker.onlinejobsearch.beans.Company;
import com.zilker.onlinejobsearch.delegate.CompanyDelegate;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		Company company = new Company();
		CompanyDelegate companyDelegate = new CompanyDelegate();
		String companyName=request.getParameter("companyName");
		String websiteUrl=request.getParameter("websiteUrl");
		company.setCompanyName(companyName);
		company.setCompanyWebsiteUrl(websiteUrl);
		
		if(companyDelegate.addNewCompany(company)) {
			response.sendRedirect("Pages/jsp/signup.jsp");
		}else {
			
		}
		
		}catch(Exception e) {
			
		}
	}

}
