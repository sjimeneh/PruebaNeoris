SELECT CONCAT(M.Nombre, ' ', A.Nombre)
FROM AUTOMOVILES A
INNER JOIN MARCAS M
ON A.Marca = M.Codigo;


-- 2.	Seleccione las marcas de automóviles sin repeticiones.
SELECT DISTINCT(M.Nombre) 
FROM MARCAS M;


--3.	Obtenga todos los datos de los automóviles cuyo nombre empiece por la letra “B”
SELECT A.Nombre
FROM AUTOMOVILES A
WHERE UPPER(A.Nombre) LIKE 'B%';

--4.	Obtenga el número total de vehículos que fabrica cada marca.
SELECT M.Nombre AS NombreMarca,
COUNT(A.Nombre) AS Total_Vehiculos
FROM AUTOMOVILES A
INNER JOIN MARCAS M
ON A.Marca = M.Codigo
GROUP BY M.Codigo;


--5.	Seleccione todos los nombres y precios de los automóviles que se venden en el concesionario.
SELECT CONCAT(M.Nombre, ' ', A.Nombre) AS Nombre_Vehiculo,
A.Precio
FROM AUTOMOVILES A
INNER JOIN MARCAS M
ON A.Marca = M.Codigo;


--6.	Seleccione el nombre de los automóviles cuyo precio sea igual o menor que $10’000.000
SELECT *
FROM AUTOMOVILES A
INNER JOIN MARCAS M
ON A.Marca = M.Codigo
WHERE A.Precio < 10000000;

--7.	Seleccione todos los datos de los automóviles cuyo precio este entre 5’000.000 y 20’000.000 incluyendo los dos precios.
SELECT *
FROM AUTOMOVILES A
INNER JOIN MARCAS 
ON A.Marca = M.Codigo
WHERE A.Precio BETWEEN 5000000 AND 20000000;

--8.	Obtener el nombre y el precio en dólares de todos los automóviles (Precio de 1 dólar = 3200 Pesos colombianos)
SELECT A.Nombre, (A.precio * 3200) AS Precion_En_Dolar
FROM AUTOMOVILES A


--9.	Obtenga el precio medio de todos los automóviles.
SELECT AVG(Precio) AS PrecioMedio
FROM AUTOMOVILES;


--10.	Seleccione el precio medio de todos los automóviles cuyo código de marca sea igual a 14.
SELECT AVG(Precio) AS PrecioMedio
FROM AUTOMOVILES
WHERE Marca = 14;


--11.	Obtenga el número de automóviles cuyo precio sea mayor o igual a 8’000.000.
SELECT COUNT(*) AS NumeroDeAutomoviles
FROM AUTOMOVILES
WHERE Precio >= 8000000;


--12.	Seleccione el nombre y precio de los automóviles cuyo precio sea mayor o igual a 8’000.000 y ordénelos descendentemente por precio y luego ascendentemente por nombre.
SELECT Nombre, Precio
FROM AUTOMOVILES
WHERE Precio >= 8000000
ORDER BY Precio DESC, Nombre ASC;

--13.	Seleccione todos los datos de los automóviles incluyendo por cada automóvil todos los datos de la marca.
SELECT *
FROM AUTOMOVILES A
JOIN MARCAS M 
ON A.Marca = M.Codigo;

--14.	Obtenga un listado de los automóviles, incluyendo el nombre del auto, su precio y el nombre del fabricante.
SELECT A.Nombre AS NombreAutomovil, A.Precio, M.Nombre AS NombreFabricante
FROM AUTOMOVILES A
JOIN MARCAS M 
ON A.Marca = M.Codigo;

--15.	Obtener el precio medio de los automóviles mostrando solo los códigos de las marcas.
SELECT Marca, AVG(Precio) AS PrecioMedio
FROM AUTOMOVILES
GROUP BY Marca;

--16.	Seleccione el precio medio de los automóviles mostrando solo el nombre de la marca.
SELECT M.Nombre AS NombreMarca, AVG(A.Precio) AS PrecioMedio
FROM AUTOMOVILES A
JOIN MARCAS M 
ON A.Marca = M.Codigo
GROUP BY M.Nombre;

--17.	Obtener los datos de las marcas que ofrezcan automóviles cuyo precio medio sea igual o mayor a 5’000.000
SELECT M.*, AVG(A.Precio) AS PrecioMedio
FROM MARCAS M
JOIN AUTOMOVILES A ON M.Codigo = A.Marca
GROUP BY M.Codigo
HAVING AVG(A.Precio) >= 5000000;

--18.	Seleccionar el nombre y el precio del automóvil más barato.
SELECT Nombre, Precio
FROM AUTOMOVILES
WHERE Precio = (SELECT MIN(Precio) FROM AUTOMOVILES);

--19.	Seleccionar el nombre, precio del automóvil más caro de cada marca, incluyendo el nombre de la marca.
WITH WithAutomoviles AS (
  SELECT
    A.Nombre AS NombreAutomovil,
    A.Precio,
    M.Nombre AS NombreMarca,
    ROW_NUMBER() OVER (PARTITION BY A.Marca ORDER BY A.Precio DESC) AS RowNum
  FROM AUTOMOVILES A
  JOIN MARCAS M ON A.Marca = M.Codigo
)
SELECT NombreAutomovil, Precio, NombreMarca
FROM WithAutomoviles
WHERE RowNum = 1;


--20.	Añadir un nuevo automóvil de nombre “Sandero” precio de venta 21’000.000 y marca 3.
INSERT INTO AUTOMOVILES (Nombre, Precio, Marca)
VALUES ('Sandero', 21000000, 3);


--21.	Cambiar el nombre del automóvil 12 a “GT-R” 
UPDATE AUTOMOVILES
SET Nombre = 'GT-R'
WHERE Codigo = 12;


