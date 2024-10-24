
package com.awn.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.awn.conexion.Conexion;
import com.awn.model.*;
import com.awn.exception.DatosNoCorrectosException;

public class EmpleadoDAO {
    
	public boolean actualizarEmpleado(String dni, String nombre, String sexo, Integer categoria, Integer anyos)
	        throws DatosNoCorrectosException {
	    String sql = "UPDATE EMPLEADOS SET nombre = ?, sexo = ?, categoria = ?, anyos = ? WHERE dni = ?";
	    
	    try (Connection con = Conexion.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
	        // Actualización del empleado
	        st.setString(1, nombre);
	        st.setString(2, sexo);
	        st.setInt(3, categoria);
	        st.setInt(4, anyos);
	        st.setString(5, dni);

	        st.executeUpdate();
	        
	        // Recalcular y actualizar salario en la tabla nominas
	        Empleado empleadoActualizado = new Empleado(nombre, dni, sexo.charAt(0), categoria, anyos);
	        actualizarSalario(empleadoActualizado, con);
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }

	    return true;
	}

	private void actualizarSalario(Empleado empleado, Connection con) throws SQLException {
	    // Calcula el nuevo salario usando la clase Nomina
	    Nomina nomina = new Nomina();
	    double nuevoSalario = nomina.sueldo(empleado);
	    
	    // Actualizar el sueldo en la tabla nominas
	    String sqlNomina = "UPDATE NOMINAS SET sueldoFinal = ? WHERE dni = ?";
	    
	    try (PreparedStatement stNomina = con.prepareStatement(sqlNomina)) {
	        stNomina.setDouble(1, nuevoSalario);
	        stNomina.setString(2, empleado.getDni());
	        stNomina.executeUpdate();
	    }
	}

	
	public List<Empleado> obtenerEmpleados() throws DatosNoCorrectosException {

		List<Empleado> empleados = new ArrayList<>();
		String sql = "SELECT * FROM EMPLEADOS";

		try (Connection con = Conexion.getConnection();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(sql)) {

			while (rs.next()) {

				String nombre = rs.getString("nombre");
				String dni = rs.getString("dni");
				Character sexo = rs.getString("sexo").charAt(0);
				Integer categoria = rs.getInt("categoria");
				Integer anyos = rs.getInt("anyos");

				Empleado empleado = new Empleado(nombre, dni, sexo, categoria, anyos);
				empleados.add(empleado);
			}

		} catch (SQLException e) {
			System.out.println(e);
		}

		return empleados;
	}
	
	public List<Empleado> obtenerEmpleadosFiltrados(String nombre, String dni, String sexo, Integer categoria, Integer anyos) throws DatosNoCorrectosException {
	    List<Empleado> empleados = new ArrayList<>();
	    StringBuilder sql = new StringBuilder("SELECT nombre, dni, sexo, categoria, anyos FROM EMPLEADOS WHERE 1=1");

	    // Agregar condiciones dinámicamente
	    if (nombre != null && !nombre.trim().isEmpty()) {
	        sql.append(" AND nombre LIKE ?");
	    }
	    if (dni != null && !dni.trim().isEmpty()) {
	        sql.append(" AND dni LIKE ?");
	    }
	    if (sexo != null && !sexo.trim().isEmpty()) {
	        sql.append(" AND sexo = ?");
	    }
	    if (categoria != null) {
	        sql.append(" AND categoria = ?");
	    }
	    if (anyos != null) {
	        sql.append(" AND anyos = ?");
	    }

	    try (Connection con = Conexion.getConnection();
	         PreparedStatement st = con.prepareStatement(sql.toString())) {

	        int paramIndex = 1;
	        if (nombre != null && !nombre.trim().isEmpty()) {
	            st.setString(paramIndex++, "%" + nombre + "%");
	        }
	        if (dni != null && !dni.trim().isEmpty()) {
	            st.setString(paramIndex++, "%" + dni + "%");
	        }
	        if (sexo != null && !sexo.trim().isEmpty()) {
	            st.setString(paramIndex++, sexo);
	        }
	        if (categoria != null) {
	            st.setInt(paramIndex++, categoria);
	        }
	        if (anyos != null) {
	            st.setInt(paramIndex++, anyos);
	        }

	        ResultSet rs = st.executeQuery();
	        while (rs.next()) {
	            String nombreEmpleado = rs.getString("nombre");
	            String dniEmpleado = rs.getString("dni");
	            Character sexoEmpleado = rs.getString("sexo").charAt(0);
	            Integer categoriaEmpleado = rs.getInt("categoria");
	            Integer anyosEmpleado = rs.getInt("anyos");

	            Empleado empleado = new Empleado(nombreEmpleado, dniEmpleado, sexoEmpleado, categoriaEmpleado, anyosEmpleado);
	            empleados.add(empleado);
	        }

	    } catch (SQLException e) {
	        System.out.println(e);
	    }

	    return empleados;
	}

	
	public Integer obtenerSalario(String dni) {

		Integer salario = null;
		String sql = "SELECT SUELDOFINAL FROM NOMINAS WHERE DNI = '" + dni + "'";

		try (Connection con = Conexion.getConnection();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(sql)) {

			if (rs.next()) {
				salario = rs.getInt("sueldofinal");
			}

		} catch (SQLException e) {
			System.out.println(e);
		}

		return salario;
	}
	
	public int modificarEmpleado(String dni, String campo, String valor) {

		if (campo.equalsIgnoreCase("nombre") || campo.equalsIgnoreCase("sexo")) {
			valor = "'" + valor + "'";
		}

		String sql = "UPDATE EMPLEADOS SET " + campo + " = " + valor + " WHERE DNI = '" + dni + "'";

		try (Connection con = Conexion.getConnection(); Statement st = con.createStatement()) {

			return st.executeUpdate(sql);

		} catch (SQLException e) {
			System.out.println(e);
			return 0;
		}
	}
	
	public Empleado obtenerEmpleado(String dni) throws DatosNoCorrectosException {

		Empleado empl = null;
		String sql = "SELECT * FROM EMPLEADOS WHERE DNI = '" + dni + "'";

		try (Connection con = Conexion.getConnection();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(sql)) {

			if (rs.next()) {
				String nombreEmpleado = rs.getString("nombre");
				String dniEmpleado = rs.getString("dni");
				Character sexoEmpleado = rs.getString("sexo").charAt(0);
				Integer categoriaEmpleado = rs.getInt("categoria");
				Integer anyosEmpleado = rs.getInt("anyos");

				empl = new Empleado(nombreEmpleado, dniEmpleado, sexoEmpleado, categoriaEmpleado, anyosEmpleado);
			}

		} catch (SQLException e) {
			System.out.println(e);
		}

		return empl;

	}
}

