package com.zilker.onlinejobsearch.servlet;

import java.io.IOException;
import java.util.logging.Level;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zilker.onlinejobsearch.beans.User;
import com.zilker.onlinejobsearch.beans.UserTechnologyMapping;
import com.zilker.onlinejobsearch.delegate.UserDelegate;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
			 HttpSession session=request.getSession(); 
			int role=0;
			UserDelegate userDelegate = new UserDelegate();
			User user = new User();
			String password = request.getParameter("psw");
			String email = request.getParameter("email");
			user.setEmail(email);
			user.setPassword(password);
			role = userDelegate.login(user);
			session.setAttribute("email",email); 
			if (role == 0) {
				response.sendRedirect("Pages/jsp/index.jsp");
			} else if (role == 1) {
				RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/findjob.jsp");
				rd.forward(request, response);
				
			} else if (role == 2) {
				RequestDispatcher rd = request.getRequestDispatcher("Pages/jsp/admin.jsp");
				rd.forward(request, response);
			} 
		
			}catch(Exception e) {
				response.sendRedirect("Pages/jsp/error.jsp");
			}
	}

}
