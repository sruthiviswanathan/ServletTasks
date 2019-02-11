package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zilker.onlinejobsearch.beans.Company;
import com.zilker.onlinejobsearch.delegate.CompanyDelegate;


/**
 * Servlet implementation class RetreiveAllCompanyServlet
 */
@WebServlet("/RetreiveAllCompanyServlet")
public class RetreiveAllCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RetreiveAllCompanyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
		Company company = new Company();
		ArrayList<Company> companyDetails = new ArrayList<Company>();
		CompanyDelegate companyDelegate = new CompanyDelegate();
		
		companyDetails = companyDelegate.RetreiveAllCompanies(company);
		request.setAttribute("companyList", companyDetails); 

		getServletConfig().getServletContext().getRequestDispatcher("Pages/jsp/mainpage.jsp").forward(request,response);

		
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
