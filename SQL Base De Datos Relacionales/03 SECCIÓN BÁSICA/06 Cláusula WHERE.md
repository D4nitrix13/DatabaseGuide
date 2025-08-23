<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Cláusula WHERE en SQLite***

> [!NOTE]
> *La cláusula `WHERE` se utiliza para filtrar registros basados en una condición específica. Aquí te mostramos diferentes ejemplos de cómo utilizarla en consultas SQL.*

---

## ***Ejemplos de consultas básicas***

1. **Seleccionar un campo específico de todos los registros:**

   ```sql
   SELECT ProductName FROM Products;
   ```

   ```sql
   sqlite> SELECT ProductName FROM Products;
   Chais
   Chang
   Aniseed Syrup
   Chef Anton's Cajun Seasoning
   Chef Anton's Gumbo Mix
   Grandma's Boysenberry Spread
   Uncle Bob's Organic Dried Pears
   Northwoods Cranberry Sauce
   Mishi Kobe Niku
   Ikura
   Queso Cabrales
   Queso Manchego La Pastora
   Konbu
   Tofu
   Genen Shouyu
   Pavlova
   Alice Mutton
   Carnarvon Tigers
   Teatime Chocolate Biscuits
   Sir Rodney's Marmalade
   Sir Rodney's Scones
   Gustaf's Knäckebröd
   Tunnbröd
   Guaraná Fantástica
   NuNuCa Nuß-Nougat-Creme
   Gumbär Gummibärchen
   Schoggi Schokolade
   Rössle Sauerkraut
   Thüringer Rostbratwurst
   Nord-Ost Matjeshering
   Gorgonzola Telino
   Mascarpone Fabioli
   Geitost
   Sasquatch Ale
   Steeleye Stout
   Inlagd Sill
   Gravad lax
   Côte de Blaye
   Chartreuse verte
   Boston Crab Meat
   Jack's New England Clam Chowder
   Singaporean Hokkien Fried Mee
   Ipoh Coffee
   Gula Malacca
   Røgede sild
   Spegesild
   Zaanse koeken
   Chocolade
   Maxilaku
   Valkoinen suklaa
   Manjimup Dried Apples
   Filo Mix
   Perth Pasties
   Tourtière
   Pâté chinois
   Gnocchi di nonna Alice
   Ravioli Angelo
   Escargots de Bourgogne
   Raclette Courdavault
   Camembert Pierrot
   Sirop d'érable
   Tarte au sucre
   Vegie-spread
   Wimmers gute Semmelknödel
   Louisiana Fiery Hot Pepper Sauce
   Louisiana Hot Spiced Okra
   Laughing Lumberjack Lager
   Scottish Longbreads
   Gudbrandsdalsost
   Outback Lager
   Fløtemysost
   Mozzarella di Giovanni
   Röd Kaviar
   Longlife Tofu
   Rhönbräu Klosterbier
   Lakkalikööri
   Original Frankfurter grüne Soße
   
   
   
   
   ```

   - *Esto devolverá solo los nombres de los productos de la tabla `Products`.*

2. **Filtrar un registro específico basado en el `ProductID`:**

    ```sql
   SELECT ProductName FROM Products WHERE ProductID = 14;
   ```

   ```sql
   sqlite> SELECT ProductName FROM Products WHERE ProductID = 14;
   Tofu
   ```

   - *En este caso, solo devolverá el nombre del producto cuyo `ProductID` es 14.*

3. **Seleccionar todos los campos de un registro específico:**

    ```sql
   SELECT * FROM Products WHERE ProductID = 14;
   ```

   ```sql
   sqlite> SELECT * FROM Products WHERE ProductID = 14;
   14|Tofu|6|7|40 - 100 g pkgs.|23.25
   ```

   - *Esto devolverá todas las columnas del producto con `ProductID` igual a 14.*

4. **Filtrar por nombre de producto:**

   ```sql
   SELECT * FROM Products WHERE ProductName = "Tofu";
   ```

   ```sql
   sqlite> SELECT * FROM Products WHERE ProductName = "Tofu";
   14|Tofu|6|7|40 - 100 g pkgs.|23.25
   ```

   - *Devolverá todos los registros donde el nombre del producto sea "Tofu".*

5. **Filtrar por precio utilizando operadores de comparación:**
   - **Productos con precio menor o igual a 40:**

     ```sql
     SELECT * FROM Products WHERE Price <= 40;
     ```

     ```sql
     sqlite> SELECT * FROM Products WHERE Price <= 40;
     1|Chais|1|1|10 boxes x 20 bags|18
     2|Chang|1|1|24 - 12 oz bottles|19
     3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
     4|Chef Anton's Cajun Seasoning|2|2|48 - 6 oz jars|22
     5|Chef Anton's Gumbo Mix|2|2|36 boxes|21.35
     6|Grandma's Boysenberry Spread|3|2|12 - 8 oz jars|25
     7|Uncle Bob's Organic Dried Pears|3|7|12 - 1 lb pkgs.|30
     8|Northwoods Cranberry Sauce|3|2|12 - 12 oz jars|40
     10|Ikura|4|8|12 - 200 ml jars|31
     11|Queso Cabrales|5|4|1 kg pkg.|21
     12|Queso Manchego La Pastora|5|4|10 - 500 g pkgs.|38
     13|Konbu|6|8|2 kg box|6
     14|Tofu|6|7|40 - 100 g pkgs.|23.25
     15|Genen Shouyu|6|2|24 - 250 ml bottles|15.5
     16|Pavlova|7|3|32 - 500 g boxes|17.45
     17|Alice Mutton|7|6|20 - 1 kg tins|39
     19|Teatime Chocolate Biscuits|8|3|10 boxes x 12 pieces|9.2
     21|Sir Rodney's Scones|8|3|24 pkgs. x 4 pieces|10
     22|Gustaf's Knäckebröd|9|5|24 - 500 g pkgs.|21
     23|Tunnbröd|9|5|12 - 250 g pkgs.|9
     24|Guaraná Fantástica|10|1|12 - 355 ml cans|4.5
     25|NuNuCa Nuß-Nougat-Creme|11|3|20 - 450 g glasses|14
     26|Gumbär Gummibärchen|11|3|100 - 250 g bags|31.23
     30|Nord-Ost Matjeshering|13|8|10 - 200 g glasses|25.89
     31|Gorgonzola Telino|14|4|12 - 100 g pkgs|12.5
     32|Mascarpone Fabioli|14|4|24 - 200 g pkgs.|32
     33|Geitost|15|4|500 g|2.5
     34|Sasquatch Ale|16|1|24 - 12 oz bottles|14
     35|Steeleye Stout|16|1|24 - 12 oz bottles|18
     36|Inlagd Sill|17|8|24 - 250 g jars|19
     37|Gravad lax|17|8|12 - 500 g pkgs.|26
     39|Chartreuse verte|18|1|750 cc per bottle|18
     40|Boston Crab Meat|19|8|24 - 4 oz tins|18.4
     41|Jack's New England Clam Chowder|19|8|12 - 12 oz cans|9.65
     42|Singaporean Hokkien Fried Mee|20|5|32 - 1 kg pkgs.|14
     44|Gula Malacca|20|2|20 - 2 kg bags|19.45
     45|Røgede sild|21|8|1k pkg.|9.5
     46|Spegesild|21|8|4 - 450 g glasses|12
     47|Zaanse koeken|22|3|10 - 4 oz boxes|9.5
     48|Chocolade|22|3|10 pkgs.|12.75
     49|Maxilaku|23|3|24 - 50 g pkgs.|20
     50|Valkoinen suklaa|23|3|12 - 100 g bars|16.25
     52|Filo Mix|24|5|16 - 2 kg boxes|7
     53|Perth Pasties|24|6|48 pieces|32.8
     54|Tourtière|25|6|16 pies|7.45
     55|Pâté chinois|25|6|24 boxes x 2 pies|24
     56|Gnocchi di nonna Alice|26|5|24 - 250 g pkgs.|38
     57|Ravioli Angelo|26|5|24 - 250 g pkgs.|19.5
     58|Escargots de Bourgogne|27|8|24 pieces|13.25
     60|Camembert Pierrot|28|4|15 - 300 g rounds|34
     61|Sirop d'érable|29|2|24 - 500 ml bottles|28.5
     64|Wimmers gute Semmelknödel|12|5|20 bags x 4 pieces|33.25
     65|Louisiana Fiery Hot Pepper Sauce|2|2|32 - 8 oz bottles|21.05
     66|Louisiana Hot Spiced Okra|2|2|24 - 8 oz jars|17
     67|Laughing Lumberjack Lager|16|1|24 - 12 oz bottles|14
     68|Scottish Longbreads|8|3|10 boxes x 8 pieces|12.5
     69|Gudbrandsdalsost|15|4|10 kg pkg.|36
     70|Outback Lager|7|1|24 - 355 ml bottles|15
     71|Fløtemysost|15|4|10 - 500 g pkgs.|21.5
     72|Mozzarella di Giovanni|14|4|24 - 200 g pkgs.|34.8
     73|Röd Kaviar|17|8|24 - 150 g jars|15
     74|Longlife Tofu|4|7|5 kg pkg.|10
     75|Rhönbräu Klosterbier|12|1|24 - 0.5 l bottles|7.75
     76|Lakkalikööri|23|1|500 ml|18
     77|Original Frankfurter grüne Soße|12|2|12 boxes|13
     78|||||0
     79|||3||0
     80|||6||0
     81|||9||0
     ```

   - **Productos con precio menor a 40:**

     ```sql
     SELECT * FROM Products WHERE Price < 40;
     ```

     ```sql
     sqlite> SELECT * FROM Products WHERE Price < 40;
     1|Chais|1|1|10 boxes x 20 bags|18
     2|Chang|1|1|24 - 12 oz bottles|19
     3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
     4|Chef Anton's Cajun Seasoning|2|2|48 - 6 oz jars|22
     5|Chef Anton's Gumbo Mix|2|2|36 boxes|21.35
     6|Grandma's Boysenberry Spread|3|2|12 - 8 oz jars|25
     7|Uncle Bob's Organic Dried Pears|3|7|12 - 1 lb pkgs.|30
     10|Ikura|4|8|12 - 200 ml jars|31
     11|Queso Cabrales|5|4|1 kg pkg.|21
     12|Queso Manchego La Pastora|5|4|10 - 500 g pkgs.|38
     13|Konbu|6|8|2 kg box|6
     14|Tofu|6|7|40 - 100 g pkgs.|23.25
     15|Genen Shouyu|6|2|24 - 250 ml bottles|15.5
     16|Pavlova|7|3|32 - 500 g boxes|17.45
     17|Alice Mutton|7|6|20 - 1 kg tins|39
     19|Teatime Chocolate Biscuits|8|3|10 boxes x 12 pieces|9.2
     21|Sir Rodney's Scones|8|3|24 pkgs. x 4 pieces|10
     22|Gustaf's Knäckebröd|9|5|24 - 500 g pkgs.|21
     23|Tunnbröd|9|5|12 - 250 g pkgs.|9
     24|Guaraná Fantástica|10|1|12 - 355 ml cans|4.5
     25|NuNuCa Nuß-Nougat-Creme|11|3|20 - 450 g glasses|14
     26|Gumbär Gummibärchen|11|3|100 - 250 g bags|31.23
     30|Nord-Ost Matjeshering|13|8|10 - 200 g glasses|25.89
     31|Gorgonzola Telino|14|4|12 - 100 g pkgs|12.5
     32|Mascarpone Fabioli|14|4|24 - 200 g pkgs.|32
     33|Geitost|15|4|500 g|2.5
     34|Sasquatch Ale|16|1|24 - 12 oz bottles|14
     35|Steeleye Stout|16|1|24 - 12 oz bottles|18
     36|Inlagd Sill|17|8|24 - 250 g jars|19
     37|Gravad lax|17|8|12 - 500 g pkgs.|26
     39|Chartreuse verte|18|1|750 cc per bottle|18
     40|Boston Crab Meat|19|8|24 - 4 oz tins|18.4
     41|Jack's New England Clam Chowder|19|8|12 - 12 oz cans|9.65
     42|Singaporean Hokkien Fried Mee|20|5|32 - 1 kg pkgs.|14
     44|Gula Malacca|20|2|20 - 2 kg bags|19.45
     45|Røgede sild|21|8|1k pkg.|9.5
     46|Spegesild|21|8|4 - 450 g glasses|12
     47|Zaanse koeken|22|3|10 - 4 oz boxes|9.5
     48|Chocolade|22|3|10 pkgs.|12.75
     49|Maxilaku|23|3|24 - 50 g pkgs.|20
     50|Valkoinen suklaa|23|3|12 - 100 g bars|16.25
     52|Filo Mix|24|5|16 - 2 kg boxes|7
     53|Perth Pasties|24|6|48 pieces|32.8
     54|Tourtière|25|6|16 pies|7.45
     55|Pâté chinois|25|6|24 boxes x 2 pies|24
     56|Gnocchi di nonna Alice|26|5|24 - 250 g pkgs.|38
     57|Ravioli Angelo|26|5|24 - 250 g pkgs.|19.5
     58|Escargots de Bourgogne|27|8|24 pieces|13.25
     60|Camembert Pierrot|28|4|15 - 300 g rounds|34
     61|Sirop d'érable|29|2|24 - 500 ml bottles|28.5
     64|Wimmers gute Semmelknödel|12|5|20 bags x 4 pieces|33.25
     65|Louisiana Fiery Hot Pepper Sauce|2|2|32 - 8 oz bottles|21.05
     66|Louisiana Hot Spiced Okra|2|2|24 - 8 oz jars|17
     67|Laughing Lumberjack Lager|16|1|24 - 12 oz bottles|14
     68|Scottish Longbreads|8|3|10 boxes x 8 pieces|12.5
     69|Gudbrandsdalsost|15|4|10 kg pkg.|36
     70|Outback Lager|7|1|24 - 355 ml bottles|15
     71|Fløtemysost|15|4|10 - 500 g pkgs.|21.5
     72|Mozzarella di Giovanni|14|4|24 - 200 g pkgs.|34.8
     73|Röd Kaviar|17|8|24 - 150 g jars|15
     74|Longlife Tofu|4|7|5 kg pkg.|10
     75|Rhönbräu Klosterbier|12|1|24 - 0.5 l bottles|7.75
     76|Lakkalikööri|23|1|500 ml|18
     77|Original Frankfurter grüne Soße|12|2|12 boxes|13
     78|||||0
     79|||3||0
     80|||6||0
     81|||9||0
     ```

   - **Productos con precio mayor a 40:**

     ```sql
     SELECT * FROM Products WHERE Price > 40;
     ```

     ```sql
     sqlite> SELECT * FROM Products WHERE Price > 40;
     9|Mishi Kobe Niku|4|6|18 - 500 g pkgs.|97
     18|Carnarvon Tigers|7|8|16 kg pkg.|62.5
     20|Sir Rodney's Marmalade|8|3|30 gift boxes|81
     27|Schoggi Schokolade|11|3|100 - 100 g pieces|43.9
     28|Rössle Sauerkraut|12|7|25 - 825 g cans|45.6
     29|Thüringer Rostbratwurst|12|6|50 bags x 30 sausgs.|123.79
     38|Côte de Blaye|18|1|12 - 75 cl bottles|263.5
     43|Ipoh Coffee|20|1|16 - 500 g tins|46
     51|Manjimup Dried Apples|24|7|50 - 300 g pkgs.|53
     59|Raclette Courdavault|28|4|5 kg pkg.|55
     62|Tarte au sucre|29|3|48 pies|49.3
     63|Vegie-spread|7|2|15 - 625 g jars|43.9
     ```

   - **Productos con precio mayor o igual a 40:**

     ```sql
     SELECT * FROM Products WHERE Price >= 40;
     ```

     ```sql
     sqlite> SELECT * FROM Products WHERE Price >= 40;
     8|Northwoods Cranberry Sauce|3|2|12 - 12 oz jars|40
     9|Mishi Kobe Niku|4|6|18 - 500 g pkgs.|97
     18|Carnarvon Tigers|7|8|16 kg pkg.|62.5
     20|Sir Rodney's Marmalade|8|3|30 gift boxes|81
     27|Schoggi Schokolade|11|3|100 - 100 g pieces|43.9
     28|Rössle Sauerkraut|12|7|25 - 825 g cans|45.6
     29|Thüringer Rostbratwurst|12|6|50 bags x 30 sausgs.|123.79
     38|Côte de Blaye|18|1|12 - 75 cl bottles|263.5
     43|Ipoh Coffee|20|1|16 - 500 g tins|46
     51|Manjimup Dried Apples|24|7|50 - 300 g pkgs.|53
     59|Raclette Courdavault|28|4|5 kg pkg.|55
     62|Tarte au sucre|29|3|48 pies|49.3
     63|Vegie-spread|7|2|15 - 625 g jars|43.9
     ```

---

### ***Exploración de bases de datos en SQLite***

- **Para encontrar las bases de datos en un directorio específico, puedes usar el comando `.shell` dentro de SQLite:**

    ```sql
    .shell find /home/vscode -name *.db
    ```

    ```sql
    sqlite> .shell find /home/vscode -name *.db
    ```

**Salida esperada:**

```bash
sqlite> .shell find /home/vscode -name *.db
/home/vscode/databases.db
/home/vscode/hello_sqlite3.db
/home/vscode/Northwind.db
```

---

### ***Abrir una base de datos en SQLite***

- **Para abrir una base de datos específica, como `hello_sqlite3.db`, puedes usar el siguiente comando dentro de SQLite:**

    ```sql
    .open /home/vscode/hello_sqlite3.db
    ```

    ```sql
    sqlite> .open /home/vscode/hello_sqlite3.db
    ```

---

### ***Insertar un nuevo registro***

- **Para insertar un nuevo registro en una tabla llamada `turnos_medicos`:**

    ```sql
    INSERT INTO turnos_medicos (profesional, id_user, motivo, horario)
    VALUES ("Dr. Ramirez", 2, "Dolor de Espalda", "11:30");
    ```

    ```sql
    sqlite> INSERT INTO turnos_medicos (profesional, id_user, motivo, horario) 
    VALUES ("Dr. Ramirez", 2, "Dolor de Espalda", "11:30");
    ```

- **Esto agrega una nueva entrada con los valores especificados.**

---

### ***Consultar registros específicos***

- **Puedes seleccionar un registro específico filtrando por `id_turno`:**

    ```sql
    SELECT * FROM turnos_medicos WHERE id_turno = 3;
    ```

    ```sql
    sqlite> SELECT * FROM turnos_medicos WHERE id_turno = 3;
    3|Dr. Ramirez|2|Dolor de Espalda|11:30
    ```

---

### ***Eliminar un registro***

- **Para eliminar un registro específico de la tabla, utiliza el comando `DELETE`:**

    ```sql
    DELETE FROM turnos_medicos WHERE id_turno = 3;
    ```

    ```sql
    sqlite> DELETE FROM turnos_medicos WHERE id_turno = 3;
    ```

- **Este comando eliminará el registro cuyo `id_turno` es igual a 3.**

---

### ***Mostrar todos los registros***

- **Después de hacer cualquier cambio, puedes visualizar todos los registros de la tabla:**

    ```sql
    SELECT * FROM turnos_medicos;
    ```

    ```sql
    sqlite> SELECT * FROM turnos_medicos;
    1|Dr. Ramirez|6|Dolor de Panza|12:30
    2|Dr. Ramirez|3|Dolor de Cabeza|11:30
    ```

---

### ***Actualizar registros***

1. **Actualizar un solo campo para todos los registros:**

    ```sql
   UPDATE turnos_medicos SET horario = "10:30";
   ```

   ```sql
   sqlite> UPDATE turnos_medicos SET horario = "10:30";
   ```

    - *Este comando cambiará el valor de `horario` a "10:30" para **todos** los registros.*

    ```sql
    SELECT * FROM turnos_medicos;
    ```

    ```sql
    sqlite> SELECT * FROM turnos_medicos;
    1|Dr. Ramirez|6|Dolor de Panza|10:30
    2|Dr. Ramirez|3|Dolor de Cabeza|10:30
    ```

2. **Actualizar un campo de un registro específico:**

    ```sql
   UPDATE turnos_medicos SET horario = "12:30" WHERE id_turno = 2;
   ```

   ```sql
   sqlite> UPDATE turnos_medicos SET horario = "12:30" WHERE id_turno = 2;
   ```

   - *Esto actualizará el `horario` a "12:30" solo para el registro con `id_turno` igual a 2.*

    ```sql
    SELECT * FROM turnos_medicos;
    ```

    ```sql
    sqlite> SELECT * FROM turnos_medicos;
    1|Dr. Ramirez|6|Dolor de Panza|10:30
    2|Dr. Ramirez|3|Dolor de Cabeza|12:30
    ```

3. **Actualizar varios campos en un registro específico:**

    ```sql
   UPDATE turnos_medicos SET horario = "12:30", motivo = "Dolor de Muelas" WHERE id_turno = 2;
   ```

   ```sql
   sqlite> UPDATE turnos_medicos SET horario = "12:30", motivo = "Dolor de Muelas" WHERE id_turno = 2;
   ```

   - *Este comando actualizará tanto el `horario` como el `motivo` para el registro con `id_turno` igual a 2.*

    ```sql
    SELECT * FROM turnos_medicos;
    ```

    ```sql
    sqlite> SELECT * FROM turnos_medicos;
    1|Dr. Ramirez|6|Dolor de Panza|10:30
    2|Dr. Ramirez|3|Dolor de Muelas|12:30
    ```

---

### ***Abrir otra base de datos***

- **Para cambiar a otra base de datos, como `Northwind.db`, utiliza el siguiente comando:**

    ```sql
    .open /home/vscode/Northwind.db
    ```

    ```sql
    sqlite> .open /home/vscode/Northwind.db
    ```

- *Esta versión mejora la claridad del contenido, organiza mejor los ejemplos y proporciona una guía paso a paso sobre cómo usar la cláusula `WHERE` en diferentes escenarios de SQLite.*
