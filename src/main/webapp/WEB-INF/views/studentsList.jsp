<%@ taglib prefix="j" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
<br> 

<font color="green"> </font><h1>${msg }</h1> </font>
<hr> 
<CENTER>

	<h3> Students Details</h3>

		<form action="searchStudents" onsubmit="return validateform()" >
			<label> Branch :</label>
			<select name="branch">
				<option value="Gyan Jyoti Public School">Gyan Jyoti Public School</option>
				<option value="Gyan Jyoti International School">Gyan Jyoti International School
				</option>
			</select>
					<div class="form-group col-md-6">
					<label for="form:inputState">Session :</label> <select name="session" >
						<j:forEach var="session" items="${session}">
					<option value="${session}">${session}</option>
					</j:forEach>
					</select>
				</div>
				
		<label>Class : </label> 
			<select name="classes">
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
		
  <br> Show
   <select name="recordsPerPage">
  <option value="2">20</option>
  <option value="40">40</option>
  <option value="60">60</option>
  <option value="80">80</option>
  <option value="100">100</option>
  </select> entries
			<br>
			<input type="submit" value="submit">
		
		</form>
</CENTER>

		<br>


		</form>
		<span> </span>
		<!-- Model attritube: students -->
		<!-- Iterating using JSTL -->
		<!--Internally gettterMethod() is getting called : stu.id  -->
		<table class = "table table-hover table-bordered ">
		<thead>
			<tr>
				<th scope="col">S.No</th>
				<th >Scholar No</th>
				<th scope="col"> Name </th>
				<th scope="col"> Gender </th>
				<th scope="col">Father </th>
				<th scope="col">Classes</th>
				<th scope="col">Contact</th>
				<th scope="col"> DOB </th>
				<th scope="col"> Category </th>
				<th scope="col"> Bank </th>
				<th scope="col"> Account No </th>
				<th scope="col"> IFSC </th>
				<th scope="col"> Aadhar </th>
				<th scope="col"> Samagra </th>
				<th scope="col"> Branch </th>
				<th scope="col"> Session </th>
				<th scope="col"> Student Photo </th>
				<th scope="col">Fees Details</th>
				<th scope="col">Remainin Fees</th>
				<th scope="col"> Action </th>
				
			</tr>
</thead>
			<j:forEach var="stu" items="${studentsList}">
				<tr>
					<td>${stu.id}</td>
					<td>${stu.scholarNumber}</td>
					<td>${stu.name}</td>
					<td>${stu.gender}</td>
					<td>${stu.fName}</td>
					<td>${stu.stuClass}</td>
					<td>${stu.contact}</td>
					<td>${stu.dob}</td>
					<td>${stu.category}</td>
					<td>${stu.bankName}</td>
					<td>${stu.accNo} </td>
					<td> ${stu.ifsc}</td>
					<td>${stu.aadhar} </td>
					<td>${stu.samagraId} </td>
					<td>${stu.branch} </td>
					<td>${stu.session} </td>
					<td><img id="aadharPreview" src="data:image/jpeg;base64,${stu.studentPhoto}" height="40" width="40"></td>
					<td> <a href="submitFees"> Submit Fees</a></td> 
					<td><j:forEach var="fees" items="${remFeesList}">
							<j:if test="${stu.scholarNumber==fees.scholarNumberOrName}">${stu.fees-fees.amount }</j:if>
						</j:forEach> </td>
					<td>
					<a href="updateStudents?userId=${stu.id}"> <i class="fas fa-edit"></i></a>
					<a href="deleteStudent?scholarNumber=${stu.scholarNumber}" onclick="if (!(confirm('Are you sure you want to Delete'))) return false">
							<i class="fas fa-trash"></i></a></td>
					
				</tr>
			</j:forEach>
		</table>
		<br>
<center>

  
  <%--For displaying Page numbers. The when condition does not display
              a link for the current page--%>

<table border="1" cellpadding="5" cellspacing="5">
      <tr>
          <j:forEach begin="1" end="${totalPageCount}" var="i">
              <j:choose>
                  <j:when test="${currentPage eq i}">
                      <td>${i}</td>
                  </j:when>
                  <j:otherwise>
                      <td><a href="studentsList?currentPage=${i}">${i}</a></td>
                  </j:otherwise>
              </j:choose>
          </j:forEach>
      </tr>
  </table>  
  

  
  
   
		<p>Total Fees : ${totalFees}</p>
		<br>
		<p>Total Remaining Fees :${totalFees-totalRemFees}</p>
		<br>
		</center>
	



</body>
</html>