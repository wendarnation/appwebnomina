<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Error</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/error.css'/>">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<body>
	<%
	String mensaje = (String) request.getAttribute("mensaje");
	%>
	<h1>Error</h1>
	<p>
		Causa: <strong><%=mensaje != null ? mensaje : "Error desconocido"%></strong>
	</p>

	<%
	if ("Datos no soportados".equals(mensaje)) {
	%>
	<button onclick="window.history.back()">Intentar de nuevo</button>
	<%
}
%>
	<a href="empresa?opcion=inicio"><i class="fas fa-arrow-left"></i> Volver al Inicio</a>
</body>
</html>