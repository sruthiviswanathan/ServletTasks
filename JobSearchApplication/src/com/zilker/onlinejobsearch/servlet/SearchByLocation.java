package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zilker.onlinejobsearch.beans.Company;
import com.zilker.onlinejobsearch.delegate.CompanyDelegate;


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
			ArrayList<Company> retrieveByLocation = new ArrayList<Company>();
			Company company = new Company();	
			CompanyDelegate companyDelegate = new CompanyDelegate();
			String location = request.getParameter("location");
			String flag="";
				company.setLocation(location);
				retrieveByLocation = companyDelegate.retrieveVacancyByLocation(company);
				if (retrieveByLocation.isEmpty()) {
					System.out.println("No vacancy in this Location as of now!!");
				
				 flag="No vacancy in this Location as of now!!";
				 request.setAttribute("flag",flag);
				
					//response.sendRedirect("Pages/jsp/searchbylocation.jsp");
					getServletConfig().getServletContext().getRequestDispatcher("/Pages/jsp/searchbylocation.jsp").forward(request,response);	
					
				} else {
					for (Company i : retrieveByLocation) {
						request.setAttribute("retrieveByLocation", retrieveByLocation);
					}
					getServletConfig().getServletContext().getRequestDispatcher("/Pages/jsp/viewbylocation.jsp").forward(request,response);	
				}

		} catch (SQLException e) {
		
		}

	}

}
