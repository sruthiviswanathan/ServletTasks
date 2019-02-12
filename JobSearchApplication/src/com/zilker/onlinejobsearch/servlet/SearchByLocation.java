package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zilker.onlinejobsearch.beans.Company;
import com.zilker.onlinejobsearch.delegate.CompanyDelegate;
import com.zilker.onlinejobsearch.delegate.JobDelegate;
import com.zilker.onlinejobsearch.delegate.UserDelegate;

/**
 * Servlet implementation class SearchByLocation
 */
@WebServlet("/SearchByLocation")
public class SearchByLocation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchByLocation() {
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
			ArrayList<Company> allDetails = new ArrayList<Company>();
			ArrayList<Company> retrieveByLocation = new ArrayList<Company>();
			ArrayList<Company> companyDetails = new ArrayList<Company>();
			ArrayList<Company> vacancyDetails = new ArrayList<Company>();
			ArrayList<Company> interviewProcess = new ArrayList<Company>();
			Company company = new Company();
			Company c = new Company();
			UserDelegate userDelegate = new UserDelegate();
			JobDelegate jobDelegate = new JobDelegate();
			CompanyDelegate companyDelegate = new CompanyDelegate();
			String location = request.getParameter("location");
				company.setLocation(location);
				retrieveByLocation = companyDelegate.retrieveVacancyByLocation(company);
				if (retrieveByLocation.isEmpty()) {
					System.out.println("No vacancy in this Location as of now!!");
					
				} else {
					for (Company i : retrieveByLocation) {
						//request.setAttribute("retrieveByLocation",retrieveByLocation);
						int companyId = i.getCompanyId();
						int jobId = i.getJobId();
						company.setCompanyId(companyId);
						company.setJobId(jobId);
						companyDetails = companyDelegate.retrieveVacancyByCompany(company);
						if (companyDetails.isEmpty()) {
							System.out.println("***No Vacancy in this Company!!!***");
						}
						for (Company j : companyDetails) {
							//request.setAttribute("displayCompany", companyDetails);
							c.setCompanyName(j.getCompanyName());
							c.setCompanyWebsiteUrl(j.getCompanyWebsiteUrl());
							c.setAverageRating(j.getAverageRating());
							
						}
						vacancyDetails = jobDelegate.retrieveVacancyByJob(company);
						if (vacancyDetails.isEmpty()) {
							System.out.println("***No vacancy in this designation!!!***");
						}
						for (Company k : vacancyDetails) {
							//request.setAttribute("vacancydetails", vacancyDetails);
							c.setJobRole(k.getJobRole());
						}

						c.setJobDescription(i.getJobDescription());
						c.setLocation(i.getLocation());
						c.setSalary(i.getSalary());
						c.setVacancyCount(i.getVacancyCount());
						allDetails.add(c);
						request.setAttribute("allDetails", allDetails);

//						interviewProcess = userDelegate.retrieveInterviewProcess(company);
//						if (interviewProcess.isEmpty()) {
//							System.out.println("***No Reviews on Interview process!!!***");
//						}
//						for (Company j : interviewProcess) {
//							logger.log(Level.INFO, " \nUSERNAME:" + j.getUserName() + "\tINTERVIEW PROCESS:"
//								+ j.getInterviewProcess());
//							request.setAttribute("interviewprocess", interviewProcess);
//						}

					}
			
				}
				System.out.println(allDetails);
				getServletConfig().getServletContext().getRequestDispatcher("/Pages/jsp/test.jsp").forward(request,response);	
		} catch (SQLException e) {
		
		}

	}

}
