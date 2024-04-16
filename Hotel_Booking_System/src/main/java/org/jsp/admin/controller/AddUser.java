package org.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsp.dao.AdminDao;
import org.jsp.dao.AdminDaoImpl;
import org.jsp.entity.Admin;
import org.jsp.entity.Customer;

@WebServlet("/AddUser")
public class AddUser extends HttpServlet{
	private AdminDao adminDao = new AdminDaoImpl();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String email = req.getParameter("email");
		Long mobile = Long.parseLong(req.getParameter("contact"));
		String password = req.getParameter("password");
		
		Admin admin = new Admin();
		admin.setFirstName(firstName);
		admin.setLastName(lastName);
		admin.setEmail(email);
		admin.setMobile(mobile);
		admin.setPassword(password);
		
		adminDao.addUser(admin);
		
		
		resp.sendRedirect("/Hotel_Booking_System/admin/UserList.jsp?msg=added");

		
	}

}
