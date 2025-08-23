<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Ejercicios SQL***

## ***Ejercicios de Selección de Datos***

1. **Ejercicio 1:** *Seleccionar todos los campos de la tabla `clientes`, ordenado por el nombre del contacto de la compañía, alfabéticamente.*

   - **SQLite3**

   ```sql
   SELECT *
   FROM "Customers"
   ORDER BY "CustomerName" ASC NULLS LAST 
   LIMIT 100
   ```

2. **Ejercicio 2:** *Seleccionar todos los campos de la tabla `órdenes`, ordenados por fecha de la orden, descendentemente.*

   - **SQLite3**

   ```sql
   SELECT * 
   FROM "Orders"
   ORDER BY "OrderDate" DESC NULLS LAST
   LIMIT 100
   ```

3. **Ejercicio 3:** *Seleccionar todos los campos de la tabla `detalle de la orden`, ordenada por cantidad pedida, ascendentemente.*

   - **SQLite3**

   ```sql
   SELECT *
   FROM "OrderDetails"
   ORDER BY "Quantity" ASC NULLS LAST
   LIMIT 100
   ```

4. **Ejercicio 4:** *Obtener todos los productos cuyo nombre comienza con la letra P y tienen un precio unitario comprendido entre 10 y 20 (`UnitPrice BETWEEN 10 AND 20`).*

    - **SQLite3**

   ```sql
   SELECT *
   FROM "Products"
   WHERE "ProductName" LIKE 'P%' AND
   "Price" BETWEEN 10 AND 20
   LIMIT 100
   ```

5. **Ejercicio 5:** *Obtener todos los productos descontinuados y sin stock, que pertenecen a las categorías 1, 3, 4 y 7.*

6. **Ejercicio 6:** *Obtener todas las órdenes hechas por el empleado con código 2, 5 y 7 en el año 1996.*

7. **Ejercicio 7:** *Seleccionar todos los clientes que cuenten con FAX.*

8. **Ejercicio 8:** *Seleccionar todos los clientes que no cuenten con FAX, del país de USA.*

9. **Ejercicio 9:** *Seleccionar todos los empleados que cuentan con un jefe.*

10. **Ejercicio 10:** *Seleccionar todos los campos del cliente, cuya compañía empiece con la letra A hasta la D y pertenezcan al país de USA, ordenados por la dirección.*

11. **Ejercicio 11:** *Seleccionar todos los campos del proveedor, cuya compañía no comience con las letras de la B a la G, y pertenezca al país de UK, ordenados por nombre de la compañía.*

12. **Ejercicio 12:** *Seleccionar los productos vigentes cuyos precios unitarios están entre 35 y 250, sin stock en almacén. Pertenecientes a las categorías 1, 3, 4, 7 y 8, que son distribuidos por los proveedores 2, 4, 6, 7 y 9.*

13. **Ejercicio 13:** *Seleccionar todos los campos de los productos descontinuados, que pertenezcan a los proveedores con códigos 1, 3, 7, 8 y 9, que tengan stock en almacén, y al mismo tiempo que sus precios unitarios estén entre 39 y 190, ordenados por código de proveedor y precio unitario de manera ascendente.*

14. **Ejercicio 14:** *Seleccionar los 7 productos con precios más caros, que cuenten con stock en almacén.*

15. **Ejercicio 15:** *Seleccionar los 9 productos con menos stock en almacén, que pertenezcan a las categorías 3, 5 y 8.*

16. **Ejercicio 16:** *Seleccionar las órdenes de compra, realizadas por el empleado con código entre el 2 y el 5, además de los clientes con códigos que comienzan con las letras de la A hasta la G, del 31 de julio de cualquier año.*

17. **Ejercicio 17:** *Seleccionar las órdenes de compra, realizadas por el empleado con código 3, de cualquier año pero solo de los últimos 5 meses (agosto - diciembre).*

18. **Ejercicio 18:** *Seleccionar los detalles de las órdenes de compra, que tengan un monto de cantidad pedida entre 10 y 250.*
