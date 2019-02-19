package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class FindCompanyServlet
 */
@WebServlet("/FindCompanyServlet")
public class FindCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FindCompanyServlet() {
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
		HttpSession session = request.getSession();
		if (session.getAttribute("email") == null) {
			response.sendRedirect("index.jsp");
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
			int companyId = 0;
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("email");
			User user = new User();
			user.setEmail(email);
			ArrayList<Company> companyDetails = new ArrayList<Company>();
			ArrayList<Company> vacancyDetails = new ArrayList<Company>();
			ArrayList<Company> companyReviews = new ArrayList<Company>();
			ArrayList<Company> interviewProcess = new ArrayList<Company>();
			Company company = new Company();
			CompanyDelegate companyDelegate = new CompanyDelegate();
			UserDelegate userDelegate = new UserDelegate();
			String companyName = request.getParameter("companyName");
			company.setCompanyName(companyName);
			companyId = companyDelegate.fetchCompanyId(company);
			if (companyId == 0) {
				// response.sendRedirect("Pages/jsp/findcompany.jsp");
				request.setAttribute("noCompany", "yes");
				RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/errorcompanyresults.jsp");
				rd.forward(request, response);

			} else {
				company.setCompanyId(companyId);
				companyDetails = companyDelegate.retrieveVacancyByCompany(company);
				/*
				 * if (companyDetails.isEmpty()) {
				 * System.out.println("***No Vacancy in this Company!!!***");
				 * 
				 * }
				 */
				for (Company j : companyDetails) {
					request.setAttribute("displayCompany", companyDetails);
				}
				vacancyDetails = companyDelegate.retrieveVacancyByCompany1(company);

				if (vacancyDetails.isEmpty()) {
					// System.out.println("***No Vacancy in this Company!!!***");
					request.setAttribute("noVacancy", "yes");
					
					companyReviews = userDelegate.retrieveReview(company);

					if (companyReviews.isEmpty()) {
						//System.out.println("***No Reviews for this Company!!!***");
						request.setAttribute("noReviews", "yes");
					} else {
						for (Company i : companyReviews) {
							request.setAttribute("displayCompanyReviews", companyReviews);
						}
					}
					RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/companydetails.jsp");
					rd.forward(request, response);
				} else {
					for (Company i : vacancyDetails) {
						int jobId = i.getJobId();
						request.setAttribute("displayVacancies", vacancyDetails);
						company.setJobId(jobId);

						/*
						 * interviewProcess = userDelegate.retrieveInterviewProcess(company); if
						 * (interviewProcess.isEmpty()) {
						 * System.out.println("***No reviews on Interview process!!!***"); }
						 * 
						 * else { for (Company j : interviewProcess) {
						 * request.setAttribute("displayInterviewProcess", interviewProcess); }
						 */
					}
				}
				// }
				companyReviews = userDelegate.retrieveReview(company);

				if (companyReviews.isEmpty()) {
					System.out.println("***No Reviews for this Company!!!***");
				} else {
					for (Company i : companyReviews) {
						request.setAttribute("displayCompanyReviews", companyReviews);
					}
				}

			}
			getServletConfig().getServletContext().getRequestDispatcher("/Pages/jsp/companydetails.jsp")
					.forward(request, response);
		} catch (Exception e) {

		}

	}

}
