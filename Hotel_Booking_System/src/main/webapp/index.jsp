<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel</title>
    <style>
        body {
        margin: 0;
        padding: 0;
      	 background-image: url("http://localhost:8080/Hotel_Booking_System/Images/Owall-Hotel-Seoul-Exterior.jpeg"); 
       /* background-image: url("https://pix10.agoda.net/hotelImages/497/4974209/4974209_18052604540065844491.jpg?ca=13&ce=1&s=414x232s"); */
       
        background-repeat:no-repeat;
        background-position: inherit;
        /* background-size: cover; */
        background-attachment: fixed;
        background-size: 100% 100%;
        /* height: 300px; */
        /* position: absolute; */
       }
       a{
        color: white;
       }
      .navbar {
        background-color: rgba(0, 0, 0, 0.5); /* Use RGBA with alpha value less than 1 for transparency */
        }
        .navbar-nav .nav-item a.nav-link {
        color: white; /* Set the text color to white */
        }
        h1{
            color: white;
            text-align: center;
            padding-top: 120px;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light navbar-expand-md">
        <a href="" class="navbar-brand" style="color: white;"> <img src="https://w7.pngwing.com/pngs/927/770/png-transparent-hotel-logo-resort-suite-investment-banking-letter-b-angle-company-text.png" width="50px" style="border-radius: 10px;" alt="No img"> Hotel Booking System</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
           <!--  <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav">
                <li class="nav-item active">
                  <a class="nav-link " href="#">Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link " href="#">SignUp</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link " href="#">Login</a>
                </li>
              </ul> -->
        </div>
        
    </nav>
    <div>
        <h1>Welcome To Hotel Booking Page......!!!</h1>
        <center> 
        
        <br><br>
    	<a href="http://localhost:8080/Hotel_Booking_System/admin/Login.jsp"><button id="btn" class="button btn btn-outline-dark">Admin</button></a>
    	
    	<br><br>
    	
    	<a href="http://localhost:8080/Hotel_Booking_System/user/Login.jsp"><button id="btn" class="button btn btn-outline-dark">Customer</button></a>
        
        </center>
    </div>
</body>
</html>