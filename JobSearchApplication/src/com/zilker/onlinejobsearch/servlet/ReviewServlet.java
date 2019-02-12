package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zilker.onlinejobsearch.beans.Company;
import com.zilker.onlinejobsearch.delegate.CompanyDelegate;
import com.zilker.onlinejobsearch.delegate.UserDelegate;

/**
 * Servlet implementation class ReviewServlet
 */
@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewServlet() {
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
			int companyId=0;
		ArrayList<Company> companyReviews = new ArrayList<Company>();	
		ArrayList<Company> companyDetails = new ArrayList<Company>();
		UserDelegate userDelegate = new UserDelegate();
		Company company = new Company();
		CompanyDelegate companyDelegate = new CompanyDelegate();
		String companyName = request.getParameter("company");
		System.out.println(companyName);
		company.setCompanyName(companyName);
		companyId = companyDelegate.fetchCompanyId(company);
		company.setCompanyId(companyId);
		companyDetails = companyDelegate.retrieveVacancyByCompany(company);
		if (companyDetails.isEmpty()) {
			System.out.println("***No Vacancy in this Company!!!***");

		}
		for (Company j : companyDetails) {
			request.setAttribute("displayCompany", companyDetails);
		}
		companyReviews = userDelegate.retrieveReview(company);
		if (companyReviews.isEmpty()) {
			System.out.println("***No Reviews for this Company!!!***");
		}
		for (Company i : companyReviews) {
			request.setAttribute("displayCompanyReviews", companyReviews);
		}
		getServletConfig().getServletContext().getRequestDispatcher("/Pages/jsp/viewallreviews.jsp").forward(request,response);
		}catch(Exception e) {
			
		}
	}

}
