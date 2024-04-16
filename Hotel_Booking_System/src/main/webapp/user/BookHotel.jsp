<!DOCTYPE html>
<%@page import="org.jsp.dao.AdminDaoImpl"%>
<%@page import="org.jsp.dao.AdminDao"%>
<%@page import="org.jsp.entity.Customer"%>
<%@page import="org.jsp.entity.Hotel"%>
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

h1, th, td, label {
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
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
				<li class="nav-item active"><a class="nav-link "
					href="/Hotel_Booking_System/user/Home.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link "
					href="/Hotel_Booking_System/user/HotelList.jsp">Hotels</a></li>
				<li class="nav-item"><a class="nav-link "
					href="/Hotel_Booking_System/user/BookingHistory.jsp">Booking
						History</a></li>
				<li class="nav-item"><a class="nav-link "
					href="/Hotel_Booking_System/user/Payment.jsp">Payment</a></li>
			</ul>
		</div>
		<ul class="navbar-nav ml-auto">
			<!-- Add ml-auto class to push "Contact" to the right -->
			<li class="nav-item"><a class="nav-link"
				href="/Hotel_Booking_System/adminlogout">LogOut</a></li>
		</ul>
	</nav>
	<!-- when ever user click book link in bookhotel.html page 
    
    this page will display -->


	<%
	Customer customer = (Customer) session.getAttribute("customerObj");
	AdminDao dao = new AdminDaoImpl();
	Hotel hotel = dao.getHotelById(Integer.parseInt(request.getParameter("hotelId")));
	if (hotel != null) {
	%>

	<div class="container  w-50 p-3 m-5">
		<div class="row justify-content-left">
			<div class="col-md-8">
				<h1 class="mb-4 ">Hotel Booking Form</h1>
				<form action="../bookHotel" method="post">
				<input hidden value="<%=hotel.getId()%>" name="hotelId">

					<div class="row mb-3">
						<div class="col">
							<label for="hotelname" class="form-label">Hotel Name :</label> <input
								type="text" class="form-control" required
								placeholder="Hotel Name" value="<%=hotel.getHotelName()%>" readonly="readonly">
						</div>
						<div class="col"></div>
						
					</div>
					<div class="row mb-3">
						<div class="col">
							<label for="firstname" class="form-label">First Name :</label> <input
								type="text" class="form-control" placeholder="First Name"
								required value="<%=customer.getFirstName()%>" name="firstName" readonly="readonly">

						</div>
						<div class="col">
							<label for="lastname" class="form-label">Last Name:</label> <input
								type="text" class="form-control" placeholder="Last Name "
								required value="<%=customer.getLastName()%>" name="lastName" readonly="readonly">
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<label for="email" class="form-label">Email :</label> <input
								type="email" class="form-control" placeholder="Email" required
								value="<%=customer.getEmail()%>" name="email" readonly="readonly">
						</div>
						<div class="col">
							<label for="contact" class="form-label">Mobile Number :</label> <input
								type="text" class="form-control" placeholder="Mobile Number"
								required value="<%=customer.getMobile()%>" name="contact" readonly="readonly">
						</div>
					</div>
					
					
					<div class="row mb-3">
						<div class="col">
							<label for="startDate" class="form-label">Start Date
								:</label> <input type="date" class="form-control"
								placeholder="Booking Date" required
								 name="startDate" id="startDate">
						</div>
						<div class="col">
							<label for="endDate" class="form-label">End Date
								:</label> <input type="date" class="form-control"
								placeholder="Booking Date" required
								 name="endDate" id="endDate">
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<label for="noofdays" class="form-label">No of Days :</label> <input
								type="number" class="form-control" placeholder="No of Days"
								required id="days"  readonly="readonly" name="noOfDays">
						</div>
						<div class="col">
							<label for="noofpersons" class="form-label">No of Persons
								:</label> <input type="number" class="form-control"
								placeholder="No of Persons(Max 3)" required min="1" max="3" name="noOfPersons">
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<label for="noofrooms" class="form-label">No of Rooms :</label> <input
								type="text" class="form-control" placeholder="No of Rooms"
								required id="rooms" oninput="calculatePrice()" onclick="calculatePrice()" name="noOfRooms">
						</div>
						<!--  <div class="col">
                        <label for="price" class="form-label">Price :</label>
                        <input type="number" class="form-control"  placeholder="Enter Price " required name="price">
                    </div> -->
						<div class="col">
							<label for="Total Price" class="form-label">Price :</label> <input
								type="number" class="form-control" placeholder="Enter Price "
								required readonly="true" name="price"
								style="background-color: yellow; font-weight: bold;" id="price">
						</div>
					</div>
					<!-- <button type="submit" class="btn btn-outline-dark">Create Account</button> -->
					<!-- <a href="AfterHotelPayment.html" id="btn"
						class="button btn btn-outline-dark">Pay Amount</a> -->
						<input id="btn" class="button btn btn-outline-dark" type="submit">
				</form>
			</div>
		</div>
	</div>
	<%
	} else {
	%>

	<center>
		<h2 style="color: red;">Error While Fetching Hotel Details.</h2>
		<h2 style="color: red;">Kindly Check Hotel Id.</h2>
	</center>
	<%
	}
	%>

	<script>
	
	function calculatePrice() {
		let noOfRooms = document.getElementById("rooms").value;
		/* let priceInputbox = document.getElementById("price");  */
		let price =<%=hotel.getPrice()%>;
		let noOfDays = calculateDays();
		document.getElementById("days").value = noOfDays;
		
		let oneDay = addPrice(price, noOfRooms);

		document.getElementById("price").value = addPrice(oneDay, noOfDays);
	}

	
    function calculateDays() {
		let checkinDate = new Date(document.getElementById("startDate").value);
        let checkoutDate = new Date(document.getElementById("endDate").value);
        
        if(checkinDate>checkoutDate){
        	document.getElementById("startDate").style.borderColor = 'red';
        	alert("start date should be less than end date");
        	return 0;
        	}
        
        let oneDay = 24 * 60 * 60 * 1000; 
        let diffDays = Math.round(Math.abs((checkoutDate - checkinDate) / oneDay));
        return diffDays; 
 	}
		
		function addPrice(price, number) {
			let sum = 0;
			for (var i = 0; i < number; i++) {
				sum += price;
			}
			return sum;
		}
	
		/* $(function(){
			
			var dtToday = new Date();
			
			var month = dtToday.getMonth() + 1;
			var day = dtToday.getDate();
			var year = dtToday.getFullYear();
			
			if(month<10)
				month = '0' +month.toString();
			if(day < 10)
				day ='0' + day.toString();
			var = maxDate = year + '-' + month + '-' + day;
			$('#startDate').attr('min',maxDate);
			$('#endDate').attr('min',maxDate);
			
		}); */
		
	</script>
</body>


</html>
