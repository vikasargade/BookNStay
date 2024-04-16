package org.jsp.customer.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

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
import org.jsp.entity.Card;
import org.jsp.entity.Customer;
import org.jsp.entity.Hotel;

@WebServlet("/payment")
public class Payment extends HttpServlet {

	private CustomerDao customerDao = new CustomerDaoImple();
	private AdminDao adminDao = new AdminDaoImpl();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// fetch Booking details from session

		HttpSession session = req.getSession();
		BookingDetails details = (BookingDetails) session.getAttribute("bookingDetails");

		// fetch hotel details from session

		Hotel hotel = (Hotel) session.getAttribute("hotelObj");

		// fetch customer from session

		Customer customer = (Customer) session.getAttribute("customerObj");

		// fetch card details from html form and store into Card Object
		Card card = new Card();
		card.setCardNumber(req.getParameter("cardNumber"));
		card.setCardHolderName(req.getParameter("cardHolderName"));
		card.setCvv(Integer.parseInt(req.getParameter("cvv")));
		card.setExpirayDate(LocalDate.parse(req.getParameter("expireyDate")));

		// add bookingDetails to list
		List<BookingDetails> bookingDetails = new ArrayList<BookingDetails>();
		bookingDetails.add(details);

		card.setBookingDetails(bookingDetails);
		card.setCustomer(customer);

		boolean status = customerDao.addCard(card);

		if (status) {
			// update booking status
			details.setStatus("booked");
			details.setCard(card);
			BookingDetails updateStatus = customerDao.updateStatus(details);

			// update hotel no. of roomBooked

			int totalNoOfBookedRoom = hotel.getNoOfBookedRoom() + details.getNoOfRooms();

			hotel.setNoOfBookedRoom(totalNoOfBookedRoom);

			Hotel updateHotelDetails = adminDao.updateHotelDetails(hotel);

			if (updateHotelDetails != null && updateStatus != null) {
				resp.sendRedirect("/Hotel_Booking_System/user/Payment.jsp?msg=paymant");
			} else {
				resp.sendRedirect("/Hotel_Booking_System/user/AfterHotelPayment.jsp?msg=fail");
			}

		} else {
			resp.sendRedirect("/Hotel_Booking_System/user/AfterHotelPayment.jsp?msg=fail");
		}

	}

}
