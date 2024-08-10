<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ page import="com.abc.carportal.entity.Car"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <!-- Access the Static Resources without using spring URL -->
    <link href="/css/style2.css" rel="stylesheet" />
    <script src="/js/custom.js"></script>
	<style>
		.container {
    padding-top: 0px;
	}

	
	body {
      	background-color: #1c0d342a;
    }
    
	</style>
</head>

<body>

    <%@ include file="menu.jsp"%>

    <!-- First Container -->
    <div class="container">
		
			<form:form method="POST" action="/cars" modelAttribute="car" enctype="multipart/form-data">
				<input type="hidden" value="${_csrf.token}" />
				<form:hidden path="id" />
				<h2>Sell a Car</h2>
		
				<div class="form-group">
						<label for="carphoto">Upload Car Photo:</label> 
						<input type="file" name="file"  class="text-group" required />
				</div>
		
				<div class="form-group">
					<label for="make">Car Make:</label>
					<div class="input-group">
						<select name="make" class="form-control" path="make" required>
							<option value="default">Select Make</option><!-- /.option-->
							<option value="toyota">Toyota</option><!-- /.option-->
							<option value="holden">Holden</option><!-- /.option-->
							<option value="mercedes-benz">Mercedes-Benz</option><!-- /.option-->
							<option value="honda">Honda</option><!-- /.option-->
							<option value="ford">Ford</option><!-- /.option-->
							<option value="chevrolet">Chevrolet</option><!-- /.option-->
							<option value="nissan">Nissan</option><!-- /.option-->
							<option value="audi">Audi</option><!-- /.option-->
							<option value="bmw">BMW</option><!-- /.option-->
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="model">Car Model:</label>
					<div class="input-group">
						<select name="model" class="form-control" path="model" required>
							<option value="default">Select Model</option>
							<option value="corolla">Corolla</option>
							<option value="camry">Camry</option>
							<option value="hilux">Hilux</option>
							<option value="rav4">RAV4</option>
							<option value="civic">Civic</option>
							<option value="accord">Accord</option>
							<option value="cruze">Cruze</option>
							<option value="malibu">Malibu</option>
							<option value="sonata">Sonata</option>
							<option value="elantra">Elantra</option>
							<option value="santa-fe">Santa Fe</option>
							<option value="sentra">Sentra</option>
							<option value="altima">Altima</option>
							<option value="maxima">Maxima</option>
							<option value="a3">A3</option>
							<option value="a4">A4</option>
							<option value="c-class">C-Class</option>
							<option value="e-class">E-Class</option>
							<option value="3-series">3 Series</option>
							<option value="5-series">5 Series</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="body">Body Style:</label>
					<div class="input-group">
						<select name="bodyStyle" class="form-control"  path="bodyStyle" required>
							<option value="default">Select Body Style</option>
							<option value="sedan">Sedan</option>
							<option value="hatchback">Hatchback</option>
							<option value="coupe">Coupe</option>
							<option value="convertible">Convertible</option>
							<option value="suv">SUV (Sport Utility Vehicle)</option>
							<option value="crossover">Crossover</option>
							<option value="minivan">Minivan</option>
							<option value="pickup">Pickup Truck</option>
							<option value="van">Van</option>
							<option value="wagon">Station Wagon</option>
							<option value="truck">Truck</option>							
						</select>
					</div>
				</div>
				
				<div class="form-group">
						<label for="price">Car Price:</label>
						<form:input path="price"  class="text-group" type="number" />
				</div>				
		
				<input type="submit" class="btn-primary" name="Add" value="Save" />
				<input type="button" class="btn-primary" value="Cancel" onclick="cancel()" />
		
				<script>
					function cancel() {
						window.location.href = "cars"
					}
				</script>
			</form:form>
		</div>
	</body>
</html>
