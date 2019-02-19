package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import java.sql.SQLException;
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
		HttpSession session = request.getSession();
		if(session.getAttribute("email")==null){
			response.sendRedirect("index.jsp");
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
			User user= new User();
			user.setEmail(email);
			ArrayList<Company> retrieveByLocation = new ArrayList<Company>();
			Company company = new Company();	
			CompanyDelegate companyDelegate = new CompanyDelegate();
			String location = request.getParameter("location");
				company.setLocation(location);
				retrieveByLocation = companyDelegate.retrieveVacancyByLocation(company);
				if (retrieveByLocation.isEmpty()) {
					request.setAttribute("noVacancy","yes");
					RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/errorlocationresults.jsp");
					rd.forward(request, response);
					
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
