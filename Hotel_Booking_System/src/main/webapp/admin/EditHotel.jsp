<!DOCTYPE html>
<%@page import="org.jsp.entity.Hotel"%>
<%@page import="org.jsp.dao.AdminDaoImpl"%>
<%@page import="org.jsp.dao.AdminDao"%>
<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hotel</title>
<style>
body {
	margin: 0;
	padding: 0;
	background-image:
		url("http://localhost:8080/Hotel_Booking_System/Images/Owall-Hotel-Seoul-Exterior.jpeg");
	background-repeat: no-repeat;
	background-position: inherit;
	/* background-size: cover; */
	background-attachment: fixed;
	background-size: 100% 100%;
	/* height: 300px; */
	/* position: absolute; */
}

a {
	color: white;
}

.navbar {
	background-color: rgba(0, 0, 0, 0.5);
	/* Use RGBA with alpha value less than 1 for transparency */
}

.navbar-nav .nav-item a.nav-link {
	color: white; /* Set the text color to white */
}

#btn {
	color: white;
}

label {
	color: white;
}

h2 {
	color: white;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light navbar-expand-md">
		<a href="" class="navbar-brand" style="color: white;"> <img
			src="https://w7.pngwing.com/pngs/927/770/png-transparent-hotel-logo-resort-suite-investment-banking-letter-b-angle-company-text.png"
			width="50px" style="border-radius: 10px;" alt="No img"> Hotel
			Booking System
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link " href="/Hotel_Booking_System/admin/Home.jsp">Home</a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Hotels </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="http://localhost:8080/Hotel_Booking_System/admin/AddHotel.jsp">Add
								Hotel</a></li>
						<li><a class="dropdown-item" href="http://localhost:8080/Hotel_Booking_System/admin/HotelList.jsp">Hotel
								List</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Users </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="/Hotel_Booking_System/admin/AddUser.jsp">Add
								Users</a></li>
						<li><a class="dropdown-item" href="/Hotel_Booking_System/admin/UserList.jsp">User
								List</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Booking </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="/Hotel_Booking_System/admin/BookingList.jsp">Booking
								List</a></li>
					</ul></li>
				<li class="nav-item"><a class="nav-link "
					href="/gotoPaymentList">Payment</a></li>
			</ul>
		</div>
		<ul class="navbar-nav ml-auto">
			<!-- Add ml-auto class to push "Contact" to the right -->
			<li class="nav-item"><a class="nav-link" href="/Hotel_Booking_System/logout">LogOut</a>
			</li>
		</ul>
	</nav>
	
	<%
		//find hotelId from url
		int hotelId = Integer.parseInt(request.getParameter("hotelId"));
		
		// call getHotelByID method
		AdminDao dao = new AdminDaoImpl();
		Hotel hotel = dao.getHotelById(hotelId);
		if(hotel != null){
	%>	
		
	
	<div class="container  w-50 p-3 m-5">
		<div class="row justify-content-left">
			<div class="col-md-8">
				<h2 class="mb-4 ">Edit Hotel</h2>
				<form action="../updateHotel" method="post">
					<div class="row mb-3">
						<div class="col">
						<input hidden value="<%=hotel.getId()%>" name="id">
							<label for="hotelname" class="form-label">Hotel Name :</label> <input
								type="text" class="form-control" placeholder="Hotel Name"
								 required value="<%= hotel.getHotelName()%>" name="hotelName">
						</div>
						<div class="col">
							<label for="contact" class="form-label">Contact Number :</label>
							<input type="text" class="form-control"
								placeholder="Contact Number " 
								required value="<%= hotel.getMobile()%>" name="contact">
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<label for="price" class="form-label">Price :</label> <input
								type="number" class="form-control" placeholder="Enter Price"
								 required value="<%= hotel.getPrice()%>" name="price">
						</div>
						<div class="col">
							<label for="city" class="form-label">City :</label> <input
								type="text" class="form-control" placeholder="Enter City"
								 required value="<%= hotel.getCity() %>" name="city">
						</div>
					</div>
					

						<div class="col">
							<label for="address" class="form-label">Address :</label> <input
								type="text" class="form-control" placeholder="Enter Address"
								 required value="<%= hotel.getAddress()%>" name="address">
						</div>
						
						
						<div class="col">
							<label for="totalRooms" class="form-label">Total No. Of Rooms :</label> <input
								type="text" class="form-control" placeholder="Enter Total No.of Rooms"
								 required value="<%= hotel.getTotalNoOfRoom()%>" name="totalRooms">
						</div>
						
						</div>
						<div class="row mb-3">
						<div class="col">
							<label for="bookedRooms" class="form-label">No. Of Booked Rooms :</label> <input
								type="text" class="form-control" placeholder="Enter No. Of Booked Rooms"
								 required value="<%= hotel.getNoOfBookedRoom()%>" name="bookedRooms">
						</div>
						
					</div>
					<button type="submit" class="btn btn-outline-dark">EDIT
						HOTEL</button>
					<!-- <a href="#" id="btn" class="button btn btn-outline-dark"> ADD HOTEL</a> -->
				</form>
			</div>
		</div>
	</div>
	<%}
		else{%>
		
		<center style="color: red;"><h2> Error While Fetching The Hotel Details</h2></center>
		<%} %>

</body>
</html>