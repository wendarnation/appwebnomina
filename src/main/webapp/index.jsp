<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Menu de opciones para empresa</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/index.css'/>">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<body>
	<div class="indexContainer">
	<h1>Menu de opciones para empresa</h1>
	</div>
	
	<div class="indexContainerTable">
    <table>
    <tr>
        <td>
            <a href="<c:url value='empresa?opcion=mostrarEmpleados'/>">
                <i class="fa-solid fa-address-card fa-2x"></i> Lista de Empleados
            </a>
        </td>
    </tr>
    <tr>
        <td>
            <a href="<c:url value='empresa?opcion=buscarSalario'/>">
                <i class="fas fa-money-bill-wave fa-2x"></i> Mostrar salario de un empleado
            </a>
        </td>
    </tr>
    <tr>
        <td>
            <a href="<c:url value='empresa?opcion=buscarEmpleados'/>">
                <i class="fas fa-search fa-2x"></i> Buscar Empleado
            </a>
        </td>
    </tr>
</table>
    
</div>
	
	
	
</body>
</html>

