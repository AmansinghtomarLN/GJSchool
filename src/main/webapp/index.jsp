<html>
<head>
<meta charset="ISO-8859-1">
<meta name = "viewport" content = "width=device-width, initial-scale = 1">
    
       <link rel = "stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
      <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script src = "https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <title>Dashboard</title>
	
	<style>
	html, body {
	  height: 100%;
	  margin: 0;
	}

	body {
	  background: url('<%= request.getContextPath() %>/images/bg.png') no-repeat center center fixed;
	  background-size: cover;
	}
	</style>

</head>
<style>
/* 🔥 Transparent Glass Button */
a {
  display: inline-block;
  padding: 10px 20px;
  margin: 8px;
  
  /* transparent look */
  background: rgba(255, 255, 255, 0.1);
  color: white;
  
  text-decoration: none;
  border-radius: 10px;
  font-weight: bold;

  /* glass effect */
  backdrop-filter: blur(8px);
  -webkit-backdrop-filter: blur(8px);

  border: 1px solid rgba(255,255,255,0.3);

  /* 3D shadow */
  box-shadow: 
    0 5px 15px rgba(0,0,0,0.3);

  transition: all 0.3s ease;
}

/* 🔥 Hover effect */
a:hover {
  background: rgba(255, 255, 255, 0.2);
  transform: translateY(-3px) scale(1.05);
  box-shadow: 
    0 8px 20px rgba(0,0,0,0.4),
    0 0 10px rgba(255,255,255,0.5);
}

/* 🔥 Click effect */
a:active {
  transform: translateY(2px);
  box-shadow: 
    0 3px 10px rgba(0,0,0,0.3);
}
</style>
<body>

<jsp:include page="verMenu.jsp"></jsp:include>
<br>
<a href="admissionForm">Admission Form</a>
<br> 
<a href="studentsList">Students List</a>
<br> 
<a href="submitFees">Fees Submit</a>
<br> 
<a href="session">Session</a>
<br> 
<a href="classes">addClasses</a>
<br> 
<a href="session">addSession</a>
<br>
<a href="category">addCategory</a>
<br> 
<a href="adLogin">Administrative login</a>
<br> 
<a href="feesReport">Fees Report</a>
<br> 
</body>
</html>
