<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Salario del Empleado</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/mostrarSalario.css'/>">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<body>
	<div class="container">
		<div class="h1Container">
			<h1>Salario del Empleado</h1>
		</div>
		<div class="contentContainer">
			<p>
				DNI: <strong>${dni}</strong>
			</p>
			<p>
				Salario: <strong>${salario != null ? salario : "No Encontrado"}
					${salario != null ? "€" : "" }</strong>
			</p>
			<button onclick="location.href='empresa?opcion=buscarSalario'">Buscar
				otro DNI</button>
			<a href="empresa?opcion=inicio"><i class="fas fa-arrow-left"></i> Volver al Inicio</a>
		</div>
	</div>

</body>
</html>