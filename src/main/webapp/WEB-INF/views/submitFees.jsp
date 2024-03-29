<%@ taglib prefix="j" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <meta name = "viewport" content = "width=device-width, initial-scale = 1">
         
         
             
   <link rel = "stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
      <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script src = "https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

      
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">   

      <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script src = "https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<title>Students List</title>

	 <script type="text/javascript">

     
	 function searchModeDetails()
     {	
		 var searchMode = document.getElementById("searchMode");
		 var searchByName =  document.getElementById("searchByName");
		 var searchByScholarNumber=  document.getElementById("searchByScholarNumber");
		 
		 searchByName.style.display = searchMode.value == "name" ? "block" : "none";
		 searchByScholarNumber.style.display = searchMode.value == "scholarNumber" ? "block" : "none";
		
     }	 
	 
	 function validateform()
            {
            	
				isValid=true;         
                return isValid;
            	   	
            };

            
        </script>


</head>
<body>
<jsp:include page="../../verMenu.jsp"></jsp:include>

<center> 
<br> 
<font color="green"> <h1>${msg }</h1> </font>
<hr> 
<center> 
		<form action="searchStudents" onsubmit="return validateform()" >
			
			<label>Branch :</label>
			<select name="branch">
				<option value="Gyan Jyoti Public School">Gyan Jyoti Public School</option>
				<option value="Gyan Jyoti International School">Gyan Jyoti International School
				</option>
			</select>
		<br> 
		
					<div class="form-group col-md-6">
					<label for="form:inputState">Session :</label> <select name="session" >
						<j:forEach var="session" items="${session}">
					<option value="${session}">${session}</option>
					</j:forEach>
					</select>
				</div>

		<label>Classes : </label> 
			<select name=classes>
				<j:forEach var="classe" items="${classes}">
					<option value="${classe.classes}">${classe.classes}</option>
				</j:forEach>
			</select>
<br>			
				
<label> Search By :</label> 
	<select name="searchMode" id="searchMode" onchange = "searchModeDetails()"> 
	<option value="name"> Choose </option>
	<option value="name"> Name </option>
	<option value="scholarNumber"> Scholar Number</option>
	</select>
		
		<div id="searchByName" style="display: none"> 
		<label> Name </label> <input type="text" id="search" name="searchValue">
		</div>
		
		<div id="searchByScholarNumber" style="display: none"> 
		<label> Scholar Number</label><input type="text" id="search" name="searchValue"> 
		</div>
		
			<br>
			<input type="submit" value="submit">
		
		</form>
</center>

		<br>
		<hr>


		</form>
		<span> </span>
		<!-- Model attritube: students -->
		<!-- Iterating using JSTL -->
		<!--Internally gettterMethod() is getting called : stu.id  -->
		<table class = "table table-hover table-bordered ">
			<tr>
				<th scope="col">S.No</th>
				<th scope="col">Scholar No</th>
				<th scope="col">Class </th>
				<th scope="col">Name </th>
				<th>Father Name</th>
				<th>Contact</th>
				<th scope="col">DOB </th>
				<th scope="col">Category </th>
						<th scope="col">Samagra </th>
				<th scope="col">Branch </th>
				<th scope="col">Session </th>
				<th scope="col">Student Photo </th>
				<th scope="col">Fees Details</th>
				<th scope="col">Remainin Fees</th>
				
			</tr>

			<j:forEach var="stu" items="${studentsList}">
				<tr>
					<td>${stu.id}</td>
					<td>${stu.scholarNumber}</td>
					<td>${stu.stuClass} </td>
					<td>${stu.name}</td>
					<td>${stu.fName}</td>
					<td>${stu.contact}</td>
					<td>${stu.dob}</td>
					<td>${stu.category}</td>
					<td>${stu.samagraId} </td>
					<td>${stu.branch} </td>
					<td>${stu.session} </td>
					<td><img id="aadharPreview" src="data:image/jpeg;base64,${stu.studentPhoto}" height="40" width="40"></td>
					<td> <a href="feesSummary?scholarNumber=${stu.scholarNumber}"> Details/Deposit</a></td> 
					<td><j:forEach var="fees" items="${remFeesList}">
							<j:if test="${stu.scholarNumber==fees.scholarNumberOrName }">${stu.fees-fees.amount }</j:if>
						</j:forEach> 
					</td>
					
				</tr>
			</j:forEach>
		</table>
		<br>

		<p>Total Fees : ${totalFees}</p>
		<br>
		<p>Total Remaining Fees :${totalFees-totalRemFees}</p>
		<br>
		
		

		
		
</center>	

</body>
</html>