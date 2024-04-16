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

@WebServlet("/updateAdmin")
public class UpdateAdmin extends HttpServlet{

	private AdminDao  adminDao = new AdminDaoImpl(); 
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Admin admin =  new Admin();
		
		admin.setAdminId(Integer.parseInt(req.getParameter("id")));
		admin.setFirstName(req.getParameter("firstName"));
		admin.setLastName(req.getParameter("lastName"));
		admin.setEmail(req.getParameter("email"));
		admin.setMobile(Long.parseLong(req.getParameter("contact")));
		admin.setPassword(req.getParameter("password"));
		
		Admin adminDetails = adminDao.updateAdminDetails(admin);
		
		resp.sendRedirect("/Hotel_Booking_System/admin/UserList.jsp?msg=update");
	}
	
}
