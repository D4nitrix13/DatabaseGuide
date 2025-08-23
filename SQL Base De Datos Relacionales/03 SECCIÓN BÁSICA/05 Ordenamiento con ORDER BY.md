<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Ordenamiento con ORDER BY***

---

## ***Consulta básica sin ordenamiento***

```sql
SELECT * FROM Products;
```

```sql
sqlite> SELECT * FROM Products;
1|Chais|1|1|10 boxes x 20 bags|18
2|Chang|1|1|24 - 12 oz bottles|19
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
4|Chef Anton's Cajun Seasoning|2|2|48 - 6 oz jars|22
5|Chef Anton's Gumbo Mix|2|2|36 boxes|21.35
6|Grandma's Boysenberry Spread|3|2|12 - 8 oz jars|25
7|Uncle Bob's Organic Dried Pears|3|7|12 - 1 lb pkgs.|30
8|Northwoods Cranberry Sauce|3|2|12 - 12 oz jars|40
9|Mishi Kobe Niku|4|6|18 - 500 g pkgs.|97
10|Ikura|4|8|12 - 200 ml jars|31
11|Queso Cabrales|5|4|1 kg pkg.|21
12|Queso Manchego La Pastora|5|4|10 - 500 g pkgs.|38
13|Konbu|6|8|2 kg box|6
14|Tofu|6|7|40 - 100 g pkgs.|23.25
15|Genen Shouyu|6|2|24 - 250 ml bottles|15.5
16|Pavlova|7|3|32 - 500 g boxes|17.45
17|Alice Mutton|7|6|20 - 1 kg tins|39
18|Carnarvon Tigers|7|8|16 kg pkg.|62.5
19|Teatime Chocolate Biscuits|8|3|10 boxes x 12 pieces|9.2
20|Sir Rodney's Marmalade|8|3|30 gift boxes|81
21|Sir Rodney's Scones|8|3|24 pkgs. x 4 pieces|10
22|Gustaf's Knäckebröd|9|5|24 - 500 g pkgs.|21
23|Tunnbröd|9|5|12 - 250 g pkgs.|9
24|Guaraná Fantástica|10|1|12 - 355 ml cans|4.5
25|NuNuCa Nuß-Nougat-Creme|11|3|20 - 450 g glasses|14
26|Gumbär Gummibärchen|11|3|100 - 250 g bags|31.23
27|Schoggi Schokolade|11|3|100 - 100 g pieces|43.9
28|Rössle Sauerkraut|12|7|25 - 825 g cans|45.6
29|Thüringer Rostbratwurst|12|6|50 bags x 30 sausgs.|123.79
30|Nord-Ost Matjeshering|13|8|10 - 200 g glasses|25.89
31|Gorgonzola Telino|14|4|12 - 100 g pkgs|12.5
32|Mascarpone Fabioli|14|4|24 - 200 g pkgs.|32
33|Geitost|15|4|500 g|2.5
34|Sasquatch Ale|16|1|24 - 12 oz bottles|14
35|Steeleye Stout|16|1|24 - 12 oz bottles|18
36|Inlagd Sill|17|8|24 - 250 g jars|19
37|Gravad lax|17|8|12 - 500 g pkgs.|26
38|Côte de Blaye|18|1|12 - 75 cl bottles|263.5
39|Chartreuse verte|18|1|750 cc per bottle|18
40|Boston Crab Meat|19|8|24 - 4 oz tins|18.4
41|Jack's New England Clam Chowder|19|8|12 - 12 oz cans|9.65
42|Singaporean Hokkien Fried Mee|20|5|32 - 1 kg pkgs.|14
43|Ipoh Coffee|20|1|16 - 500 g tins|46
44|Gula Malacca|20|2|20 - 2 kg bags|19.45
45|Røgede sild|21|8|1k pkg.|9.5
46|Spegesild|21|8|4 - 450 g glasses|12
47|Zaanse koeken|22|3|10 - 4 oz boxes|9.5
48|Chocolade|22|3|10 pkgs.|12.75
49|Maxilaku|23|3|24 - 50 g pkgs.|20
50|Valkoinen suklaa|23|3|12 - 100 g bars|16.25
51|Manjimup Dried Apples|24|7|50 - 300 g pkgs.|53
52|Filo Mix|24|5|16 - 2 kg boxes|7
53|Perth Pasties|24|6|48 pieces|32.8
54|Tourtière|25|6|16 pies|7.45
55|Pâté chinois|25|6|24 boxes x 2 pies|24
56|Gnocchi di nonna Alice|26|5|24 - 250 g pkgs.|38
57|Ravioli Angelo|26|5|24 - 250 g pkgs.|19.5
58|Escargots de Bourgogne|27|8|24 pieces|13.25
59|Raclette Courdavault|28|4|5 kg pkg.|55
60|Camembert Pierrot|28|4|15 - 300 g rounds|34
61|Sirop d'érable|29|2|24 - 500 ml bottles|28.5
62|Tarte au sucre|29|3|48 pies|49.3
63|Vegie-spread|7|2|15 - 625 g jars|43.9
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
```

**Esto devolverá los registros sin un orden específico.**

---

### ***Ordenando por un campo numérico***

```sql
SELECT * FROM Products ORDER BY Price;
```

```sql
sqlite> SELECT * FROM Products ORDER BY Price;
33|Geitost|15|4|500 g|2.5
24|Guaraná Fantástica|10|1|12 - 355 ml cans|4.5
13|Konbu|6|8|2 kg box|6
52|Filo Mix|24|5|16 - 2 kg boxes|7
54|Tourtière|25|6|16 pies|7.45
75|Rhönbräu Klosterbier|12|1|24 - 0.5 l bottles|7.75
23|Tunnbröd|9|5|12 - 250 g pkgs.|9
19|Teatime Chocolate Biscuits|8|3|10 boxes x 12 pieces|9.2
45|Røgede sild|21|8|1k pkg.|9.5
47|Zaanse koeken|22|3|10 - 4 oz boxes|9.5
41|Jack's New England Clam Chowder|19|8|12 - 12 oz cans|9.65
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
21|Sir Rodney's Scones|8|3|24 pkgs. x 4 pieces|10
74|Longlife Tofu|4|7|5 kg pkg.|10
46|Spegesild|21|8|4 - 450 g glasses|12
31|Gorgonzola Telino|14|4|12 - 100 g pkgs|12.5
68|Scottish Longbreads|8|3|10 boxes x 8 pieces|12.5
48|Chocolade|22|3|10 pkgs.|12.75
77|Original Frankfurter grüne Soße|12|2|12 boxes|13
58|Escargots de Bourgogne|27|8|24 pieces|13.25
25|NuNuCa Nuß-Nougat-Creme|11|3|20 - 450 g glasses|14
34|Sasquatch Ale|16|1|24 - 12 oz bottles|14
42|Singaporean Hokkien Fried Mee|20|5|32 - 1 kg pkgs.|14
67|Laughing Lumberjack Lager|16|1|24 - 12 oz bottles|14
70|Outback Lager|7|1|24 - 355 ml bottles|15
73|Röd Kaviar|17|8|24 - 150 g jars|15
15|Genen Shouyu|6|2|24 - 250 ml bottles|15.5
50|Valkoinen suklaa|23|3|12 - 100 g bars|16.25
66|Louisiana Hot Spiced Okra|2|2|24 - 8 oz jars|17
16|Pavlova|7|3|32 - 500 g boxes|17.45
1|Chais|1|1|10 boxes x 20 bags|18
35|Steeleye Stout|16|1|24 - 12 oz bottles|18
39|Chartreuse verte|18|1|750 cc per bottle|18
76|Lakkalikööri|23|1|500 ml|18
40|Boston Crab Meat|19|8|24 - 4 oz tins|18.4
2|Chang|1|1|24 - 12 oz bottles|19
36|Inlagd Sill|17|8|24 - 250 g jars|19
44|Gula Malacca|20|2|20 - 2 kg bags|19.45
57|Ravioli Angelo|26|5|24 - 250 g pkgs.|19.5
49|Maxilaku|23|3|24 - 50 g pkgs.|20
11|Queso Cabrales|5|4|1 kg pkg.|21
22|Gustaf's Knäckebröd|9|5|24 - 500 g pkgs.|21
65|Louisiana Fiery Hot Pepper Sauce|2|2|32 - 8 oz bottles|21.05
5|Chef Anton's Gumbo Mix|2|2|36 boxes|21.35
71|Fløtemysost|15|4|10 - 500 g pkgs.|21.5
4|Chef Anton's Cajun Seasoning|2|2|48 - 6 oz jars|22
14|Tofu|6|7|40 - 100 g pkgs.|23.25
55|Pâté chinois|25|6|24 boxes x 2 pies|24
6|Grandma's Boysenberry Spread|3|2|12 - 8 oz jars|25
30|Nord-Ost Matjeshering|13|8|10 - 200 g glasses|25.89
37|Gravad lax|17|8|12 - 500 g pkgs.|26
61|Sirop d'érable|29|2|24 - 500 ml bottles|28.5
7|Uncle Bob's Organic Dried Pears|3|7|12 - 1 lb pkgs.|30
10|Ikura|4|8|12 - 200 ml jars|31
26|Gumbär Gummibärchen|11|3|100 - 250 g bags|31.23
32|Mascarpone Fabioli|14|4|24 - 200 g pkgs.|32
53|Perth Pasties|24|6|48 pieces|32.8
64|Wimmers gute Semmelknödel|12|5|20 bags x 4 pieces|33.25
60|Camembert Pierrot|28|4|15 - 300 g rounds|34
72|Mozzarella di Giovanni|14|4|24 - 200 g pkgs.|34.8
69|Gudbrandsdalsost|15|4|10 kg pkg.|36
12|Queso Manchego La Pastora|5|4|10 - 500 g pkgs.|38
56|Gnocchi di nonna Alice|26|5|24 - 250 g pkgs.|38
17|Alice Mutton|7|6|20 - 1 kg tins|39
8|Northwoods Cranberry Sauce|3|2|12 - 12 oz jars|40
27|Schoggi Schokolade|11|3|100 - 100 g pieces|43.9
63|Vegie-spread|7|2|15 - 625 g jars|43.9
28|Rössle Sauerkraut|12|7|25 - 825 g cans|45.6
43|Ipoh Coffee|20|1|16 - 500 g tins|46
62|Tarte au sucre|29|3|48 pies|49.3
51|Manjimup Dried Apples|24|7|50 - 300 g pkgs.|53
59|Raclette Courdavault|28|4|5 kg pkg.|55
18|Carnarvon Tigers|7|8|16 kg pkg.|62.5
20|Sir Rodney's Marmalade|8|3|30 gift boxes|81
9|Mishi Kobe Niku|4|6|18 - 500 g pkgs.|97
29|Thüringer Rostbratwurst|12|6|50 bags x 30 sausgs.|123.79
38|Côte de Blaye|18|1|12 - 75 cl bottles|263.5
```

- *Esta consulta ordena los resultados de la tabla `Products` según el campo `Price` en orden ascendente por defecto.*

---

### ***Orden explícito ascendente***

- **Aunque por defecto el orden es ascendente, es una buena práctica ser explícito al usar `ASC`:**

```sql
SELECT * FROM Products ORDER BY Price ASC;
```

```sql
sqlite> SELECT * FROM Products ORDER BY Price ASC;
33|Geitost|15|4|500 g|2.5
24|Guaraná Fantástica|10|1|12 - 355 ml cans|4.5
13|Konbu|6|8|2 kg box|6
52|Filo Mix|24|5|16 - 2 kg boxes|7
54|Tourtière|25|6|16 pies|7.45
75|Rhönbräu Klosterbier|12|1|24 - 0.5 l bottles|7.75
23|Tunnbröd|9|5|12 - 250 g pkgs.|9
19|Teatime Chocolate Biscuits|8|3|10 boxes x 12 pieces|9.2
45|Røgede sild|21|8|1k pkg.|9.5
47|Zaanse koeken|22|3|10 - 4 oz boxes|9.5
41|Jack's New England Clam Chowder|19|8|12 - 12 oz cans|9.65
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
21|Sir Rodney's Scones|8|3|24 pkgs. x 4 pieces|10
74|Longlife Tofu|4|7|5 kg pkg.|10
46|Spegesild|21|8|4 - 450 g glasses|12
31|Gorgonzola Telino|14|4|12 - 100 g pkgs|12.5
68|Scottish Longbreads|8|3|10 boxes x 8 pieces|12.5
48|Chocolade|22|3|10 pkgs.|12.75
77|Original Frankfurter grüne Soße|12|2|12 boxes|13
58|Escargots de Bourgogne|27|8|24 pieces|13.25
25|NuNuCa Nuß-Nougat-Creme|11|3|20 - 450 g glasses|14
34|Sasquatch Ale|16|1|24 - 12 oz bottles|14
42|Singaporean Hokkien Fried Mee|20|5|32 - 1 kg pkgs.|14
67|Laughing Lumberjack Lager|16|1|24 - 12 oz bottles|14
70|Outback Lager|7|1|24 - 355 ml bottles|15
73|Röd Kaviar|17|8|24 - 150 g jars|15
15|Genen Shouyu|6|2|24 - 250 ml bottles|15.5
50|Valkoinen suklaa|23|3|12 - 100 g bars|16.25
66|Louisiana Hot Spiced Okra|2|2|24 - 8 oz jars|17
16|Pavlova|7|3|32 - 500 g boxes|17.45
1|Chais|1|1|10 boxes x 20 bags|18
35|Steeleye Stout|16|1|24 - 12 oz bottles|18
39|Chartreuse verte|18|1|750 cc per bottle|18
76|Lakkalikööri|23|1|500 ml|18
40|Boston Crab Meat|19|8|24 - 4 oz tins|18.4
2|Chang|1|1|24 - 12 oz bottles|19
36|Inlagd Sill|17|8|24 - 250 g jars|19
44|Gula Malacca|20|2|20 - 2 kg bags|19.45
57|Ravioli Angelo|26|5|24 - 250 g pkgs.|19.5
49|Maxilaku|23|3|24 - 50 g pkgs.|20
11|Queso Cabrales|5|4|1 kg pkg.|21
22|Gustaf's Knäckebröd|9|5|24 - 500 g pkgs.|21
65|Louisiana Fiery Hot Pepper Sauce|2|2|32 - 8 oz bottles|21.05
5|Chef Anton's Gumbo Mix|2|2|36 boxes|21.35
71|Fløtemysost|15|4|10 - 500 g pkgs.|21.5
4|Chef Anton's Cajun Seasoning|2|2|48 - 6 oz jars|22
14|Tofu|6|7|40 - 100 g pkgs.|23.25
55|Pâté chinois|25|6|24 boxes x 2 pies|24
6|Grandma's Boysenberry Spread|3|2|12 - 8 oz jars|25
30|Nord-Ost Matjeshering|13|8|10 - 200 g glasses|25.89
37|Gravad lax|17|8|12 - 500 g pkgs.|26
61|Sirop d'érable|29|2|24 - 500 ml bottles|28.5
7|Uncle Bob's Organic Dried Pears|3|7|12 - 1 lb pkgs.|30
10|Ikura|4|8|12 - 200 ml jars|31
26|Gumbär Gummibärchen|11|3|100 - 250 g bags|31.23
32|Mascarpone Fabioli|14|4|24 - 200 g pkgs.|32
53|Perth Pasties|24|6|48 pieces|32.8
64|Wimmers gute Semmelknödel|12|5|20 bags x 4 pieces|33.25
60|Camembert Pierrot|28|4|15 - 300 g rounds|34
72|Mozzarella di Giovanni|14|4|24 - 200 g pkgs.|34.8
69|Gudbrandsdalsost|15|4|10 kg pkg.|36
12|Queso Manchego La Pastora|5|4|10 - 500 g pkgs.|38
56|Gnocchi di nonna Alice|26|5|24 - 250 g pkgs.|38
17|Alice Mutton|7|6|20 - 1 kg tins|39
8|Northwoods Cranberry Sauce|3|2|12 - 12 oz jars|40
27|Schoggi Schokolade|11|3|100 - 100 g pieces|43.9
63|Vegie-spread|7|2|15 - 625 g jars|43.9
28|Rössle Sauerkraut|12|7|25 - 825 g cans|45.6
43|Ipoh Coffee|20|1|16 - 500 g tins|46
62|Tarte au sucre|29|3|48 pies|49.3
51|Manjimup Dried Apples|24|7|50 - 300 g pkgs.|53
59|Raclette Courdavault|28|4|5 kg pkg.|55
18|Carnarvon Tigers|7|8|16 kg pkg.|62.5
20|Sir Rodney's Marmalade|8|3|30 gift boxes|81
9|Mishi Kobe Niku|4|6|18 - 500 g pkgs.|97
29|Thüringer Rostbratwurst|12|6|50 bags x 30 sausgs.|123.79
38|Côte de Blaye|18|1|12 - 75 cl bottles|263.5
```

---

### ***Orden descendente***

- **Si quieres ordenar de mayor a menor, usa `DESC`:**

```sql
SELECT * FROM Products ORDER BY Price DESC;
```

```sql
sqlite> SELECT * FROM Products ORDER BY Price DESC;
38|Côte de Blaye|18|1|12 - 75 cl bottles|263.5
29|Thüringer Rostbratwurst|12|6|50 bags x 30 sausgs.|123.79
9|Mishi Kobe Niku|4|6|18 - 500 g pkgs.|97
20|Sir Rodney's Marmalade|8|3|30 gift boxes|81
18|Carnarvon Tigers|7|8|16 kg pkg.|62.5
59|Raclette Courdavault|28|4|5 kg pkg.|55
51|Manjimup Dried Apples|24|7|50 - 300 g pkgs.|53
62|Tarte au sucre|29|3|48 pies|49.3
43|Ipoh Coffee|20|1|16 - 500 g tins|46
28|Rössle Sauerkraut|12|7|25 - 825 g cans|45.6
27|Schoggi Schokolade|11|3|100 - 100 g pieces|43.9
63|Vegie-spread|7|2|15 - 625 g jars|43.9
8|Northwoods Cranberry Sauce|3|2|12 - 12 oz jars|40
17|Alice Mutton|7|6|20 - 1 kg tins|39
12|Queso Manchego La Pastora|5|4|10 - 500 g pkgs.|38
56|Gnocchi di nonna Alice|26|5|24 - 250 g pkgs.|38
69|Gudbrandsdalsost|15|4|10 kg pkg.|36
72|Mozzarella di Giovanni|14|4|24 - 200 g pkgs.|34.8
60|Camembert Pierrot|28|4|15 - 300 g rounds|34
64|Wimmers gute Semmelknödel|12|5|20 bags x 4 pieces|33.25
53|Perth Pasties|24|6|48 pieces|32.8
32|Mascarpone Fabioli|14|4|24 - 200 g pkgs.|32
26|Gumbär Gummibärchen|11|3|100 - 250 g bags|31.23
10|Ikura|4|8|12 - 200 ml jars|31
7|Uncle Bob's Organic Dried Pears|3|7|12 - 1 lb pkgs.|30
61|Sirop d'érable|29|2|24 - 500 ml bottles|28.5
37|Gravad lax|17|8|12 - 500 g pkgs.|26
30|Nord-Ost Matjeshering|13|8|10 - 200 g glasses|25.89
6|Grandma's Boysenberry Spread|3|2|12 - 8 oz jars|25
55|Pâté chinois|25|6|24 boxes x 2 pies|24
14|Tofu|6|7|40 - 100 g pkgs.|23.25
4|Chef Anton's Cajun Seasoning|2|2|48 - 6 oz jars|22
71|Fløtemysost|15|4|10 - 500 g pkgs.|21.5
5|Chef Anton's Gumbo Mix|2|2|36 boxes|21.35
65|Louisiana Fiery Hot Pepper Sauce|2|2|32 - 8 oz bottles|21.05
11|Queso Cabrales|5|4|1 kg pkg.|21
22|Gustaf's Knäckebröd|9|5|24 - 500 g pkgs.|21
49|Maxilaku|23|3|24 - 50 g pkgs.|20
57|Ravioli Angelo|26|5|24 - 250 g pkgs.|19.5
44|Gula Malacca|20|2|20 - 2 kg bags|19.45
2|Chang|1|1|24 - 12 oz bottles|19
36|Inlagd Sill|17|8|24 - 250 g jars|19
40|Boston Crab Meat|19|8|24 - 4 oz tins|18.4
1|Chais|1|1|10 boxes x 20 bags|18
35|Steeleye Stout|16|1|24 - 12 oz bottles|18
39|Chartreuse verte|18|1|750 cc per bottle|18
76|Lakkalikööri|23|1|500 ml|18
16|Pavlova|7|3|32 - 500 g boxes|17.45
66|Louisiana Hot Spiced Okra|2|2|24 - 8 oz jars|17
50|Valkoinen suklaa|23|3|12 - 100 g bars|16.25
15|Genen Shouyu|6|2|24 - 250 ml bottles|15.5
70|Outback Lager|7|1|24 - 355 ml bottles|15
73|Röd Kaviar|17|8|24 - 150 g jars|15
25|NuNuCa Nuß-Nougat-Creme|11|3|20 - 450 g glasses|14
34|Sasquatch Ale|16|1|24 - 12 oz bottles|14
42|Singaporean Hokkien Fried Mee|20|5|32 - 1 kg pkgs.|14
67|Laughing Lumberjack Lager|16|1|24 - 12 oz bottles|14
58|Escargots de Bourgogne|27|8|24 pieces|13.25
77|Original Frankfurter grüne Soße|12|2|12 boxes|13
48|Chocolade|22|3|10 pkgs.|12.75
31|Gorgonzola Telino|14|4|12 - 100 g pkgs|12.5
68|Scottish Longbreads|8|3|10 boxes x 8 pieces|12.5
46|Spegesild|21|8|4 - 450 g glasses|12
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
21|Sir Rodney's Scones|8|3|24 pkgs. x 4 pieces|10
74|Longlife Tofu|4|7|5 kg pkg.|10
41|Jack's New England Clam Chowder|19|8|12 - 12 oz cans|9.65
45|Røgede sild|21|8|1k pkg.|9.5
47|Zaanse koeken|22|3|10 - 4 oz boxes|9.5
19|Teatime Chocolate Biscuits|8|3|10 boxes x 12 pieces|9.2
23|Tunnbröd|9|5|12 - 250 g pkgs.|9
75|Rhönbräu Klosterbier|12|1|24 - 0.5 l bottles|7.75
54|Tourtière|25|6|16 pies|7.45
52|Filo Mix|24|5|16 - 2 kg boxes|7
13|Konbu|6|8|2 kg box|6
24|Guaraná Fantástica|10|1|12 - 355 ml cans|4.5
33|Geitost|15|4|500 g|2.5
```

---

### ***Orden alfabético***

> [!NOTE]
> *Puedes ordenar por campos de texto, como `ProductName`. Los valores `NULL` aparecerán primero porque son considerados los más bajos. Si no hay `NULL`, el orden será: números (0-9), caracteres especiales y luego letras (A-Z).*

```sql
SELECT * FROM Products ORDER BY ProductName ASC;
```

```sql
sqlite> SELECT * FROM Products ORDER BY ProductName ASC;
17|Alice Mutton|7|6|20 - 1 kg tins|39
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
40|Boston Crab Meat|19|8|24 - 4 oz tins|18.4
60|Camembert Pierrot|28|4|15 - 300 g rounds|34
18|Carnarvon Tigers|7|8|16 kg pkg.|62.5
1|Chais|1|1|10 boxes x 20 bags|18
2|Chang|1|1|24 - 12 oz bottles|19
39|Chartreuse verte|18|1|750 cc per bottle|18
4|Chef Anton's Cajun Seasoning|2|2|48 - 6 oz jars|22
5|Chef Anton's Gumbo Mix|2|2|36 boxes|21.35
48|Chocolade|22|3|10 pkgs.|12.75
38|Côte de Blaye|18|1|12 - 75 cl bottles|263.5
58|Escargots de Bourgogne|27|8|24 pieces|13.25
52|Filo Mix|24|5|16 - 2 kg boxes|7
71|Fløtemysost|15|4|10 - 500 g pkgs.|21.5
33|Geitost|15|4|500 g|2.5
15|Genen Shouyu|6|2|24 - 250 ml bottles|15.5
56|Gnocchi di nonna Alice|26|5|24 - 250 g pkgs.|38
31|Gorgonzola Telino|14|4|12 - 100 g pkgs|12.5
6|Grandma's Boysenberry Spread|3|2|12 - 8 oz jars|25
37|Gravad lax|17|8|12 - 500 g pkgs.|26
24|Guaraná Fantástica|10|1|12 - 355 ml cans|4.5
69|Gudbrandsdalsost|15|4|10 kg pkg.|36
44|Gula Malacca|20|2|20 - 2 kg bags|19.45
26|Gumbär Gummibärchen|11|3|100 - 250 g bags|31.23
22|Gustaf's Knäckebröd|9|5|24 - 500 g pkgs.|21
10|Ikura|4|8|12 - 200 ml jars|31
36|Inlagd Sill|17|8|24 - 250 g jars|19
43|Ipoh Coffee|20|1|16 - 500 g tins|46
41|Jack's New England Clam Chowder|19|8|12 - 12 oz cans|9.65
13|Konbu|6|8|2 kg box|6
76|Lakkalikööri|23|1|500 ml|18
67|Laughing Lumberjack Lager|16|1|24 - 12 oz bottles|14
74|Longlife Tofu|4|7|5 kg pkg.|10
65|Louisiana Fiery Hot Pepper Sauce|2|2|32 - 8 oz bottles|21.05
66|Louisiana Hot Spiced Okra|2|2|24 - 8 oz jars|17
51|Manjimup Dried Apples|24|7|50 - 300 g pkgs.|53
32|Mascarpone Fabioli|14|4|24 - 200 g pkgs.|32
49|Maxilaku|23|3|24 - 50 g pkgs.|20
9|Mishi Kobe Niku|4|6|18 - 500 g pkgs.|97
72|Mozzarella di Giovanni|14|4|24 - 200 g pkgs.|34.8
30|Nord-Ost Matjeshering|13|8|10 - 200 g glasses|25.89
8|Northwoods Cranberry Sauce|3|2|12 - 12 oz jars|40
25|NuNuCa Nuß-Nougat-Creme|11|3|20 - 450 g glasses|14
77|Original Frankfurter grüne Soße|12|2|12 boxes|13
70|Outback Lager|7|1|24 - 355 ml bottles|15
16|Pavlova|7|3|32 - 500 g boxes|17.45
53|Perth Pasties|24|6|48 pieces|32.8
55|Pâté chinois|25|6|24 boxes x 2 pies|24
11|Queso Cabrales|5|4|1 kg pkg.|21
12|Queso Manchego La Pastora|5|4|10 - 500 g pkgs.|38
59|Raclette Courdavault|28|4|5 kg pkg.|55
57|Ravioli Angelo|26|5|24 - 250 g pkgs.|19.5
75|Rhönbräu Klosterbier|12|1|24 - 0.5 l bottles|7.75
73|Röd Kaviar|17|8|24 - 150 g jars|15
28|Rössle Sauerkraut|12|7|25 - 825 g cans|45.6
45|Røgede sild|21|8|1k pkg.|9.5
34|Sasquatch Ale|16|1|24 - 12 oz bottles|14
27|Schoggi Schokolade|11|3|100 - 100 g pieces|43.9
68|Scottish Longbreads|8|3|10 boxes x 8 pieces|12.5
42|Singaporean Hokkien Fried Mee|20|5|32 - 1 kg pkgs.|14
20|Sir Rodney's Marmalade|8|3|30 gift boxes|81
21|Sir Rodney's Scones|8|3|24 pkgs. x 4 pieces|10
61|Sirop d'érable|29|2|24 - 500 ml bottles|28.5
46|Spegesild|21|8|4 - 450 g glasses|12
35|Steeleye Stout|16|1|24 - 12 oz bottles|18
62|Tarte au sucre|29|3|48 pies|49.3
19|Teatime Chocolate Biscuits|8|3|10 boxes x 12 pieces|9.2
29|Thüringer Rostbratwurst|12|6|50 bags x 30 sausgs.|123.79
14|Tofu|6|7|40 - 100 g pkgs.|23.25
54|Tourtière|25|6|16 pies|7.45
23|Tunnbröd|9|5|12 - 250 g pkgs.|9
7|Uncle Bob's Organic Dried Pears|3|7|12 - 1 lb pkgs.|30
50|Valkoinen suklaa|23|3|12 - 100 g bars|16.25
63|Vegie-spread|7|2|15 - 625 g jars|43.9
64|Wimmers gute Semmelknödel|12|5|20 bags x 4 pieces|33.25
47|Zaanse koeken|22|3|10 - 4 oz boxes|9.5
```

**Para ordenar en orden inverso (Z-A), puedes usar:**

```sql
SELECT * FROM Products ORDER BY ProductName DESC;
```

```sql
sqlite> SELECT * FROM Products ORDER BY ProductName DESC;
47|Zaanse koeken|22|3|10 - 4 oz boxes|9.5
64|Wimmers gute Semmelknödel|12|5|20 bags x 4 pieces|33.25
63|Vegie-spread|7|2|15 - 625 g jars|43.9
50|Valkoinen suklaa|23|3|12 - 100 g bars|16.25
7|Uncle Bob's Organic Dried Pears|3|7|12 - 1 lb pkgs.|30
23|Tunnbröd|9|5|12 - 250 g pkgs.|9
54|Tourtière|25|6|16 pies|7.45
14|Tofu|6|7|40 - 100 g pkgs.|23.25
29|Thüringer Rostbratwurst|12|6|50 bags x 30 sausgs.|123.79
19|Teatime Chocolate Biscuits|8|3|10 boxes x 12 pieces|9.2
62|Tarte au sucre|29|3|48 pies|49.3
35|Steeleye Stout|16|1|24 - 12 oz bottles|18
46|Spegesild|21|8|4 - 450 g glasses|12
61|Sirop d'érable|29|2|24 - 500 ml bottles|28.5
21|Sir Rodney's Scones|8|3|24 pkgs. x 4 pieces|10
20|Sir Rodney's Marmalade|8|3|30 gift boxes|81
42|Singaporean Hokkien Fried Mee|20|5|32 - 1 kg pkgs.|14
68|Scottish Longbreads|8|3|10 boxes x 8 pieces|12.5
27|Schoggi Schokolade|11|3|100 - 100 g pieces|43.9
34|Sasquatch Ale|16|1|24 - 12 oz bottles|14
45|Røgede sild|21|8|1k pkg.|9.5
28|Rössle Sauerkraut|12|7|25 - 825 g cans|45.6
73|Röd Kaviar|17|8|24 - 150 g jars|15
75|Rhönbräu Klosterbier|12|1|24 - 0.5 l bottles|7.75
57|Ravioli Angelo|26|5|24 - 250 g pkgs.|19.5
59|Raclette Courdavault|28|4|5 kg pkg.|55
12|Queso Manchego La Pastora|5|4|10 - 500 g pkgs.|38
11|Queso Cabrales|5|4|1 kg pkg.|21
55|Pâté chinois|25|6|24 boxes x 2 pies|24
53|Perth Pasties|24|6|48 pieces|32.8
16|Pavlova|7|3|32 - 500 g boxes|17.45
70|Outback Lager|7|1|24 - 355 ml bottles|15
77|Original Frankfurter grüne Soße|12|2|12 boxes|13
25|NuNuCa Nuß-Nougat-Creme|11|3|20 - 450 g glasses|14
8|Northwoods Cranberry Sauce|3|2|12 - 12 oz jars|40
30|Nord-Ost Matjeshering|13|8|10 - 200 g glasses|25.89
72|Mozzarella di Giovanni|14|4|24 - 200 g pkgs.|34.8
9|Mishi Kobe Niku|4|6|18 - 500 g pkgs.|97
49|Maxilaku|23|3|24 - 50 g pkgs.|20
32|Mascarpone Fabioli|14|4|24 - 200 g pkgs.|32
51|Manjimup Dried Apples|24|7|50 - 300 g pkgs.|53
66|Louisiana Hot Spiced Okra|2|2|24 - 8 oz jars|17
65|Louisiana Fiery Hot Pepper Sauce|2|2|32 - 8 oz bottles|21.05
74|Longlife Tofu|4|7|5 kg pkg.|10
67|Laughing Lumberjack Lager|16|1|24 - 12 oz bottles|14
76|Lakkalikööri|23|1|500 ml|18
13|Konbu|6|8|2 kg box|6
41|Jack's New England Clam Chowder|19|8|12 - 12 oz cans|9.65
43|Ipoh Coffee|20|1|16 - 500 g tins|46
36|Inlagd Sill|17|8|24 - 250 g jars|19
10|Ikura|4|8|12 - 200 ml jars|31
22|Gustaf's Knäckebröd|9|5|24 - 500 g pkgs.|21
26|Gumbär Gummibärchen|11|3|100 - 250 g bags|31.23
44|Gula Malacca|20|2|20 - 2 kg bags|19.45
69|Gudbrandsdalsost|15|4|10 kg pkg.|36
24|Guaraná Fantástica|10|1|12 - 355 ml cans|4.5
37|Gravad lax|17|8|12 - 500 g pkgs.|26
6|Grandma's Boysenberry Spread|3|2|12 - 8 oz jars|25
31|Gorgonzola Telino|14|4|12 - 100 g pkgs|12.5
56|Gnocchi di nonna Alice|26|5|24 - 250 g pkgs.|38
15|Genen Shouyu|6|2|24 - 250 ml bottles|15.5
33|Geitost|15|4|500 g|2.5
71|Fløtemysost|15|4|10 - 500 g pkgs.|21.5
52|Filo Mix|24|5|16 - 2 kg boxes|7
58|Escargots de Bourgogne|27|8|24 pieces|13.25
38|Côte de Blaye|18|1|12 - 75 cl bottles|263.5
48|Chocolade|22|3|10 pkgs.|12.75
5|Chef Anton's Gumbo Mix|2|2|36 boxes|21.35
4|Chef Anton's Cajun Seasoning|2|2|48 - 6 oz jars|22
39|Chartreuse verte|18|1|750 cc per bottle|18
2|Chang|1|1|24 - 12 oz bottles|19
1|Chais|1|1|10 boxes x 20 bags|18
18|Carnarvon Tigers|7|8|16 kg pkg.|62.5
60|Camembert Pierrot|28|4|15 - 300 g rounds|34
40|Boston Crab Meat|19|8|24 - 4 oz tins|18.4
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
17|Alice Mutton|7|6|20 - 1 kg tins|39
```

---

### ***Insertando valores `NULL` para probar***

- **Vamos a insertar varios registros con valores `NULL` en los campos `ProductName` y otros campos para realizar pruebas de ordenación:**

```sql
INSERT INTO Products (ProductName, SupplierID, CategoryID, Unit, Price) VALUES (NULL, NULL, NULL, NULL, 0);
INSERT INTO Products (ProductName, SupplierID, CategoryID, Unit, Price) VALUES (NULL, NULL, 3, NULL, 0);
INSERT INTO Products (ProductName, SupplierID, CategoryID, Unit, Price) VALUES (NULL, NULL, 6, NULL, 0);
INSERT INTO Products (ProductName, SupplierID, CategoryID, Unit, Price) VALUES (NULL, NULL, 9, NULL, 0);
```

```sql
sqlite> INSERT INTO Products (ProductName, SupplierID, CategoryID, Unit, Price) VALUES (NULL, NULL, NULL, NULL, 0);
sqlite> INSERT INTO Products (ProductName, SupplierID, CategoryID, Unit, Price) VALUES (NULL, NULL, 3, NULL, 0);
sqlite> INSERT INTO Products (ProductName, SupplierID, CategoryID, Unit, Price) VALUES (NULL, NULL, 6, NULL, 0);
sqlite> INSERT INTO Products (ProductName, SupplierID, CategoryID, Unit, Price) VALUES (NULL, NULL, 9, NULL, 0);
```

---

### ***Controlando la posición de los valores `NULL`***

- **Para mostrar los valores `NULL` al final de la lista:**

```sql
SELECT * FROM Products ORDER BY ProductName ASC NULLS LAST;
```

```sql
sqlite> SELECT * FROM Products ORDER BY ProductName ASC NULLS LAST;
17|Alice Mutton|7|6|20 - 1 kg tins|39
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
40|Boston Crab Meat|19|8|24 - 4 oz tins|18.4
60|Camembert Pierrot|28|4|15 - 300 g rounds|34
18|Carnarvon Tigers|7|8|16 kg pkg.|62.5
1|Chais|1|1|10 boxes x 20 bags|18
2|Chang|1|1|24 - 12 oz bottles|19
39|Chartreuse verte|18|1|750 cc per bottle|18
4|Chef Anton's Cajun Seasoning|2|2|48 - 6 oz jars|22
5|Chef Anton's Gumbo Mix|2|2|36 boxes|21.35
48|Chocolade|22|3|10 pkgs.|12.75
38|Côte de Blaye|18|1|12 - 75 cl bottles|263.5
58|Escargots de Bourgogne|27|8|24 pieces|13.25
52|Filo Mix|24|5|16 - 2 kg boxes|7
71|Fløtemysost|15|4|10 - 500 g pkgs.|21.5
33|Geitost|15|4|500 g|2.5
15|Genen Shouyu|6|2|24 - 250 ml bottles|15.5
56|Gnocchi di nonna Alice|26|5|24 - 250 g pkgs.|38
31|Gorgonzola Telino|14|4|12 - 100 g pkgs|12.5
6|Grandma's Boysenberry Spread|3|2|12 - 8 oz jars|25
37|Gravad lax|17|8|12 - 500 g pkgs.|26
24|Guaraná Fantástica|10|1|12 - 355 ml cans|4.5
69|Gudbrandsdalsost|15|4|10 kg pkg.|36
44|Gula Malacca|20|2|20 - 2 kg bags|19.45
26|Gumbär Gummibärchen|11|3|100 - 250 g bags|31.23
22|Gustaf's Knäckebröd|9|5|24 - 500 g pkgs.|21
10|Ikura|4|8|12 - 200 ml jars|31
36|Inlagd Sill|17|8|24 - 250 g jars|19
43|Ipoh Coffee|20|1|16 - 500 g tins|46
41|Jack's New England Clam Chowder|19|8|12 - 12 oz cans|9.65
13|Konbu|6|8|2 kg box|6
76|Lakkalikööri|23|1|500 ml|18
67|Laughing Lumberjack Lager|16|1|24 - 12 oz bottles|14
74|Longlife Tofu|4|7|5 kg pkg.|10
65|Louisiana Fiery Hot Pepper Sauce|2|2|32 - 8 oz bottles|21.05
66|Louisiana Hot Spiced Okra|2|2|24 - 8 oz jars|17
51|Manjimup Dried Apples|24|7|50 - 300 g pkgs.|53
32|Mascarpone Fabioli|14|4|24 - 200 g pkgs.|32
49|Maxilaku|23|3|24 - 50 g pkgs.|20
9|Mishi Kobe Niku|4|6|18 - 500 g pkgs.|97
72|Mozzarella di Giovanni|14|4|24 - 200 g pkgs.|34.8
30|Nord-Ost Matjeshering|13|8|10 - 200 g glasses|25.89
8|Northwoods Cranberry Sauce|3|2|12 - 12 oz jars|40
25|NuNuCa Nuß-Nougat-Creme|11|3|20 - 450 g glasses|14
77|Original Frankfurter grüne Soße|12|2|12 boxes|13
70|Outback Lager|7|1|24 - 355 ml bottles|15
16|Pavlova|7|3|32 - 500 g boxes|17.45
53|Perth Pasties|24|6|48 pieces|32.8
55|Pâté chinois|25|6|24 boxes x 2 pies|24
11|Queso Cabrales|5|4|1 kg pkg.|21
12|Queso Manchego La Pastora|5|4|10 - 500 g pkgs.|38
59|Raclette Courdavault|28|4|5 kg pkg.|55
57|Ravioli Angelo|26|5|24 - 250 g pkgs.|19.5
75|Rhönbräu Klosterbier|12|1|24 - 0.5 l bottles|7.75
73|Röd Kaviar|17|8|24 - 150 g jars|15
28|Rössle Sauerkraut|12|7|25 - 825 g cans|45.6
45|Røgede sild|21|8|1k pkg.|9.5
34|Sasquatch Ale|16|1|24 - 12 oz bottles|14
27|Schoggi Schokolade|11|3|100 - 100 g pieces|43.9
68|Scottish Longbreads|8|3|10 boxes x 8 pieces|12.5
42|Singaporean Hokkien Fried Mee|20|5|32 - 1 kg pkgs.|14
20|Sir Rodney's Marmalade|8|3|30 gift boxes|81
21|Sir Rodney's Scones|8|3|24 pkgs. x 4 pieces|10
61|Sirop d'érable|29|2|24 - 500 ml bottles|28.5
46|Spegesild|21|8|4 - 450 g glasses|12
35|Steeleye Stout|16|1|24 - 12 oz bottles|18
62|Tarte au sucre|29|3|48 pies|49.3
19|Teatime Chocolate Biscuits|8|3|10 boxes x 12 pieces|9.2
29|Thüringer Rostbratwurst|12|6|50 bags x 30 sausgs.|123.79
14|Tofu|6|7|40 - 100 g pkgs.|23.25
54|Tourtière|25|6|16 pies|7.45
23|Tunnbröd|9|5|12 - 250 g pkgs.|9
7|Uncle Bob's Organic Dried Pears|3|7|12 - 1 lb pkgs.|30
50|Valkoinen suklaa|23|3|12 - 100 g bars|16.25
63|Vegie-spread|7|2|15 - 625 g jars|43.9
64|Wimmers gute Semmelknödel|12|5|20 bags x 4 pieces|33.25
47|Zaanse koeken|22|3|10 - 4 oz boxes|9.5
78|||||0
79|||3||0
80|||6||0
81|||9||0
```

```sql
SELECT * FROM Products ORDER BY ProductName DESC NULLS LAST;
```

```sql
sqlite> SELECT * FROM Products ORDER BY ProductName DESC NULLS LAST;
47|Zaanse koeken|22|3|10 - 4 oz boxes|9.5
64|Wimmers gute Semmelknödel|12|5|20 bags x 4 pieces|33.25
63|Vegie-spread|7|2|15 - 625 g jars|43.9
50|Valkoinen suklaa|23|3|12 - 100 g bars|16.25
7|Uncle Bob's Organic Dried Pears|3|7|12 - 1 lb pkgs.|30
23|Tunnbröd|9|5|12 - 250 g pkgs.|9
54|Tourtière|25|6|16 pies|7.45
14|Tofu|6|7|40 - 100 g pkgs.|23.25
29|Thüringer Rostbratwurst|12|6|50 bags x 30 sausgs.|123.79
19|Teatime Chocolate Biscuits|8|3|10 boxes x 12 pieces|9.2
62|Tarte au sucre|29|3|48 pies|49.3
35|Steeleye Stout|16|1|24 - 12 oz bottles|18
46|Spegesild|21|8|4 - 450 g glasses|12
61|Sirop d'érable|29|2|24 - 500 ml bottles|28.5
21|Sir Rodney's Scones|8|3|24 pkgs. x 4 pieces|10
20|Sir Rodney's Marmalade|8|3|30 gift boxes|81
42|Singaporean Hokkien Fried Mee|20|5|32 - 1 kg pkgs.|14
68|Scottish Longbreads|8|3|10 boxes x 8 pieces|12.5
27|Schoggi Schokolade|11|3|100 - 100 g pieces|43.9
34|Sasquatch Ale|16|1|24 - 12 oz bottles|14
45|Røgede sild|21|8|1k pkg.|9.5
28|Rössle Sauerkraut|12|7|25 - 825 g cans|45.6
73|Röd Kaviar|17|8|24 - 150 g jars|15
75|Rhönbräu Klosterbier|12|1|24 - 0.5 l bottles|7.75
57|Ravioli Angelo|26|5|24 - 250 g pkgs.|19.5
59|Raclette Courdavault|28|4|5 kg pkg.|55
12|Queso Manchego La Pastora|5|4|10 - 500 g pkgs.|38
11|Queso Cabrales|5|4|1 kg pkg.|21
55|Pâté chinois|25|6|24 boxes x 2 pies|24
53|Perth Pasties|24|6|48 pieces|32.8
16|Pavlova|7|3|32 - 500 g boxes|17.45
70|Outback Lager|7|1|24 - 355 ml bottles|15
77|Original Frankfurter grüne Soße|12|2|12 boxes|13
25|NuNuCa Nuß-Nougat-Creme|11|3|20 - 450 g glasses|14
8|Northwoods Cranberry Sauce|3|2|12 - 12 oz jars|40
30|Nord-Ost Matjeshering|13|8|10 - 200 g glasses|25.89
72|Mozzarella di Giovanni|14|4|24 - 200 g pkgs.|34.8
9|Mishi Kobe Niku|4|6|18 - 500 g pkgs.|97
49|Maxilaku|23|3|24 - 50 g pkgs.|20
32|Mascarpone Fabioli|14|4|24 - 200 g pkgs.|32
51|Manjimup Dried Apples|24|7|50 - 300 g pkgs.|53
66|Louisiana Hot Spiced Okra|2|2|24 - 8 oz jars|17
65|Louisiana Fiery Hot Pepper Sauce|2|2|32 - 8 oz bottles|21.05
74|Longlife Tofu|4|7|5 kg pkg.|10
67|Laughing Lumberjack Lager|16|1|24 - 12 oz bottles|14
76|Lakkalikööri|23|1|500 ml|18
13|Konbu|6|8|2 kg box|6
41|Jack's New England Clam Chowder|19|8|12 - 12 oz cans|9.65
43|Ipoh Coffee|20|1|16 - 500 g tins|46
36|Inlagd Sill|17|8|24 - 250 g jars|19
10|Ikura|4|8|12 - 200 ml jars|31
22|Gustaf's Knäckebröd|9|5|24 - 500 g pkgs.|21
26|Gumbär Gummibärchen|11|3|100 - 250 g bags|31.23
44|Gula Malacca|20|2|20 - 2 kg bags|19.45
69|Gudbrandsdalsost|15|4|10 kg pkg.|36
24|Guaraná Fantástica|10|1|12 - 355 ml cans|4.5
37|Gravad lax|17|8|12 - 500 g pkgs.|26
6|Grandma's Boysenberry Spread|3|2|12 - 8 oz jars|25
31|Gorgonzola Telino|14|4|12 - 100 g pkgs|12.5
56|Gnocchi di nonna Alice|26|5|24 - 250 g pkgs.|38
15|Genen Shouyu|6|2|24 - 250 ml bottles|15.5
33|Geitost|15|4|500 g|2.5
71|Fløtemysost|15|4|10 - 500 g pkgs.|21.5
52|Filo Mix|24|5|16 - 2 kg boxes|7
58|Escargots de Bourgogne|27|8|24 pieces|13.25
38|Côte de Blaye|18|1|12 - 75 cl bottles|263.5
48|Chocolade|22|3|10 pkgs.|12.75
5|Chef Anton's Gumbo Mix|2|2|36 boxes|21.35
4|Chef Anton's Cajun Seasoning|2|2|48 - 6 oz jars|22
39|Chartreuse verte|18|1|750 cc per bottle|18
2|Chang|1|1|24 - 12 oz bottles|19
1|Chais|1|1|10 boxes x 20 bags|18
18|Carnarvon Tigers|7|8|16 kg pkg.|62.5
60|Camembert Pierrot|28|4|15 - 300 g rounds|34
40|Boston Crab Meat|19|8|24 - 4 oz tins|18.4
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
17|Alice Mutton|7|6|20 - 1 kg tins|39
78|||||0
79|||3||0
80|||6||0
81|||9||0
```

- **Para mostrar los valores `NULL` al principio:**

```sql
SELECT * FROM Products ORDER BY ProductName ASC NULLS FIRST;
```

```sql
sqlite> SELECT * FROM Products ORDER BY ProductName ASC NULLS FIRST;
78|||||0
79|||3||0
80|||6||0
81|||9||0
17|Alice Mutton|7|6|20 - 1 kg tins|39
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
40|Boston Crab Meat|19|8|24 - 4 oz tins|18.4
60|Camembert Pierrot|28|4|15 - 300 g rounds|34
18|Carnarvon Tigers|7|8|16 kg pkg.|62.5
1|Chais|1|1|10 boxes x 20 bags|18
2|Chang|1|1|24 - 12 oz bottles|19
39|Chartreuse verte|18|1|750 cc per bottle|18
4|Chef Anton's Cajun Seasoning|2|2|48 - 6 oz jars|22
5|Chef Anton's Gumbo Mix|2|2|36 boxes|21.35
48|Chocolade|22|3|10 pkgs.|12.75
38|Côte de Blaye|18|1|12 - 75 cl bottles|263.5
58|Escargots de Bourgogne|27|8|24 pieces|13.25
52|Filo Mix|24|5|16 - 2 kg boxes|7
71|Fløtemysost|15|4|10 - 500 g pkgs.|21.5
33|Geitost|15|4|500 g|2.5
15|Genen Shouyu|6|2|24 - 250 ml bottles|15.5
56|Gnocchi di nonna Alice|26|5|24 - 250 g pkgs.|38
31|Gorgonzola Telino|14|4|12 - 100 g pkgs|12.5
6|Grandma's Boysenberry Spread|3|2|12 - 8 oz jars|25
37|Gravad lax|17|8|12 - 500 g pkgs.|26
24|Guaraná Fantástica|10|1|12 - 355 ml cans|4.5
69|Gudbrandsdalsost|15|4|10 kg pkg.|36
44|Gula Malacca|20|2|20 - 2 kg bags|19.45
26|Gumbär Gummibärchen|11|3|100 - 250 g bags|31.23
22|Gustaf's Knäckebröd|9|5|24 - 500 g pkgs.|21
10|Ikura|4|8|12 - 200 ml jars|31
36|Inlagd Sill|17|8|24 - 250 g jars|19
43|Ipoh Coffee|20|1|16 - 500 g tins|46
41|Jack's New England Clam Chowder|19|8|12 - 12 oz cans|9.65
13|Konbu|6|8|2 kg box|6
76|Lakkalikööri|23|1|500 ml|18
67|Laughing Lumberjack Lager|16|1|24 - 12 oz bottles|14
74|Longlife Tofu|4|7|5 kg pkg.|10
65|Louisiana Fiery Hot Pepper Sauce|2|2|32 - 8 oz bottles|21.05
66|Louisiana Hot Spiced Okra|2|2|24 - 8 oz jars|17
51|Manjimup Dried Apples|24|7|50 - 300 g pkgs.|53
32|Mascarpone Fabioli|14|4|24 - 200 g pkgs.|32
49|Maxilaku|23|3|24 - 50 g pkgs.|20
9|Mishi Kobe Niku|4|6|18 - 500 g pkgs.|97
72|Mozzarella di Giovanni|14|4|24 - 200 g pkgs.|34.8
30|Nord-Ost Matjeshering|13|8|10 - 200 g glasses|25.89
8|Northwoods Cranberry Sauce|3|2|12 - 12 oz jars|40
25|NuNuCa Nuß-Nougat-Creme|11|3|20 - 450 g glasses|14
77|Original Frankfurter grüne Soße|12|2|12 boxes|13
70|Outback Lager|7|1|24 - 355 ml bottles|15
16|Pavlova|7|3|32 - 500 g boxes|17.45
53|Perth Pasties|24|6|48 pieces|32.8
55|Pâté chinois|25|6|24 boxes x 2 pies|24
11|Queso Cabrales|5|4|1 kg pkg.|21
12|Queso Manchego La Pastora|5|4|10 - 500 g pkgs.|38
59|Raclette Courdavault|28|4|5 kg pkg.|55
57|Ravioli Angelo|26|5|24 - 250 g pkgs.|19.5
75|Rhönbräu Klosterbier|12|1|24 - 0.5 l bottles|7.75
73|Röd Kaviar|17|8|24 - 150 g jars|15
28|Rössle Sauerkraut|12|7|25 - 825 g cans|45.6
45|Røgede sild|21|8|1k pkg.|9.5
34|Sasquatch Ale|16|1|24 - 12 oz bottles|14
27|Schoggi Schokolade|11|3|100 - 100 g pieces|43.9
68|Scottish Longbreads|8|3|10 boxes x 8 pieces|12.5
42|Singaporean Hokkien Fried Mee|20|5|32 - 1 kg pkgs.|14
20|Sir Rodney's Marmalade|8|3|30 gift boxes|81
21|Sir Rodney's Scones|8|3|24 pkgs. x 4 pieces|10
61|Sirop d'érable|29|2|24 - 500 ml bottles|28.5
46|Spegesild|21|8|4 - 450 g glasses|12
35|Steeleye Stout|16|1|24 - 12 oz bottles|18
62|Tarte au sucre|29|3|48 pies|49.3
19|Teatime Chocolate Biscuits|8|3|10 boxes x 12 pieces|9.2
29|Thüringer Rostbratwurst|12|6|50 bags x 30 sausgs.|123.79
14|Tofu|6|7|40 - 100 g pkgs.|23.25
54|Tourtière|25|6|16 pies|7.45
23|Tunnbröd|9|5|12 - 250 g pkgs.|9
7|Uncle Bob's Organic Dried Pears|3|7|12 - 1 lb pkgs.|30
50|Valkoinen suklaa|23|3|12 - 100 g bars|16.25
63|Vegie-spread|7|2|15 - 625 g jars|43.9
64|Wimmers gute Semmelknödel|12|5|20 bags x 4 pieces|33.25
47|Zaanse koeken|22|3|10 - 4 oz boxes|9.5
```

```sql
SELECT * FROM Products ORDER BY ProductName DESC NULLS FIRST;
```

```sql
sqlite> SELECT * FROM Products ORDER BY ProductName DESC NULLS FIRST;
78|||||0
79|||3||0
80|||6||0
81|||9||0
47|Zaanse koeken|22|3|10 - 4 oz boxes|9.5
64|Wimmers gute Semmelknödel|12|5|20 bags x 4 pieces|33.25
63|Vegie-spread|7|2|15 - 625 g jars|43.9
50|Valkoinen suklaa|23|3|12 - 100 g bars|16.25
7|Uncle Bob's Organic Dried Pears|3|7|12 - 1 lb pkgs.|30
23|Tunnbröd|9|5|12 - 250 g pkgs.|9
54|Tourtière|25|6|16 pies|7.45
14|Tofu|6|7|40 - 100 g pkgs.|23.25
29|Thüringer Rostbratwurst|12|6|50 bags x 30 sausgs.|123.79
19|Teatime Chocolate Biscuits|8|3|10 boxes x 12 pieces|9.2
62|Tarte au sucre|29|3|48 pies|49.3
35|Steeleye Stout|16|1|24 - 12 oz bottles|18
46|Spegesild|21|8|4 - 450 g glasses|12
61|Sirop d'érable|29|2|24 - 500 ml bottles|28.5
21|Sir Rodney's Scones|8|3|24 pkgs. x 4 pieces|10
20|Sir Rodney's Marmalade|8|3|30 gift boxes|81
42|Singaporean Hokkien Fried Mee|20|5|32 - 1 kg pkgs.|14
68|Scottish Longbreads|8|3|10 boxes x 8 pieces|12.5
27|Schoggi Schokolade|11|3|100 - 100 g pieces|43.9
34|Sasquatch Ale|16|1|24 - 12 oz bottles|14
45|Røgede sild|21|8|1k pkg.|9.5
28|Rössle Sauerkraut|12|7|25 - 825 g cans|45.6
73|Röd Kaviar|17|8|24 - 150 g jars|15
75|Rhönbräu Klosterbier|12|1|24 - 0.5 l bottles|7.75
57|Ravioli Angelo|26|5|24 - 250 g pkgs.|19.5
59|Raclette Courdavault|28|4|5 kg pkg.|55
12|Queso Manchego La Pastora|5|4|10 - 500 g pkgs.|38
11|Queso Cabrales|5|4|1 kg pkg.|21
55|Pâté chinois|25|6|24 boxes x 2 pies|24
53|Perth Pasties|24|6|48 pieces|32.8
16|Pavlova|7|3|32 - 500 g boxes|17.45
70|Outback Lager|7|1|24 - 355 ml bottles|15
77|Original Frankfurter grüne Soße|12|2|12 boxes|13
25|NuNuCa Nuß-Nougat-Creme|11|3|20 - 450 g glasses|14
8|Northwoods Cranberry Sauce|3|2|12 - 12 oz jars|40
30|Nord-Ost Matjeshering|13|8|10 - 200 g glasses|25.89
72|Mozzarella di Giovanni|14|4|24 - 200 g pkgs.|34.8
9|Mishi Kobe Niku|4|6|18 - 500 g pkgs.|97
49|Maxilaku|23|3|24 - 50 g pkgs.|20
32|Mascarpone Fabioli|14|4|24 - 200 g pkgs.|32
51|Manjimup Dried Apples|24|7|50 - 300 g pkgs.|53
66|Louisiana Hot Spiced Okra|2|2|24 - 8 oz jars|17
65|Louisiana Fiery Hot Pepper Sauce|2|2|32 - 8 oz bottles|21.05
74|Longlife Tofu|4|7|5 kg pkg.|10
67|Laughing Lumberjack Lager|16|1|24 - 12 oz bottles|14
76|Lakkalikööri|23|1|500 ml|18
13|Konbu|6|8|2 kg box|6
41|Jack's New England Clam Chowder|19|8|12 - 12 oz cans|9.65
43|Ipoh Coffee|20|1|16 - 500 g tins|46
36|Inlagd Sill|17|8|24 - 250 g jars|19
10|Ikura|4|8|12 - 200 ml jars|31
22|Gustaf's Knäckebröd|9|5|24 - 500 g pkgs.|21
26|Gumbär Gummibärchen|11|3|100 - 250 g bags|31.23
44|Gula Malacca|20|2|20 - 2 kg bags|19.45
69|Gudbrandsdalsost|15|4|10 kg pkg.|36
24|Guaraná Fantástica|10|1|12 - 355 ml cans|4.5
37|Gravad lax|17|8|12 - 500 g pkgs.|26
6|Grandma's Boysenberry Spread|3|2|12 - 8 oz jars|25
31|Gorgonzola Telino|14|4|12 - 100 g pkgs|12.5
56|Gnocchi di nonna Alice|26|5|24 - 250 g pkgs.|38
15|Genen Shouyu|6|2|24 - 250 ml bottles|15.5
33|Geitost|15|4|500 g|2.5
71|Fløtemysost|15|4|10 - 500 g pkgs.|21.5
52|Filo Mix|24|5|16 - 2 kg boxes|7
58|Escargots de Bourgogne|27|8|24 pieces|13.25
38|Côte de Blaye|18|1|12 - 75 cl bottles|263.5
48|Chocolade|22|3|10 pkgs.|12.75
5|Chef Anton's Gumbo Mix|2|2|36 boxes|21.35
4|Chef Anton's Cajun Seasoning|2|2|48 - 6 oz jars|22
39|Chartreuse verte|18|1|750 cc per bottle|18
2|Chang|1|1|24 - 12 oz bottles|19
1|Chais|1|1|10 boxes x 20 bags|18
18|Carnarvon Tigers|7|8|16 kg pkg.|62.5
60|Camembert Pierrot|28|4|15 - 300 g rounds|34
40|Boston Crab Meat|19|8|24 - 4 oz tins|18.4
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
17|Alice Mutton|7|6|20 - 1 kg tins|39
```

---

### ***Orden aleatorio***

- *La función `RANDOM()` genera un orden aleatorio. Ten en cuenta que al usar `RANDOM()` con `NULLS LAST`, el comportamiento de `NULLS LAST` no se respetará:*

```sql
SELECT * FROM Products ORDER BY RANDOM() NULLS LAST;
```

```sql
sqlite> SELECT * FROM Products ORDER BY RANDOM() NULLS LAST;
16|Pavlova|7|3|32 - 500 g boxes|17.45
25|NuNuCa Nuß-Nougat-Creme|11|3|20 - 450 g glasses|14
45|Røgede sild|21|8|1k pkg.|9.5
39|Chartreuse verte|18|1|750 cc per bottle|18
26|Gumbär Gummibärchen|11|3|100 - 250 g bags|31.23
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
37|Gravad lax|17|8|12 - 500 g pkgs.|26
7|Uncle Bob's Organic Dried Pears|3|7|12 - 1 lb pkgs.|30
17|Alice Mutton|7|6|20 - 1 kg tins|39
14|Tofu|6|7|40 - 100 g pkgs.|23.25
54|Tourtière|25|6|16 pies|7.45
69|Gudbrandsdalsost|15|4|10 kg pkg.|36
80|||6||0
74|Longlife Tofu|4|7|5 kg pkg.|10
1|Chais|1|1|10 boxes x 20 bags|18
57|Ravioli Angelo|26|5|24 - 250 g pkgs.|19.5
60|Camembert Pierrot|28|4|15 - 300 g rounds|34
52|Filo Mix|24|5|16 - 2 kg boxes|7
23|Tunnbröd|9|5|12 - 250 g pkgs.|9
9|Mishi Kobe Niku|4|6|18 - 500 g pkgs.|97
48|Chocolade|22|3|10 pkgs.|12.75
49|Maxilaku|23|3|24 - 50 g pkgs.|20
50|Valkoinen suklaa|23|3|12 - 100 g bars|16.25
19|Teatime Chocolate Biscuits|8|3|10 boxes x 12 pieces|9.2
58|Escargots de Bourgogne|27|8|24 pieces|13.25
34|Sasquatch Ale|16|1|24 - 12 oz bottles|14
41|Jack's New England Clam Chowder|19|8|12 - 12 oz cans|9.65
11|Queso Cabrales|5|4|1 kg pkg.|21
65|Louisiana Fiery Hot Pepper Sauce|2|2|32 - 8 oz bottles|21.05
55|Pâté chinois|25|6|24 boxes x 2 pies|24
18|Carnarvon Tigers|7|8|16 kg pkg.|62.5
64|Wimmers gute Semmelknödel|12|5|20 bags x 4 pieces|33.25
63|Vegie-spread|7|2|15 - 625 g jars|43.9
35|Steeleye Stout|16|1|24 - 12 oz bottles|18
5|Chef Anton's Gumbo Mix|2|2|36 boxes|21.35
32|Mascarpone Fabioli|14|4|24 - 200 g pkgs.|32
44|Gula Malacca|20|2|20 - 2 kg bags|19.45
70|Outback Lager|7|1|24 - 355 ml bottles|15
6|Grandma's Boysenberry Spread|3|2|12 - 8 oz jars|25
20|Sir Rodney's Marmalade|8|3|30 gift boxes|81
27|Schoggi Schokolade|11|3|100 - 100 g pieces|43.9
76|Lakkalikööri|23|1|500 ml|18
53|Perth Pasties|24|6|48 pieces|32.8
77|Original Frankfurter grüne Soße|12|2|12 boxes|13
78|||||0
28|Rössle Sauerkraut|12|7|25 - 825 g cans|45.6
36|Inlagd Sill|17|8|24 - 250 g jars|19
73|Röd Kaviar|17|8|24 - 150 g jars|15
79|||3||0
42|Singaporean Hokkien Fried Mee|20|5|32 - 1 kg pkgs.|14
62|Tarte au sucre|29|3|48 pies|49.3
22|Gustaf's Knäckebröd|9|5|24 - 500 g pkgs.|21
31|Gorgonzola Telino|14|4|12 - 100 g pkgs|12.5
51|Manjimup Dried Apples|24|7|50 - 300 g pkgs.|53
21|Sir Rodney's Scones|8|3|24 pkgs. x 4 pieces|10
72|Mozzarella di Giovanni|14|4|24 - 200 g pkgs.|34.8
68|Scottish Longbreads|8|3|10 boxes x 8 pieces|12.5
43|Ipoh Coffee|20|1|16 - 500 g tins|46
59|Raclette Courdavault|28|4|5 kg pkg.|55
2|Chang|1|1|24 - 12 oz bottles|19
13|Konbu|6|8|2 kg box|6
67|Laughing Lumberjack Lager|16|1|24 - 12 oz bottles|14
12|Queso Manchego La Pastora|5|4|10 - 500 g pkgs.|38
61|Sirop d'érable|29|2|24 - 500 ml bottles|28.5
71|Fløtemysost|15|4|10 - 500 g pkgs.|21.5
47|Zaanse koeken|22|3|10 - 4 oz boxes|9.5
30|Nord-Ost Matjeshering|13|8|10 - 200 g glasses|25.89
46|Spegesild|21|8|4 - 450 g glasses|12
24|Guaraná Fantástica|10|1|12 - 355 ml cans|4.5
66|Louisiana Hot Spiced Okra|2|2|24 - 8 oz jars|17
29|Thüringer Rostbratwurst|12|6|50 bags x 30 sausgs.|123.79
81|||9||0
15|Genen Shouyu|6|2|24 - 250 ml bottles|15.5
40|Boston Crab Meat|19|8|24 - 4 oz tins|18.4
8|Northwoods Cranberry Sauce|3|2|12 - 12 oz jars|40
56|Gnocchi di nonna Alice|26|5|24 - 250 g pkgs.|38
4|Chef Anton's Cajun Seasoning|2|2|48 - 6 oz jars|22
33|Geitost|15|4|500 g|2.5
38|Côte de Blaye|18|1|12 - 75 cl bottles|263.5
10|Ikura|4|8|12 - 200 ml jars|31
75|Rhönbräu Klosterbier|12|1|24 - 0.5 l bottles|7.75
```

---

### ***Orden combinado***

- **Puedes ordenar por varios campos. Por ejemplo:**

- *Primero ordenamos por `ProductName`, y si hay valores `NULL`, se ordenan por `CategoryID` en orden descendente:*

```sql
SELECT * FROM Products ORDER BY ProductName, CategoryID DESC;
```

```sql
sqlite> SELECT * FROM Products ORDER BY ProductName, CategoryID DESC;
81|||9||0
80|||6||0
79|||3||0
78|||||0
17|Alice Mutton|7|6|20 - 1 kg tins|39
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
40|Boston Crab Meat|19|8|24 - 4 oz tins|18.4
60|Camembert Pierrot|28|4|15 - 300 g rounds|34
18|Carnarvon Tigers|7|8|16 kg pkg.|62.5
1|Chais|1|1|10 boxes x 20 bags|18
2|Chang|1|1|24 - 12 oz bottles|19
39|Chartreuse verte|18|1|750 cc per bottle|18
4|Chef Anton's Cajun Seasoning|2|2|48 - 6 oz jars|22
5|Chef Anton's Gumbo Mix|2|2|36 boxes|21.35
48|Chocolade|22|3|10 pkgs.|12.75
38|Côte de Blaye|18|1|12 - 75 cl bottles|263.5
58|Escargots de Bourgogne|27|8|24 pieces|13.25
52|Filo Mix|24|5|16 - 2 kg boxes|7
71|Fløtemysost|15|4|10 - 500 g pkgs.|21.5
33|Geitost|15|4|500 g|2.5
15|Genen Shouyu|6|2|24 - 250 ml bottles|15.5
56|Gnocchi di nonna Alice|26|5|24 - 250 g pkgs.|38
31|Gorgonzola Telino|14|4|12 - 100 g pkgs|12.5
6|Grandma's Boysenberry Spread|3|2|12 - 8 oz jars|25
37|Gravad lax|17|8|12 - 500 g pkgs.|26
24|Guaraná Fantástica|10|1|12 - 355 ml cans|4.5
69|Gudbrandsdalsost|15|4|10 kg pkg.|36
44|Gula Malacca|20|2|20 - 2 kg bags|19.45
26|Gumbär Gummibärchen|11|3|100 - 250 g bags|31.23
22|Gustaf's Knäckebröd|9|5|24 - 500 g pkgs.|21
10|Ikura|4|8|12 - 200 ml jars|31
36|Inlagd Sill|17|8|24 - 250 g jars|19
43|Ipoh Coffee|20|1|16 - 500 g tins|46
41|Jack's New England Clam Chowder|19|8|12 - 12 oz cans|9.65
13|Konbu|6|8|2 kg box|6
76|Lakkalikööri|23|1|500 ml|18
67|Laughing Lumberjack Lager|16|1|24 - 12 oz bottles|14
74|Longlife Tofu|4|7|5 kg pkg.|10
65|Louisiana Fiery Hot Pepper Sauce|2|2|32 - 8 oz bottles|21.05
66|Louisiana Hot Spiced Okra|2|2|24 - 8 oz jars|17
51|Manjimup Dried Apples|24|7|50 - 300 g pkgs.|53
32|Mascarpone Fabioli|14|4|24 - 200 g pkgs.|32
49|Maxilaku|23|3|24 - 50 g pkgs.|20
9|Mishi Kobe Niku|4|6|18 - 500 g pkgs.|97
72|Mozzarella di Giovanni|14|4|24 - 200 g pkgs.|34.8
30|Nord-Ost Matjeshering|13|8|10 - 200 g glasses|25.89
8|Northwoods Cranberry Sauce|3|2|12 - 12 oz jars|40
25|NuNuCa Nuß-Nougat-Creme|11|3|20 - 450 g glasses|14
77|Original Frankfurter grüne Soße|12|2|12 boxes|13
70|Outback Lager|7|1|24 - 355 ml bottles|15
16|Pavlova|7|3|32 - 500 g boxes|17.45
53|Perth Pasties|24|6|48 pieces|32.8
55|Pâté chinois|25|6|24 boxes x 2 pies|24
11|Queso Cabrales|5|4|1 kg pkg.|21
12|Queso Manchego La Pastora|5|4|10 - 500 g pkgs.|38
59|Raclette Courdavault|28|4|5 kg pkg.|55
57|Ravioli Angelo|26|5|24 - 250 g pkgs.|19.5
75|Rhönbräu Klosterbier|12|1|24 - 0.5 l bottles|7.75
73|Röd Kaviar|17|8|24 - 150 g jars|15
28|Rössle Sauerkraut|12|7|25 - 825 g cans|45.6
45|Røgede sild|21|8|1k pkg.|9.5
34|Sasquatch Ale|16|1|24 - 12 oz bottles|14
27|Schoggi Schokolade|11|3|100 - 100 g pieces|43.9
68|Scottish Longbreads|8|3|10 boxes x 8 pieces|12.5
42|Singaporean Hokkien Fried Mee|20|5|32 - 1 kg pkgs.|14
20|Sir Rodney's Marmalade|8|3|30 gift boxes|81
21|Sir Rodney's Scones|8|3|24 pkgs. x 4 pieces|10
61|Sirop d'érable|29|2|24 - 500 ml bottles|28.5
46|Spegesild|21|8|4 - 450 g glasses|12
35|Steeleye Stout|16|1|24 - 12 oz bottles|18
62|Tarte au sucre|29|3|48 pies|49.3
19|Teatime Chocolate Biscuits|8|3|10 boxes x 12 pieces|9.2
29|Thüringer Rostbratwurst|12|6|50 bags x 30 sausgs.|123.79
14|Tofu|6|7|40 - 100 g pkgs.|23.25
54|Tourtière|25|6|16 pies|7.45
23|Tunnbröd|9|5|12 - 250 g pkgs.|9
7|Uncle Bob's Organic Dried Pears|3|7|12 - 1 lb pkgs.|30
50|Valkoinen suklaa|23|3|12 - 100 g bars|16.25
63|Vegie-spread|7|2|15 - 625 g jars|43.9
64|Wimmers gute Semmelknödel|12|5|20 bags x 4 pieces|33.25
47|Zaanse koeken|22|3|10 - 4 oz boxes|9.5
```

- *De manera similar, pero en orden ascendente para `CategoryID`:*

```sql
SELECT * FROM Products ORDER BY ProductName, CategoryID ASC;
```

```sql
sqlite> SELECT * FROM Products ORDER BY ProductName, CategoryID ASC;
78|||||0
79|||3||0
80|||6||0
81|||9||0
17|Alice Mutton|7|6|20 - 1 kg tins|39
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
40|Boston Crab Meat|19|8|24 - 4 oz tins|18.4
60|Camembert Pierrot|28|4|15 - 300 g rounds|34
18|Carnarvon Tigers|7|8|16 kg pkg.|62.5
1|Chais|1|1|10 boxes x 20 bags|18
2|Chang|1|1|24 - 12 oz bottles|19
39|Chartreuse verte|18|1|750 cc per bottle|18
4|Chef Anton's Cajun Seasoning|2|2|48 - 6 oz jars|22
5|Chef Anton's Gumbo Mix|2|2|36 boxes|21.35
48|Chocolade|22|3|10 pkgs.|12.75
38|Côte de Blaye|18|1|12 - 75 cl bottles|263.5
58|Escargots de Bourgogne|27|8|24 pieces|13.25
52|Filo Mix|24|5|16 - 2 kg boxes|7
71|Fløtemysost|15|4|10 - 500 g pkgs.|21.5
33|Geitost|15|4|500 g|2.5
15|Genen Shouyu|6|2|24 - 250 ml bottles|15.5
56|Gnocchi di nonna Alice|26|5|24 - 250 g pkgs.|38
31|Gorgonzola Telino|14|4|12 - 100 g pkgs|12.5
6|Grandma's Boysenberry Spread|3|2|12 - 8 oz jars|25
37|Gravad lax|17|8|12 - 500 g pkgs.|26
24|Guaraná Fantástica|10|1|12 - 355 ml cans|4.5
69|Gudbrandsdalsost|15|4|10 kg pkg.|36
44|Gula Malacca|20|2|20 - 2 kg bags|19.45
26|Gumbär Gummibärchen|11|3|100 - 250 g bags|31.23
22|Gustaf's Knäckebröd|9|5|24 - 500 g pkgs.|21
10|Ikura|4|8|12 - 200 ml jars|31
36|Inlagd Sill|17|8|24 - 250 g jars|19
43|Ipoh Coffee|20|1|16 - 500 g tins|46
41|Jack's New England Clam Chowder|19|8|12 - 12 oz cans|9.65
13|Konbu|6|8|2 kg box|6
76|Lakkalikööri|23|1|500 ml|18
67|Laughing Lumberjack Lager|16|1|24 - 12 oz bottles|14
74|Longlife Tofu|4|7|5 kg pkg.|10
65|Louisiana Fiery Hot Pepper Sauce|2|2|32 - 8 oz bottles|21.05
66|Louisiana Hot Spiced Okra|2|2|24 - 8 oz jars|17
51|Manjimup Dried Apples|24|7|50 - 300 g pkgs.|53
32|Mascarpone Fabioli|14|4|24 - 200 g pkgs.|32
49|Maxilaku|23|3|24 - 50 g pkgs.|20
9|Mishi Kobe Niku|4|6|18 - 500 g pkgs.|97
72|Mozzarella di Giovanni|14|4|24 - 200 g pkgs.|34.8
30|Nord-Ost Matjeshering|13|8|10 - 200 g glasses|25.89
8|Northwoods Cranberry Sauce|3|2|12 - 12 oz jars|40
25|NuNuCa Nuß-Nougat-Creme|11|3|20 - 450 g glasses|14
77|Original Frankfurter grüne Soße|12|2|12 boxes|13
70|Outback Lager|7|1|24 - 355 ml bottles|15
16|Pavlova|7|3|32 - 500 g boxes|17.45
53|Perth Pasties|24|6|48 pieces|32.8
55|Pâté chinois|25|6|24 boxes x 2 pies|24
11|Queso Cabrales|5|4|1 kg pkg.|21
12|Queso Manchego La Pastora|5|4|10 - 500 g pkgs.|38
59|Raclette Courdavault|28|4|5 kg pkg.|55
57|Ravioli Angelo|26|5|24 - 250 g pkgs.|19.5
75|Rhönbräu Klosterbier|12|1|24 - 0.5 l bottles|7.75
73|Röd Kaviar|17|8|24 - 150 g jars|15
28|Rössle Sauerkraut|12|7|25 - 825 g cans|45.6
45|Røgede sild|21|8|1k pkg.|9.5
34|Sasquatch Ale|16|1|24 - 12 oz bottles|14
27|Schoggi Schokolade|11|3|100 - 100 g pieces|43.9
68|Scottish Longbreads|8|3|10 boxes x 8 pieces|12.5
42|Singaporean Hokkien Fried Mee|20|5|32 - 1 kg pkgs.|14
20|Sir Rodney's Marmalade|8|3|30 gift boxes|81
21|Sir Rodney's Scones|8|3|24 pkgs. x 4 pieces|10
61|Sirop d'érable|29|2|24 - 500 ml bottles|28.5
46|Spegesild|21|8|4 - 450 g glasses|12
35|Steeleye Stout|16|1|24 - 12 oz bottles|18
62|Tarte au sucre|29|3|48 pies|49.3
19|Teatime Chocolate Biscuits|8|3|10 boxes x 12 pieces|9.2
29|Thüringer Rostbratwurst|12|6|50 bags x 30 sausgs.|123.79
14|Tofu|6|7|40 - 100 g pkgs.|23.25
54|Tourtière|25|6|16 pies|7.45
23|Tunnbröd|9|5|12 - 250 g pkgs.|9
7|Uncle Bob's Organic Dried Pears|3|7|12 - 1 lb pkgs.|30
50|Valkoinen suklaa|23|3|12 - 100 g bars|16.25
63|Vegie-spread|7|2|15 - 625 g jars|43.9
64|Wimmers gute Semmelknödel|12|5|20 bags x 4 pieces|33.25
47|Zaanse koeken|22|3|10 - 4 oz boxes|9.5
```

---

### ***Selección de campos únicos***

- *Para obtener valores únicos (sin duplicados), puedes usar `DISTINCT`. Ten en cuenta que si hay varios valores `NULL`, solo se mostrará uno:*

```sql
SELECT DISTINCT ProductName FROM Products;
```

```sql
sqlite> SELECT DISTINCT ProductName FROM Products;
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

- **También puedes combinarlo con un orden específico:**

```sql
SELECT DISTINCT ProductName FROM Products ORDER BY ProductName ASC;
```

```sql
sqlite> SELECT DISTINCT ProductName FROM Products ORDER BY ProductName ASC;

Alice Mutton
Aniseed Syrup
Boston Crab Meat
Camembert Pierrot
Carnarvon Tigers
Chais
Chang
Chartreuse verte
Chef Anton's Cajun Seasoning
Chef Anton's Gumbo Mix
Chocolade
Côte de Blaye
Escargots de Bourgogne
Filo Mix
Fløtemysost
Geitost
Genen Shouyu
Gnocchi di nonna Alice
Gorgonzola Telino
Grandma's Boysenberry Spread
Gravad lax
Guaraná Fantástica
Gudbrandsdalsost
Gula Malacca
Gumbär Gummibärchen
Gustaf's Knäckebröd
Ikura
Inlagd Sill
Ipoh Coffee
Jack's New England Clam Chowder
Konbu
Lakkalikööri
Laughing Lumberjack Lager
Longlife Tofu
Louisiana Fiery Hot Pepper Sauce
Louisiana Hot Spiced Okra
Manjimup Dried Apples
Mascarpone Fabioli
Maxilaku
Mishi Kobe Niku
Mozzarella di Giovanni
Nord-Ost Matjeshering
Northwoods Cranberry Sauce
NuNuCa Nuß-Nougat-Creme
Original Frankfurter grüne Soße
Outback Lager
Pavlova
Perth Pasties
Pâté chinois
Queso Cabrales
Queso Manchego La Pastora
Raclette Courdavault
Ravioli Angelo
Rhönbräu Klosterbier
Röd Kaviar
Rössle Sauerkraut
Røgede sild
Sasquatch Ale
Schoggi Schokolade
Scottish Longbreads
Singaporean Hokkien Fried Mee
Sir Rodney's Marmalade
Sir Rodney's Scones
Sirop d'érable
Spegesild
Steeleye Stout
Tarte au sucre
Teatime Chocolate Biscuits
Thüringer Rostbratwurst
Tofu
Tourtière
Tunnbröd
Uncle Bob's Organic Dried Pears
Valkoinen suklaa
Vegie-spread
Wimmers gute Semmelknödel
Zaanse koeken
```
