package com.awn.model;

public class Nomina {
	
	private static final int SUELDO_BASE[] = {50000, 70000, 90000, 110000, 130000, 150000, 170000, 190000, 210000, 230000};
	

	// Calcula nómina teniendo en cuenta categoría y años trabajados
	public double sueldo(Empleado emp) {
		
		int categoriaSueldo = emp.getCategoria();
		double sueldo = SUELDO_BASE[categoriaSueldo-1] + 5000*emp.getAnyos();
		return sueldo;
	}

}
