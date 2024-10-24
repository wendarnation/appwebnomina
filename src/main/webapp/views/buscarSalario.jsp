<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Obtener Salario</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/buscarSalario.css'/>">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<body>
	<div class="container">
		<div class="h1Container">
		<h1>Obtener Salario de Empleado</h1>
	</div>
	
	<div class="formContainer">
		<form action="empresa" method="post">
    <label for="dni">DNI del Empleado:</label> 
    <input type="text" name="dni" placeholder="Pon el DNI aquí" required> 
    <input type="hidden" name="opcion" value="mostrarSalario"> 
    <input type="submit" value="Buscar">
</form>
		
	<a href="empresa?opcion=inicio"><i class="fas fa-arrow-left"></i> Volver al Inicio</a>
	</div>
	</div>
	
	
</body>
</html>