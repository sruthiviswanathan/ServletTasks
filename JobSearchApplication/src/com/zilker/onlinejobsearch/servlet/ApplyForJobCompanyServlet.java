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
 * Servlet implementation class ApplyForJobCompanyServlet
 */
@WebServlet("/ApplyForJobCompanyServlet")
public class ApplyForJobCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyForJobCompanyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			Company company = new Company();
			CompanyDelegate companyDelegate = new CompanyDelegate();
			UserDelegate userDelegate = new UserDelegate();
			//String companyName = request.getParameter("companyName");
			String companyName = (String) session.getAttribute("companyName");
			company.setCompanyName(companyName);
			companyId = companyDelegate.fetchCompanyId(company);
			if (companyId == 0) {
				
				request.setAttribute("noCompany", "yes");
				RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/errorcompanyresults.jsp");
				rd.forward(request, response);

			} else {
				company.setCompanyId(companyId);
				companyDetails = companyDelegate.retrieveVacancyByCompany(company);
				for (Company j : companyDetails) {
					request.setAttribute("displayCompany", companyDetails);
				}
				vacancyDetails = companyDelegate.retrieveVacancyByCompany1(company);

				if (vacancyDetails.isEmpty()) {
					request.setAttribute("noVacancy", "yes");
					
					companyReviews = userDelegate.retrieveReview(company);

					if (companyReviews.isEmpty()) {
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
					}
				}
				
				companyReviews = userDelegate.retrieveReview(company);

				if (companyReviews.isEmpty()) {
					System.out.println("***No Reviews for this Company!!!***");
				} else {
					for (Company i : companyReviews) {
						request.setAttribute("displayCompanyReviews", companyReviews);
					}
				}

			}
			request.setAttribute("applied","yes");
			getServletConfig().getServletContext().getRequestDispatcher("/Pages/jsp/companydetails.jsp").forward(request, response);
		} catch (Exception e) {

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			response.setContentType("text/html;charset=UTF-8");
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
				session.setAttribute("companyName",companyName); 
				response.sendRedirect("ApplyForJobCompanyServlet");
			}else {
				
			}
		}catch(Exception e) {
			
		}
	}

}
