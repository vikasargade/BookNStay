package org.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsp.dao.AdminDao;
import org.jsp.dao.AdminDaoImpl;
import org.jsp.entity.Admin;

@WebServlet("/login")
public class AdminLogin extends HttpServlet {

	private AdminDao adminDao = new AdminDaoImpl(); //

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// fetch data from jsp file

		String emailId = req.getParameter("email");
		String password = req.getParameter("password");

		// verify email and password by using DAO;

		Admin admin = adminDao.login(emailId, password);

		if (admin != null) {
			// details are valid
			// forward request to home page
//			String fullName = admin.getFirstName() + " " + admin.getLastName();
//			req.setAttribute("fullName", fullName);

			HttpSession session = req.getSession();
			session.setAttribute("adminObj", admin);

			RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/Home.jsp");
			dispatcher.forward(req, resp);

		} else {
			// details are invalid
			// forward request to login page

			req.setAttribute("message", "Please Enter valid Email or Password.");

			RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/Login.jsp");
			dispatcher.forward(req, resp);
		}

	}

}
