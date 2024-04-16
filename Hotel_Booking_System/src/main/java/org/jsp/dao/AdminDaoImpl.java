package org.jsp.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.jsp.entity.Admin;
import org.jsp.entity.BookingDetails;
import org.jsp.entity.Hotel;

public class AdminDaoImpl implements AdminDao {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("hotel_booking_system");
	EntityManager manager = factory.createEntityManager();
	EntityTransaction transaction = null;

	public Admin login(String email, String password) {

		String jpql = "SELECT a FROM Admin a WHERE a.email = ?1 AND a.password= ?2";
		Query query = manager.createQuery(jpql);

		query.setParameter(1, email);
		query.setParameter(2, password);

		try {
			Admin admin = (Admin) query.getSingleResult();
			return admin;

		} catch (Exception e) {
			return null;
		}

	}

	public void addHotel(Hotel hotel) {

		transaction = manager.getTransaction();
		/*
		 * transaction.begin(); manager.persist(hotel); transaction.commit();
		 */

		try {
			if (!transaction.isActive())
				transaction.begin();
			manager.persist(hotel);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
		}

	}

	public List<Hotel> getAllHotelDetails() {

		String jpql = "SELECT h FROM Hotel h";

		Query query = manager.createQuery(jpql);
		List<Hotel> hotels = query.getResultList();
		return hotels;
	}

	public boolean deleteHotelById(int id) {
		transaction = manager.getTransaction();
		transaction.begin();

		Hotel hotel = manager.find(Hotel.class, id);
		if (hotel != null) {
			manager.remove(hotel);
			transaction.commit();
			return true;
		}

		return false;
	}

	/*
	 * hotel ref var contains - data which has to be update in a DB. hotelFromDb
	 * contains - old data which is already present in a Db.
	 */

	public Hotel updateHotelDetails(Hotel hotel) {

		transaction = manager.getTransaction();

		Hotel hotelFromDb = manager.find(Hotel.class, hotel.getId());

		if (hotelFromDb != null) {
			hotelFromDb.setHotelName(hotel.getHotelName());
			hotelFromDb.setMobile(hotel.getMobile());
			hotelFromDb.setAddress(hotel.getAddress());
			hotelFromDb.setCity(hotel.getCity());
			hotelFromDb.setNoOfBookedRoom(hotel.getNoOfBookedRoom());
			hotelFromDb.setTotalNoOfRoom(hotel.getTotalNoOfRoom());
			hotelFromDb.setPrice(hotel.getPrice());

			transaction.begin();
			Hotel updatedHotel = manager.merge(hotelFromDb);
			transaction.commit();
			return updatedHotel;
		}

		return null;
	}

	public Hotel getHotelById(int id) {

		Hotel hotel = manager.find(Hotel.class, id);

		if (hotel != null)
			return hotel;

		return null;
	}

	public void addUser(Admin admin) {

		transaction = manager.getTransaction();
//		transaction.begin();
//		manager.persist(admin);
//		transaction.commit();

		try {
			if (!transaction.isActive())
				transaction.begin();
			manager.persist(admin);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
		}
	}

	public List<Admin> getAllUserDetails() {

		String jpql = "SELECT a FROM Admin a";

		Query query = manager.createQuery(jpql);

		List<Admin> admin = query.getResultList();

		return admin;
	}

	public Admin getAdminById(int id) {

		Admin admin = manager.find(Admin.class, id);

		if (admin != null)
			return admin;
		return null;
	}

	public Admin updateAdminDetails(Admin admin) {

		transaction = manager.getTransaction();

		Admin adminFromDb = manager.find(Admin.class, admin.getAdminId());

		if (adminFromDb != null) {
			adminFromDb.setFirstName(admin.getFirstName());
			adminFromDb.setLastName(admin.getLastName());
			adminFromDb.setEmail(admin.getEmail());
			adminFromDb.setMobile(admin.getMobile());
			adminFromDb.setPassword(admin.getPassword());

			transaction.begin();
			Admin adminDetails = manager.merge(adminFromDb);
			transaction.commit();

			return adminDetails;
		}

		return null;
	}

	public boolean deleteAdminById(int adminId) {
		transaction = manager.getTransaction();

		transaction.begin();
		Admin admin = manager.find(Admin.class, adminId);

		if (admin != null) {
			manager.remove(admin);
			transaction.commit();
			return true;
		}

		return false;
	}

	public List<Hotel> getHotelByKeyword(String keyword) {
		// %?1%

		String jpql = "SELECT h FROM Hotel h WHERE CONCAT(h.id,' ',h.hotelName,' ', h.city,' ',h.address,' ',h.mobile) LIKE CONCAT('%', ?1,'%')";

		Query query = manager.createQuery(jpql);
		query.setParameter(1, keyword);
		List<Hotel> hotels = query.getResultList();

		return hotels;
	}

	public List<Admin> getAdminByKeyword(String keyword) {
		
		String jpql = "SELECT a FROM Admin a WHERE CONCAT(a.id,' ',a.firstName,' ',a.lastName,' ',a.mobile,' ',a.email) LIKE CONCAT('%', ?1, '%')";
		Query query = manager.createQuery(jpql);
		query.setParameter(1, keyword);
		List<Admin> admins = query.getResultList();
		return admins;
	}

	public List<BookingDetails> getAllBookingDetails() {
			String jpql = "SELECT b FROM BookingDetails b";
			Query query  = manager.createQuery(jpql);
			List<BookingDetails> details = query.getResultList();
			return details;
	}

}
