package org.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsp.entity.Admin;

@WebServlet("/logout")
public class AdminLogout extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);

		if (session != null || session.getAttribute("adminObj") != null) {

			session.removeAttribute("adminObj");// it removes the values from an object
			session.invalidate();// it delete the session object

			resp.sendRedirect("/Hotel_Booking_System/admin/Login.jsp");
		}

	}
}
