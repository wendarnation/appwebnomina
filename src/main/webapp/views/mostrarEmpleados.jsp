<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Lista de Empleados</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mostrarEmpleados.css'/>">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<body>
	<c:if test="${'true' == param.exito}">
		<p class="exito">El empleado se actualizó correctamente.</p>
	</c:if>
	<c:if test="${empty empleados}">
		<p class="sinResultado">No se encontraron empleados</p>
	</c:if>
	<div class="h1Container">
		<h1>Lista de Empleados</h1>
	</div>
	

	<div class="container">
	
	<div class="tableContainer">
		<table>
		<thead>
			<tr>
				<th>Nombre</th>
				<th>DNI</th>
				<th>Sexo</th>
				<th>Categoría</th>
				<th>Años Trabajados</th>
				<th>Acciones</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="empleado" items="${empleados}">
				<tr>
					<td>${empleado.nombre}</td>
					<td>${empleado.dni}</td>
					<td>${empleado.sexo}</td>
					<td>${empleado.categoria}</td>
					<td>${empleado.anyos}</td>
					<td>
						<form action="empresa" method="post" style="display: inline;">
							<input type="hidden" name="dni" value="${empleado.dni}">
							<input type="hidden" name="opcion" value="modificarEmpleado">
							<input type="submit" value="Modificar">
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="empresa?opcion=inicio"><i class="fas fa-arrow-left"></i> Volver al Inicio</a>
<!-- 	<button onclick="location.href='empresa?opcion=buscarEmpleados'">Filtrar</button> -->
	</div>
	
		
	</div>
	
	
</body>
</html>