package org.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsp.dao.AdminDao;
import org.jsp.dao.AdminDaoImpl;

@WebServlet("/DeleteAdmin")
public class DeleteAdmin extends HttpServlet {

	private AdminDao adminDao = new AdminDaoImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String adminId = req.getParameter("adminId");
		int adId = Integer.parseInt(adminId);
		
		boolean status = adminDao.deleteAdminById(adId);
		
		if(status)
		{
			req.setAttribute("message", "ADMIN DELETED SUCESSFULLY!!!");
		}
		else
		{
			req.setAttribute("message", "UNABLE TO DELETE ADMIN.");
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/UserList.jsp");
		dispatcher.forward(req, resp);
		
	}
}
