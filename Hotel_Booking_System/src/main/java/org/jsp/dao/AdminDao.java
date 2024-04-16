package org.jsp.dao;

import java.util.List;

import org.jsp.entity.Admin;
import org.jsp.entity.BookingDetails;
import org.jsp.entity.Hotel;

public interface AdminDao {
	
//	to verify admin email and password
	
	Admin login(String email, String password);
	
	void addHotel(Hotel hotel);
	
	List<Hotel> getAllHotelDetails();
	
	boolean deleteHotelById(int id);
	
	Hotel updateHotelDetails(Hotel hotel);
	
	Hotel getHotelById(int id);

	void addUser(Admin admin);
	
	List<Admin> getAllUserDetails();
	
	Admin getAdminById(int id);

	Admin updateAdminDetails(Admin admin);

	boolean deleteAdminById(int adminId);
	
	List<Hotel> getHotelByKeyword(String keyword);
	
	List<Admin> getAdminByKeyword(String keyword);
	
	List<BookingDetails> getAllBookingDetails();

}

