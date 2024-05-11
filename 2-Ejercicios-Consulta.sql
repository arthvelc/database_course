USE Aerolineas;
--1.  Seleccionar el nombre de todos los tipos de aviones con más mas de 200 asientos
SELECT tipoAvion 
FROM TipoAvion 
WHERE numAsientos > 200;
--2.  Seleccionar el nombre de todos los tipos de aviones con más mas de 200 asientos, con la siguiente leyenda: "El avión" <tipo avión> "tiene una capacidad de " <num asientos> "asientos"
SELECT 'El avión ' + tipoAvion + ' tiene una capacidad de ' + CAST(numAsientos AS varchar(10)) + ' asientos' 
FROM TipoAvion 
WHERE numAsientos > 200;

--3.  Seleccionar el nombre, apellido paterno y apellido materno de todos los empleados de las aerolíneas
SELECT p.nombre, p.paterno, p.materno 
FROM Empleado;

--4.  Seleccionar el nombre, apellido paterno y apellido materno de todos los empleados de las aerolíneas concatenados en una sola columna con el alias nombre del empleado.
SELECT p.nombre + ' ' + p.paterno + ' ' + ISNULL(p.materno, '') AS nombre_del_empleado 
FROM Empleado e 
JOIN Persona p ON e.idPersona = p.IdPersona;

--5.  Seleccionar el nombre, apellido paterno y apellido materno de todos los empleados de las aerolíneas con la siguiente leyenda "bienvenido, " <nombre completo de la persona> ", hoy es " <fecha actual>
--6.  Seleccionar el nombre completo de todas las personas en la base de datos que cumplan años hoy y mostrarlo como "Felices " <edad> " años " <nombre completo> "!!!"
--7.  mostrar la antigüedad en años de todos los aviones almacenados en la base de datos
SELECT matricula, DATEDIFF(YEAR, fechaFabricacion, GETDATE()) AS antiguedad_en_años 
FROM Avion;

--8.  mostrar la fecha exacta del siguiente mantenimiento de los aviones tomando como referencia la fecha del último, ordenándolos por el que esté más próximo a vencer
SELECT matricula, DATEADD(MONTH, mesesMantenimiento, UltimoMantenimiento) AS siguiente_mantenimiento 
FROM Avion 
ORDER BY siguiente_mantenimiento;

--9.  mostrar el tiempo en días que falta para el mantenimiento de los aviones tomando como referencia la fecha del último, ordenándolos por el que esté más próximo a vencer
SELECT matricula, DATEDIFF(DAY, UltimoMantenimiento, DATEADD(MONTH, mesesMantenimiento, UltimoMantenimiento)) AS dias_para_mantenimiento 
FROM Avion 
ORDER BY dias_para_mantenimiento;

--10. mostrar el tiempo en días por el que se atrasó o adelantó el último mantenimiento de los aviones tomando como referencia la fecha de adquisición.
SELECT matricula, DATEDIFF(DAY, fechaFabricacion, UltimoMantenimiento) AS dias_atraso_o_adelanto 
FROM Avion;
--11. mostrar todos los vuelos y ordenarlos por los que tengan estén más próximos y tengan más lugares vacíos
SELECT idVuelo, fechaVuelo, COUNT(*) AS lugares_vacios 
FROM Vuelo
WHERE fechaVuelo >= GETDATE() 
GROUP BY idVuelo, fechaVuelo 
ORDER BY fechaVuelo, lugares_vacios DESC;

--12. mostrar los vuelos que tengan un precio por asiento mayor a 1000 pesos, ordenarlos de manera ascendente
SELECT * 
FROM Vuelo 
WHERE precioPorAsiento > 1000 
ORDER BY precioPorAsiento ASC;

--13. Mostrar todos los empleados que no tengan jefe
SELECT p.nombre, p.paterno, p.materno 
FROM Empleado e 
JOIN Persona p ON e.idPersona = p.IdPersona 
WHERE e.idJefe IS NULL;

--14. mostrar el día de la semana en que le toca mantenimiento a cada uno de los aviones
SELECT matricula, DATENAME(WEEKDAY, UltimoMantenimiento) AS dia_de_mantenimiento 
FROM Avion;

--15. Mostra las aerolíneas extranjeras , con el texto, la aerolínea <nombre> es extranjera
SELECT Nombre 
FROM Aerolinea 
WHERE nacional = 0;

--16. Selecciona la tabla de clientes ordenandola por la fecha de registro de manera descendente
SELECT * 
FROM Cliente 
ORDER BY fechaRegistro DESC;

--17. Selecciona al cliente tipo Oro que tenga más antigûedad de registro
SELECT TOP 1 c.* 
FROM Cliente c 
JOIN TipoCliente tc ON c.idTipoCliente = tc.idTipoCliente 
WHERE tc.tipoCliente = 'Oro' 
ORDER BY c.fechaRegistro ASC;

--18. Selecciona todos los domicilios y ordenalos por código postal, colonia y calle
SELECT * 
FROM Direccion 
ORDER BY codigoPostal, colonia, calle;

--19. Selecciona todos los domicilios cuyo número de casa no sea numérico
SELECT * 
FROM Direccion 
WHERE ISNUMERIC(numero) = 0;

--20. Selecciona el sueldo diario de los empleados considerando que todos los meses son de 30 días, agregar el alias "sueldo diario" y ordenarlo de manera descendente
SELECT e.idEmpleado, e.sueldo / 30 AS sueldo_diario 
FROM Empleado e 
ORDER BY sueldo_diario DESC;

--21. Realiza una consulta a los tipos de clientes que muestre el siguiente texto "al ser cliente " <tipo cliente> " tienes un descuento de " <porcentaje descuento>
SELECT 'Al ser cliente ' + tipoCliente + ' tienes un descuento de ' + CAST(descuento AS varchar(10)) 
FROM TipoCliente;

--22. selecciona los vuelos del mes de diciembre de 2014 que cuesten menos de 4000 pesos y ordenalos de forma ascendente en costo
SELECT * 
FROM Vuelo 
WHERE YEAR(fechaVuelo) = 2014 AND MONTH(fechaVuelo) = 12 AND precioPorAsiento < 4000 
ORDER BY precioPorAsiento ASC;

SELECT c.* 
FROM Cliente c 
JOIN TipoCliente tc ON c.idTipoCliente = tc.idTipoCliente 
WHERE tc.tipoCliente = 'Oro' AND DATEDIFF(YEAR, c.fechaRegistro, GETDATE()) < 5;

--24. muestra una lista de todos los tipos de aviones ordenandolos de manera ascendente por el nombre del fabricante y descendente por la cantidad de asientos
SELECT * 
FROM TipoAvion 
ORDER BY fabricante ASC, numAsientos DESC;

--25. selecciona los tipos de empleado de vuelo con la siguiente leyenda "el tipo de empleado " + <nombre del tipo> + " requiere estar en vuelo"
SELECT 'El tipo de empleado ' + tipoEmpleado + ' requiere estar en vuelo' 
FROM TipoEmpleado 
WHERE esDeVuelo = 1;

--26. selecciona los vuelos que se realizaron esta última semana
SELECT * 
FROM Vuelo 
WHERE fechaVuelo BETWEEN DATEADD(WEEK, -1, GETDATE()) AND GETDATE();

--27. selecciona los vuelos que se compraron durante el último mes
SELECT * 
FROM Venta 
WHERE fechaCompra BETWEEN DATEADD(MONTH, -1, GETDATE()) AND GETDATE();

--28. selecciona a las personas cuya longitud del telefono no sea exactamente igual a 8
SELECT * 
FROM Persona 
WHERE LEN(telefono) != 8;

--29. Selecciona las compras con una antigûedad mayor a un año
SELECT * 
FROM Venta 
WHERE fechaCompra < DATEADD(YEAR, -1, GETDATE());

--30. selecciona el día de la semana en que saldrán todos los vuelos.
SELECT idVuelo, DATENAME(WEEKDAY, fechaVuelo) AS dia_de_salida 
FROM Vuelo;

