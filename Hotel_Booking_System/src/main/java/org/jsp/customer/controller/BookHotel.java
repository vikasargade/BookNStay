package org.jsp.customer.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.print.DocFlavor.INPUT_STREAM;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsp.dao.AdminDao;
import org.jsp.dao.AdminDaoImpl;
import org.jsp.dao.CustomerDao;
import org.jsp.dao.CustomerDaoImple;
import org.jsp.entity.BookingDetails;
import org.jsp.entity.Customer;
import org.jsp.entity.Hotel;

@WebServlet("/bookHotel")
public class BookHotel extends HttpServlet {
	
	private AdminDao adminDao = new AdminDaoImpl();
	private CustomerDao customerDao = new CustomerDaoImple();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//fetch customer from session
		
		HttpSession  session = req.getSession();
		Customer customer = (Customer) session.getAttribute("customerObj");
		
		//fetch HOtel Id
		
		int hotelId= Integer.parseInt(req.getParameter("hotelId"));
		// fetch hotel from db
		
		Hotel hotel= adminDao.getHotelById(hotelId);
		session.setAttribute("hotelObj", hotel);
		
		// fetching Booking Details from hotel form
		
		LocalDate startDate =LocalDate.parse(req.getParameter("startDate"));
		LocalDate endDate =LocalDate.parse(req.getParameter("endDate"));
		int noOfDays = Integer.parseInt(req.getParameter("noOfDays"));
		int noOfPerson = Integer.parseInt(req.getParameter("noOfPersons"));
		int noOfRoom = Integer.parseInt(req.getParameter("noOfRooms"));
		double totalPrice = Double.parseDouble(req.getParameter("price"));
		
		
		BookingDetails  bookingDetails = new BookingDetails();
		bookingDetails.setCustomer(customer);
		bookingDetails.setHotel(hotel);
		bookingDetails.setStartDate(startDate);
		bookingDetails.setEndDate(endDate);
		bookingDetails.setNoOfDays(noOfDays);
		bookingDetails.setNoOfPersons(noOfPerson);
		bookingDetails.setNoOfRooms(noOfRoom);
		bookingDetails.setTotalPrice(totalPrice);
		bookingDetails.setStatus("pending"); // status is pending because payament is not done
		
		customerDao.registerBookingDetails(bookingDetails);
		session.setAttribute("bookingDetails", bookingDetails);
		
		resp.sendRedirect("/Hotel_Booking_System/user/AfterHotelPayment.jsp");

		
	}

}
