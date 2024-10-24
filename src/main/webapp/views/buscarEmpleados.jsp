<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Buscar Empleados</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/buscarEmpleados.css'/>">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
	<div class="container">
		<div class="h1Container">
			<h1>Buscar Empleados</h1>
		</div>

		<form action="empresa" method="post">
			<div class="dosContainer">
				<div class="formContainer">
					<label for="nombre">Nombre:</label> <input type="text"
						name="nombre" id="nombre" placeholder="Cualquiera"> <label
						for="dni">DNI:</label> <input type="text" name="dni" id="dni"
						placeholder="Cualquiera"> <label for="sexo">Sexo:</label>
					<select name="sexo" id="sexo">
						<option value="">Cualquiera</option>
						<option value="M">Masculino</option>
						<option value="F">Femenino</option>
					</select>
				</div>

				
				<div class="formContainer">
					<label for="categoria">Categoria:</label> <input type="number"
						name="categoria" id="categoria" placeholder="Cualquiera">

					<label for="anyos">Anyos Trabajados:</label> <input type="number"
						name="anyos" id="anyos" placeholder="Cualquiera">
					<div style="text-align: left;">
						<input type="submit" value="Buscar">
					</div>
				</div>
			</div>


			<input type="hidden" name="opcion" value="mostrarEmpleadosFiltrados">

			

		</form>
		<a href="empresa?opcion=inicio"><i class="fas fa-arrow-left"></i>
			Volver al Inicio</a>
	</div>


</body>
</html>