<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Ejercicio de SubConsultas***

*En SQL, el uso incorrecto de comillas puede llevar a errores de sintaxis. Es importante entender cuándo y cómo usarlas para evitar confusiones.*

---

## ***Errores Comunes***

1. **Uso Incorrecto de Comillas Dobles:**
   - **El siguiente ejemplo genera un error porque se están utilizando comillas dobles en el nombre de la tabla, lo cual no es válido:**

    ```sql
    SELECT SUM("OD.Quantity") FROM ["Orders"] O, ["OrderDetails"] OD;
    ```

    ```sql
    sqlite> SELECT SUM("OD.Quantity") FROM ["Orders"] O, ["OrderDetails"] OD;
    Error: in prepare, no such table: "Orders" (1)
    ```

   - *Este error indica que SQLite no puede encontrar la tabla "Orders" porque las comillas dobles están mal aplicadas.*

2. **Suma de Cantidades sin Resultados:**
   - *El siguiente ejemplo, aunque sintácticamente correcto, devuelve un resultado de 0.0, lo cual puede ser confuso:*

    ```sql
    SELECT SUM("OD.Quantity") FROM [Orders] O, [OrderDetails] OD;
    ```

    ```sql
    sqlite> SELECT SUM("OD.Quantity") FROM [Orders] O, [OrderDetails] OD;
    0.0
    ```

   - *Esto ocurre porque las comillas alrededor de `OD.Quantity` indican que el motor de base de datos debe buscar una columna que literalmente se llame `"OD.Quantity"`. Si no existe una columna con ese nombre exacto en la tabla `OrderDetails`, la consulta no encontrará datos que sumar, resultando en 0.0. Este es un caso en el que la sintaxis es correcta, pero el uso de comillas limita el resultado a coincidencias exactas.*

---

### ***Ejemplo Correcto***

- **Para obtener la suma de las cantidades de la tabla `OrderDetails` correctamente, se debe escribir la consulta sin comillas y asegurarse de que las tablas están bien referenciadas:**

```sql
SELECT SUM(OD.Quantity) FROM [Orders] O, [OrderDetails] OD;
```

- *Esta consulta calcula la suma total de la columna `Quantity` de la tabla `OrderDetails`, usando un alias para la tabla `Orders`, aunque en este caso no se está utilizando efectivamente el alias `O`.*

---

## ***1. Estructura de las Tablas***

**Primero, recordemos que tienes dos tablas:**

- **Orders:** *Tiene 196 registros (filas).*
- **OrderDetails:** *Tiene 518 registros.*

```sql
PRAGMA table_info(Orders);
```

```sql
sqlite> PRAGMA table_info(Orders);
0|OrderID|INTEGER|0||1
1|CustomerID|INTEGER|0||0
2|EmployeeID|INTEGER|0||0
3|OrderDate|DATETIME|0||0
4|ShipperID|INTEGER|0||0
```

```sql
PRAGMA table_info(OrderDetails);
```

```sql
sqlite> PRAGMA table_info(OrderDetails);
0|OrderDetailID|INTEGER|0||1
1|OrderID|INTEGER|0||0
2|ProductID|INTEGER|0||0
3|Quantity|INTEGER|0||0
sqlite> SELECT * FROM OrderDetails;
1|10248|11|12
2|10248|42|10
3|10248|72|5
4|10249|14|9
5|10249|51|40
6|10250|41|10
7|10250|51|35
8|10250|65|15
9|10251|22|6
10|10251|57|15
11|10251|65|20
12|10252|20|40
13|10252|33|25
14|10252|60|40
15|10253|31|20
16|10253|39|42
17|10253|49|40
18|10254|24|15
19|10254|55|21
20|10254|74|21
21|10255|2|20
22|10255|16|35
23|10255|36|25
24|10255|59|30
25|10256|53|15
26|10256|77|12
27|10257|27|25
28|10257|39|6
29|10257|77|15
30|10258|2|50
31|10258|5|65
32|10258|32|6
33|10259|21|10
34|10259|37|1
35|10260|41|16
36|10260|57|50
37|10260|62|15
38|10260|70|21
39|10261|21|20
40|10261|35|20
41|10262|5|12
42|10262|7|15
43|10262|56|2
44|10263|16|60
45|10263|24|28
46|10263|30|60
47|10263|74|36
48|10264|2|35
49|10264|41|25
50|10265|17|30
51|10265|70|20
52|10266|12|12
53|10267|40|50
54|10267|59|70
55|10267|76|15
56|10268|29|10
57|10268|72|4
58|10269|33|60
59|10269|72|20
60|10270|36|30
61|10270|43|25
62|10271|33|24
63|10272|20|6
64|10272|31|40
65|10272|72|24
66|10273|10|24
67|10273|31|15
68|10273|33|20
69|10273|40|60
70|10273|76|33
71|10274|71|20
72|10274|72|7
73|10275|24|12
74|10275|59|6
75|10276|10|15
76|10276|13|10
77|10277|28|20
78|10277|62|12
79|10278|44|16
80|10278|59|15
81|10278|63|8
82|10278|73|25
83|10279|17|15
84|10280|24|12
85|10280|55|20
86|10280|75|30
87|10281|19|1
88|10281|24|6
89|10281|35|4
90|10282|30|6
91|10282|57|2
92|10283|15|20
93|10283|19|18
94|10283|60|35
95|10283|72|3
96|10284|27|15
97|10284|44|21
98|10284|60|20
99|10284|67|5
100|10285|1|45
101|10285|40|40
102|10285|53|36
103|10286|35|100
104|10286|62|40
105|10287|16|40
106|10287|34|20
107|10287|46|15
108|10288|54|10
109|10288|68|3
110|10289|3|30
111|10289|64|9
112|10290|5|20
113|10290|29|15
114|10290|49|15
115|10290|77|10
116|10291|13|20
117|10291|44|24
118|10291|51|2
119|10292|20|20
120|10293|18|12
121|10293|24|10
122|10293|63|5
123|10293|75|6
124|10294|1|18
125|10294|17|15
126|10294|43|15
127|10294|60|21
128|10294|75|6
129|10295|56|4
130|10296|11|12
131|10296|16|30
132|10296|69|15
133|10297|39|60
134|10297|72|20
135|10298|2|40
136|10298|36|40
137|10298|59|30
138|10298|62|15
139|10299|19|15
140|10299|70|20
141|10300|66|30
142|10300|68|20
143|10301|40|10
144|10301|56|20
145|10302|17|40
146|10302|28|28
147|10302|43|12
148|10303|40|40
149|10303|65|30
150|10303|68|15
151|10304|49|30
152|10304|59|10
153|10304|71|2
154|10305|18|25
155|10305|29|25
156|10305|39|30
157|10306|30|10
158|10306|53|10
159|10306|54|5
160|10307|62|10
161|10307|68|3
162|10308|69|1
163|10308|70|5
164|10309|4|20
165|10309|6|30
166|10309|42|2
167|10309|43|20
168|10309|71|3
169|10310|16|10
170|10310|62|5
171|10311|42|6
172|10311|69|7
173|10312|28|4
174|10312|43|24
175|10312|53|20
176|10312|75|10
177|10313|36|12
178|10314|32|40
179|10314|58|30
180|10314|62|25
181|10315|34|14
182|10315|70|30
183|10316|41|10
184|10316|62|70
185|10317|1|20
186|10318|41|20
187|10318|76|6
188|10319|17|8
189|10319|28|14
190|10319|76|30
191|10320|71|30
192|10321|35|10
193|10322|52|20
194|10323|15|5
195|10323|25|4
196|10323|39|4
197|10324|16|21
198|10324|35|70
199|10324|46|30
200|10324|59|40
201|10324|63|80
202|10325|6|6
203|10325|13|12
204|10325|14|9
205|10325|31|4
206|10325|72|40
207|10326|4|24
208|10326|57|16
209|10326|75|50
210|10327|2|25
211|10327|11|50
212|10327|30|35
213|10327|58|30
214|10328|59|9
215|10328|65|40
216|10328|68|10
217|10329|19|10
218|10329|30|8
219|10329|38|20
220|10329|56|12
221|10330|26|50
222|10330|72|25
223|10331|54|15
224|10332|18|40
225|10332|42|10
226|10332|47|16
227|10333|14|10
228|10333|21|10
229|10333|71|40
230|10334|52|8
231|10334|68|10
232|10335|2|7
233|10335|31|25
234|10335|32|6
235|10335|51|48
236|10336|4|18
237|10337|23|40
238|10337|26|24
239|10337|36|20
240|10337|37|28
241|10337|72|25
242|10338|17|20
243|10338|30|15
244|10339|4|10
245|10339|17|70
246|10339|62|28
247|10340|18|20
248|10340|41|12
249|10340|43|40
250|10341|33|8
251|10341|59|9
252|10342|2|24
253|10342|31|56
254|10342|36|40
255|10342|55|40
256|10343|64|50
257|10343|68|4
258|10343|76|15
259|10344|4|35
260|10344|8|70
261|10345|8|70
262|10345|19|80
263|10345|42|9
264|10346|17|36
265|10346|56|20
266|10347|25|10
267|10347|39|50
268|10347|40|4
269|10347|75|6
270|10348|1|15
271|10348|23|25
272|10349|54|24
273|10350|50|15
274|10350|69|18
275|10351|38|20
276|10351|41|13
277|10351|44|77
278|10351|65|10
279|10352|24|10
280|10352|54|20
281|10353|11|12
282|10353|38|50
283|10354|1|12
284|10354|29|4
285|10355|24|25
286|10355|57|25
287|10356|31|30
288|10356|55|12
289|10356|69|20
290|10357|10|30
291|10357|26|16
292|10357|60|8
293|10358|24|10
294|10358|34|10
295|10358|36|20
296|10359|16|56
297|10359|31|70
298|10359|60|80
299|10360|28|30
300|10360|29|35
301|10360|38|10
302|10360|49|35
303|10360|54|28
304|10361|39|54
305|10361|60|55
306|10362|25|50
307|10362|51|20
308|10362|54|24
309|10363|31|20
310|10363|75|12
311|10363|76|12
312|10364|69|30
313|10364|71|5
314|10365|11|24
315|10366|65|5
316|10366|77|5
317|10367|34|36
318|10367|54|18
319|10367|65|15
320|10367|77|7
321|10368|21|5
322|10368|28|13
323|10368|57|25
324|10368|64|35
325|10369|29|20
326|10369|56|18
327|10370|1|15
328|10370|64|30
329|10370|74|20
330|10371|36|6
331|10372|20|12
332|10372|38|40
333|10372|60|70
334|10372|72|42
335|10373|58|80
336|10373|71|50
337|10374|31|30
338|10374|58|15
339|10375|14|15
340|10375|54|10
341|10376|31|42
342|10377|28|20
343|10377|39|20
344|10378|71|6
345|10379|41|8
346|10379|63|16
347|10379|65|20
348|10380|30|18
349|10380|53|20
350|10380|60|6
351|10380|70|30
352|10381|74|14
353|10382|5|32
354|10382|18|9
355|10382|29|14
356|10382|33|60
357|10382|74|50
358|10383|13|20
359|10383|50|15
360|10383|56|20
361|10384|20|28
362|10384|60|15
363|10385|7|10
364|10385|60|20
365|10385|68|8
366|10386|24|15
367|10386|34|10
368|10387|24|15
369|10387|28|6
370|10387|59|12
371|10387|71|15
372|10388|45|15
373|10388|52|20
374|10388|53|40
375|10389|10|16
376|10389|55|15
377|10389|62|20
378|10389|70|30
379|10390|31|60
380|10390|35|40
381|10390|46|45
382|10390|72|24
383|10391|13|18
384|10392|69|50
385|10393|2|25
386|10393|14|42
387|10393|25|7
388|10393|26|70
389|10393|31|32
390|10394|13|10
391|10394|62|10
392|10395|46|28
393|10395|53|70
394|10395|69|8
395|10396|23|40
396|10396|71|60
397|10396|72|21
398|10397|21|10
399|10397|51|18
400|10398|35|30
401|10398|55|120
402|10399|68|60
403|10399|71|30
404|10399|76|35
405|10399|77|14
406|10400|29|21
407|10400|35|35
408|10400|49|30
409|10401|30|18
410|10401|56|70
411|10401|65|20
412|10401|71|60
413|10402|23|60
414|10402|63|65
415|10403|16|21
416|10403|48|70
417|10404|26|30
418|10404|42|40
419|10404|49|30
420|10405|3|50
421|10406|1|10
422|10406|21|30
423|10406|28|42
424|10406|36|5
425|10406|40|2
426|10407|11|30
427|10407|69|15
428|10407|71|15
429|10408|37|10
430|10408|54|6
431|10408|62|35
432|10409|14|12
433|10409|21|12
434|10410|33|49
435|10410|59|16
436|10411|41|25
437|10411|44|40
438|10411|59|9
439|10412|14|20
440|10413|1|24
441|10413|62|40
442|10413|76|14
443|10414|19|18
444|10414|33|50
445|10415|17|2
446|10415|33|20
447|10416|19|20
448|10416|53|10
449|10416|57|20
450|10417|38|50
451|10417|46|2
452|10417|68|36
453|10417|77|35
454|10418|2|60
455|10418|47|55
456|10418|61|16
457|10418|74|15
458|10419|60|60
459|10419|69|20
460|10420|9|20
461|10420|13|2
462|10420|70|8
463|10420|73|20
464|10421|19|4
465|10421|26|30
466|10421|53|15
467|10421|77|10
468|10422|26|2
469|10423|31|14
470|10423|59|20
471|10424|35|60
472|10424|38|49
473|10424|68|30
474|10425|55|10
475|10425|76|20
476|10426|56|5
477|10426|64|7
478|10427|14|35
479|10428|46|20
480|10429|50|40
481|10429|63|35
482|10430|17|45
483|10430|21|50
484|10430|56|30
485|10430|59|70
486|10431|17|50
487|10431|40|50
488|10431|47|30
489|10432|26|10
490|10432|54|40
491|10433|56|28
492|10434|11|6
493|10434|76|18
494|10435|2|10
495|10435|22|12
496|10435|72|10
497|10436|46|5
498|10436|56|40
499|10436|64|30
500|10436|75|24
501|10437|53|15
502|10438|19|15
503|10438|34|20
504|10438|57|15
505|10439|12|15
506|10439|16|16
507|10439|64|6
508|10439|74|30
509|10440|2|45
510|10440|16|49
511|10440|29|24
512|10440|61|90
513|10441|27|50
514|10442|11|30
515|10442|54|80
516|10442|66|60
517|10443|11|6
518|10443|28|12
```

```sql
SELECT * FROM "Orders";
```

```sql
sqlite> SELECT * FROM "Orders";
10248|90|5|1996-07-04|3
10249|81|6|1996-07-05|1
10250|34|4|1996-07-08|2
10251|84|3|1996-07-08|1
10252|76|4|1996-07-09|2
10253|34|3|1996-07-10|2
10254|14|5|1996-07-11|2
10255|68|9|1996-07-12|3
10256|88|3|1996-07-15|2
10257|35|4|1996-07-16|3
10258|20|1|1996-07-17|1
10259|13|4|1996-07-18|3
10260|55|4|1996-07-19|1
10261|61|4|1996-07-19|2
10262|65|8|1996-07-22|3
10263|20|9|1996-07-23|3
10264|24|6|1996-07-24|3
10265|7|2|1996-07-25|1
10266|87|3|1996-07-26|3
10267|25|4|1996-07-29|1
10268|33|8|1996-07-30|3
10269|89|5|1996-07-31|1
10270|87|1|1996-08-01|1
10271|75|6|1996-08-01|2
10272|65|6|1996-08-02|2
10273|63|3|1996-08-05|3
10274|85|6|1996-08-06|1
10275|49|1|1996-08-07|1
10276|80|8|1996-08-08|3
10277|52|2|1996-08-09|3
10278|5|8|1996-08-12|2
10279|44|8|1996-08-13|2
10280|5|2|1996-08-14|1
10281|69|4|1996-08-14|1
10282|69|4|1996-08-15|1
10283|46|3|1996-08-16|3
10284|44|4|1996-08-19|1
10285|63|1|1996-08-20|2
10286|63|8|1996-08-21|3
10287|67|8|1996-08-22|3
10288|66|4|1996-08-23|1
10289|11|7|1996-08-26|3
10290|15|8|1996-08-27|1
10291|61|6|1996-08-27|2
10292|81|1|1996-08-28|2
10293|80|1|1996-08-29|3
10294|65|4|1996-08-30|2
10295|85|2|1996-09-02|2
10296|46|6|1996-09-03|1
10297|7|5|1996-09-04|2
10298|37|6|1996-09-05|2
10299|67|4|1996-09-06|2
10300|49|2|1996-09-09|2
10301|86|8|1996-09-09|2
10302|76|4|1996-09-10|2
10303|30|7|1996-09-11|2
10304|80|1|1996-09-12|2
10305|55|8|1996-09-13|3
10306|69|1|1996-09-16|3
10307|48|2|1996-09-17|2
10308|2|7|1996-09-18|3
10309|37|3|1996-09-19|1
10310|77|8|1996-09-20|2
10311|18|1|1996-09-20|3
10312|86|2|1996-09-23|2
10313|63|2|1996-09-24|2
10314|65|1|1996-09-25|2
10315|38|4|1996-09-26|2
10316|65|1|1996-09-27|3
10317|48|6|1996-09-30|1
10318|38|8|1996-10-01|2
10319|80|7|1996-10-02|3
10320|87|5|1996-10-03|3
10321|38|3|1996-10-03|2
10322|58|7|1996-10-04|3
10323|39|4|1996-10-07|1
10324|71|9|1996-10-08|1
10325|39|1|1996-10-09|3
10326|8|4|1996-10-10|2
10327|24|2|1996-10-11|1
10328|28|4|1996-10-14|3
10329|75|4|1996-10-15|2
10330|46|3|1996-10-16|1
10331|9|9|1996-10-16|1
10332|51|3|1996-10-17|2
10333|87|5|1996-10-18|3
10334|84|8|1996-10-21|2
10335|37|7|1996-10-22|2
10336|60|7|1996-10-23|2
10337|25|4|1996-10-24|3
10338|55|4|1996-10-25|3
10339|51|2|1996-10-28|2
10340|9|1|1996-10-29|3
10341|73|7|1996-10-29|3
10342|25|4|1996-10-30|2
10343|44|4|1996-10-31|1
10344|89|4|1996-11-01|2
10345|63|2|1996-11-04|2
10346|65|3|1996-11-05|3
10347|21|4|1996-11-06|3
10348|86|4|1996-11-07|2
10349|75|7|1996-11-08|1
10350|41|6|1996-11-11|2
10351|20|1|1996-11-11|1
10352|28|3|1996-11-12|3
10353|59|7|1996-11-13|3
10354|58|8|1996-11-14|3
10355|4|6|1996-11-15|1
10356|86|6|1996-11-18|2
10357|46|1|1996-11-19|3
10358|41|5|1996-11-20|1
10359|72|5|1996-11-21|3
10360|7|4|1996-11-22|3
10361|63|1|1996-11-22|2
10362|9|3|1996-11-25|1
10363|17|4|1996-11-26|3
10364|19|1|1996-11-26|1
10365|3|3|1996-11-27|2
10366|29|8|1996-11-28|2
10367|83|7|1996-11-28|3
10368|20|2|1996-11-29|2
10369|75|8|1996-12-02|2
10370|14|6|1996-12-03|2
10371|41|1|1996-12-03|1
10372|62|5|1996-12-04|2
10373|37|4|1996-12-05|3
10374|91|1|1996-12-05|3
10375|36|3|1996-12-06|2
10376|51|1|1996-12-09|2
10377|72|1|1996-12-09|3
10378|24|5|1996-12-10|3
10379|61|2|1996-12-11|1
10380|37|8|1996-12-12|3
10381|46|3|1996-12-12|3
10382|20|4|1996-12-13|1
10383|4|8|1996-12-16|3
10384|5|3|1996-12-16|3
10385|75|1|1996-12-17|2
10386|21|9|1996-12-18|3
10387|70|1|1996-12-18|2
10388|72|2|1996-12-19|1
10389|10|4|1996-12-20|2
10390|20|6|1996-12-23|1
10391|17|3|1996-12-23|3
10392|59|2|1996-12-24|3
10393|71|1|1996-12-25|3
10394|36|1|1996-12-25|3
10395|35|6|1996-12-26|1
10396|25|1|1996-12-27|3
10397|60|5|1996-12-27|1
10398|71|2|1996-12-30|3
10399|83|8|1996-12-31|3
10400|19|1|1997-01-01|3
10401|65|1|1997-01-01|1
10402|20|8|1997-01-02|2
10403|20|4|1997-01-03|3
10404|49|2|1997-01-03|1
10405|47|1|1997-01-06|1
10406|62|7|1997-01-07|1
10407|56|2|1997-01-07|2
10408|23|8|1997-01-08|1
10409|54|3|1997-01-09|1
10410|10|3|1997-01-10|3
10411|10|9|1997-01-10|3
10412|87|8|1997-01-13|2
10413|41|3|1997-01-14|2
10414|21|2|1997-01-14|3
10415|36|3|1997-01-15|1
10416|87|8|1997-01-16|3
10417|73|4|1997-01-16|3
10418|63|4|1997-01-17|1
10419|68|4|1997-01-20|2
10420|88|3|1997-01-21|1
10421|61|8|1997-01-21|1
10422|27|2|1997-01-22|1
10423|31|6|1997-01-23|3
10424|51|7|1997-01-23|2
10425|41|6|1997-01-24|2
10426|29|4|1997-01-27|1
10427|59|4|1997-01-27|2
10428|66|7|1997-01-28|1
10429|37|3|1997-01-29|2
10430|20|4|1997-01-30|1
10431|10|4|1997-01-30|2
10432|75|3|1997-01-31|2
10433|60|3|1997-02-03|3
10434|24|3|1997-02-03|2
10435|16|8|1997-02-04|2
10436|7|3|1997-02-05|2
10437|87|8|1997-02-05|1
10438|79|3|1997-02-06|2
10439|51|6|1997-02-07|3
10440|71|4|1997-02-10|2
10441|55|3|1997-02-10|2
10442|20|3|1997-02-11|2
10443|66|8|1997-02-12|1
```

---

### ***SQL Server, MySQL, PostgreSQL***

> [!TIP]
> **Para saber cuántos registros tiene una tabla en SQL, puedes utilizar la función `COUNT()`. Aquí tienes un ejemplo de cómo hacerlo en diferentes sistemas de gestión de bases de datos:**

```sql
SELECT COUNT(*) AS TotalRegistros
FROM NombreDeLaTabla;
```

---

### ***SQLite***

```sql
SELECT COUNT(*) AS TotalRegistros
FROM NombreDeLaTabla;
```

---

### ***Explicación***

- **`SELECT COUNT(*)`:** *Esta parte del comando cuenta todas las filas de la tabla.*
- **`AS TotalRegistros`:** *Esto le da un nombre a la columna que mostrará el resultado.*
- **`FROM NombreDeLaTabla`:** *Aquí debes reemplazar `NombreDeLaTabla` por el nombre real de la tabla de la cual deseas contar los registros.*

*Ejecuta este comando y te devolverá el número total de registros en la tabla especificada.*

```sql
SELECT COUNT(*) FROM "OrderDetails";
518
```

```sql
SELECT COUNT(*) FROM "Orders";
196
```

```sql
sqlite> SELECT COUNT(*) FROM "OrderDetails";
518
```

```sql
sqlite> SELECT COUNT(*) FROM "Orders";
196
```

---

### ***2. El Resultado de la Consulta***

*La consulta que proporcionaste está utilizando un **producto cartesiano** entre las tablas `Orders` y `OrderDetails`. Vamos a desglosar lo que esto significa:*

---

### ***3. Producto Cartesiano***

- *Cuando haces una consulta que combina dos tablas sin una cláusula `JOIN` específica, estás creando un producto cartesiano. Esto significa que cada registro de la primera tabla (`Orders`) se emparejará con **cada** registro de la segunda tabla (`OrderDetails`).*

---

#### ***a. Ejemplo del Producto Cartesiano***

- **Supongamos que tienes:**
  - **Orders:** *196 registros*
  - **OrderDetails:** *518 registros*

*El producto cartesiano resultará en un conjunto de registros que es igual al número de registros en la tabla `Orders` multiplicado por el número de registros en la tabla `OrderDetails`.*

**Entonces:**

**Total de Registros en el Producto Cartesiano** *`= 196 * 518 = 101368`*

---

### ***4. Sumando `OD.Quantity`***

- **La consulta `SELECT SUM(OD.Quantity)` suma la columna `Quantity` de la tabla `OrderDetails`. Dado que hay un producto cartesiano, cada registro de `OrderDetails` se multiplica por cada registro de `Orders`.**

---

#### ***b. Cómo Suma***

- *Cuando sumas `OD.Quantity`, estás sumando **todas las cantidades** en `OrderDetails` para cada combinación de registros.*
- *Esto significa que si `OrderDetails` tiene 518 registros, el valor de `SUM(OD.Quantity)` se repetirá 196 veces (una vez por cada registro de `Orders`).*

---

### ***5. Resultado Total***

**Cuando ejecutas la consulta original:**

```sql
SELECT SUM(OD.Quantity) FROM [Orders] O, [OrderDetails] OD;
```

```sql
sqlite> SELECT SUM(OD.Quantity) FROM [Orders] O, [OrderDetails] OD;
2497628
```

- *El resultado es 2,497,628. Este número es el resultado de sumar todas las cantidades de `OrderDetails` (12,743) y multiplicarlo por el número de registros en `Orders` (196):*

*Resultado = `12743 * 196 = 2497628`*

---

### ***6. Sin la Tabla `Orders`***

**Ahora, cuando quitas `Orders` de la consulta y solo haces:**

```sql
SELECT SUM(OD.Quantity) FROM [OrderDetails] OD;
```

```sql
sqlite> SELECT SUM(OD.Quantity) FROM [OrderDetails] OD;
12743
```

- **Aquí solo estás sumando directamente todos los registros en `OrderDetails`, que es 12,743. No hay ninguna multiplicación, solo estás viendo el total de la columna `Quantity` en esa tabla.**

---

### ***Resumen***

- **Producto Cartesiano:** *Cada registro de `Orders` se empareja con cada registro de `OrderDetails`, lo que crea una cantidad masiva de combinaciones.*
- **Suma de Cantidades:** *La suma en el contexto del producto cartesiano es la suma total de `Quantity` multiplicada por el número de registros en `Orders`.*
- **Consulta Sin `Orders`:** *Al hacer la suma solo en `OrderDetails`, simplemente obtienes la suma total de `Quantity`, que es mucho menor porque no hay multiplicación.*

---

### ***Ejercicio de SubConsultas con Tablas***

*Para ejemplificar el uso de subconsultas y la suma de cantidades, crearemos dos tablas: `DetalleDeOrden` y `Orden`.*

---

### ***Creación de Tablas***

```sql
CREATE TABLE DetalleDeOrden (
    DetalleDeOrdenID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Cantidad INT NOT NULL,
    OrdenId INT NOT NULL
);

CREATE TABLE Orden (
    OrdenId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    DetalleDeOrdenId INT NOT NULL,
    FOREIGN KEY (DetalleDeOrdenId) REFERENCES DetalleDeOrden(DetalleDeOrdenID)
);
```

```sql
sqlite> CREATE TABLE DetalleDeOrden (
    DetalleDeOrdenID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Cantidad INT NOT NULL,
    OrdenId INT NOT NULL
);

CREATE TABLE Orden (
    OrdenId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    DetalleDeOrdenId INT NOT NULL,
    FOREIGN KEY (DetalleDeOrdenId) REFERENCES DetalleDeOrden(DetalleDeOrdenID)
);
```

- **`DetalleDeOrden`:** *Contiene detalles de cada orden, incluyendo un ID único (`DetalleDeOrdenID`), la cantidad de productos (`Cantidad`), y un ID de orden (`OrdenId`).*
- **`Orden`:** *Contiene un ID único para cada orden (`OrdenId`) y referencia al `DetalleDeOrdenID` para asociar cada orden con sus detalles.*

---

### ***Inserción de Datos***

```sql
INSERT INTO DetalleDeOrden (Cantidad, OrdenId) VALUES
(10, 101),
(5, 102),
(20, 103),
(15, 101),
(25, 104);

INSERT INTO Orden (DetalleDeOrdenId) VALUES
(1),
(2),
(3);
```

```sql
sqlite> INSERT INTO DetalleDeOrden (Cantidad, OrdenId) VALUES
(10, 101),
(5, 102),
(20, 103),
(15, 101),
(25, 104);

INSERT INTO Orden (DetalleDeOrdenId) VALUES
(1),
(2),
(3);
```

- *Se insertan varios registros en `DetalleDeOrden`, cada uno con una cantidad específica y un `OrdenId` asociado.*
- *Se insertan registros en la tabla `Orden`, haciendo referencia a los detalles de las órdenes a través de `DetalleDeOrdenId`.*

```sql
SELECT COUNT(*) FROM DetalleDeOrden
```

```sql
sqlite> SELECT COUNT(*) FROM DetalleDeOrden
5
```

```sql
SELECT COUNT(*) FROM Orden
```

```sql
sqlite> SELECT COUNT(*) FROM Orden
3
```

---

### ***Consulta de Suma de Cantidades***

---

#### ***Consulta con Joins Implícitos***

```sql
SELECT SUM(OD.Cantidad) FROM [Orden] O, [DetalleDeOrden] OD;
```

- *Esta consulta suma las cantidades de la tabla `DetalleDeOrden` (`OD`) para cada registro en la tabla `Orden` (`O`).*
- **Resultado:** *225. Este resultado se debe a que la suma total de las cantidades (10 + 5 + 20 + 15 + 25 = 75) se multiplica por la cantidad de registros en `Orden`, que son tres, resultando en 75 * 3 = 225.*

---

#### ***Consulta sin Joins***

```sql
SELECT SUM(OD.Cantidad) FROM [DetalleDeOrden] OD;
```

- *En esta consulta, solo se suma la columna `Cantidad` de `DetalleDeOrden`.*
- **Resultado:** *75. Aquí, simplemente se calcula la suma de todas las cantidades de `DetalleDeOrden` sin considerar la tabla `Orden`, por lo que se obtiene el total correcto de las cantidades.*

---

### ***Ejemplos de Subconsultas y Funciones de Agregación***

1. **Subconsulta con Suma de Cantidades:**

    ```sql
   SELECT "FirstName",
          "LastName",
          (
              SELECT SUM(OD.Quantity)
              FROM [Orders] o, [OrderDetails] od
              WHERE o.EmployeeID = e.EmployeeID
          ) AS "Unidades Totales"
   FROM [Employees] e 
   WHERE "Unidades Totales" IS NOT NULL 
   LIMIT 100;
   ```

    ```sql
    sqlite> SELECT "FirstName",
        "LastName",
        (
            SELECT SUM(OD.Quantity)
            FROM [Orders] o, [OrderDetails] od
            WHERE o.EmployeeID = e.EmployeeID
        ) AS "Unidades Totales"
    FROM [Employees] e 
    WHERE "Unidades Totales" IS NOT NULL 
    LIMIT 100;
    Nancy|Davolio|369547
    Andrew|Fuller|254860
    Janet|Leverling|395033
    Margaret|Peacock|509720
    Steven|Buchanan|140173
    Michael|Suyama|229374
    Robert|King|178402
    Laura|Callahan|344061
    Anne|Dodsworth|76458
    ```

- **Aclaraciones**

1. **Uso de Alias en WHERE:**
   - *El uso de `"Unidades Totales"` en la cláusula `WHERE` **es incorrecto** según la norma SQL estándar. No puedes referenciar un alias definido en la cláusula `SELECT` dentro de `WHERE`. La cláusula `WHERE` se evalúa antes de que se realice la selección de columnas, lo que significa que no puede ver el alias.*
   - *Sin embargo, SQLite permite usar el alias en ciertas situaciones, lo que podría ser una razón por la que la consulta devuelve resultados, aunque no es una práctica estándar en SQL.*

2. **Resultados de la Consulta:**
   - *Los resultados que muestras indican que hay empleados con un total de cantidades vendidas (`"Unidades Totales"`), lo que significa que la subconsulta está funcionando correctamente y suma las cantidades de `OrderDetails` para cada empleado basado en su `EmployeeID`.*
   - *Sin embargo, para mantener la portabilidad y adherirse a las mejores prácticas, es recomendable usar `HAVING` cuando deseas filtrar en base a una función de agregación.*

   - **Conclusión**
    *Por lo tanto, aunque la consulta puede devolver resultados debido a cómo SQLite maneja los alias, **lo correcto desde un punto de vista SQL estándar es que no se debe usar un alias en la cláusula `WHERE`.** Para filtros en función de agregaciones, se debe usar `HAVING`.*

3. **Subconsulta con Join entre Tablas:**

   ```sql
   SELECT "FirstName",
          "LastName",
          (
              SELECT SUM(OD.Quantity)
              FROM [Orders] o, [OrderDetails] od
              WHERE o.EmployeeID = e.EmployeeID 
              AND o.OrderID = od.OrderID
          ) AS "Unidades Totales"
   FROM [Employees] e
   WHERE "Unidades Totales" IS NOT NULL
   LIMIT 100;
   ```

   ```sql
   sqlite> SELECT "FirstName",
          "LastName",
          (
              SELECT SUM(OD.Quantity)
              FROM [Orders] o, [OrderDetails] od
              WHERE o.EmployeeID = e.EmployeeID 
              AND o.OrderID = od.OrderID
          ) AS "Unidades Totales"
   FROM [Employees] e
   WHERE "Unidades Totales" IS NOT NULL
   LIMIT 100;
    Nancy|Davolio|1924
    Andrew|Fuller|1315
    Janet|Leverling|1725
    Margaret|Peacock|3232
    Steven|Buchanan|778
    Michael|Suyama|1094
    Robert|King|733
    Laura|Callahan|1293
    Anne|Dodsworth|649
   ```

   - *Esta consulta es similar a la anterior, pero incluye una relación más precisa entre las tablas `Orders` y `OrderDetails` utilizando el `OrderID`.*
   - *Al igual que en la primera consulta, el uso de `"Unidades Totales"` en el `WHERE` es incorrecto, lo que resultaría en un error si se ejecutara.*

4. **Uso Incorrecto de Funciones de Agregación en WHERE:**

   ```sql
   SELECT "FirstName",
          "LastName",
          (
              SELECT SUM(OD.Quantity)
              FROM [Orders] o, [OrderDetails] od
              WHERE o.EmployeeID = e.EmployeeID 
              AND o.OrderID = od.OrderID
          ) AS "Unidades Totales"
   FROM [Employees] e
   WHERE "Unidades Totales" IS NOT NULL 
   AND "Unidades Totales" > AVG("Unidades Totales")
   LIMIT 100;
   ```

   ```sql
   sqlite> SELECT "FirstName",
          "LastName",
          (
              SELECT SUM(OD.Quantity)
              FROM [Orders] o, [OrderDetails] od
              WHERE o.EmployeeID = e.EmployeeID 
              AND o.OrderID = od.OrderID
          ) AS "Unidades Totales"
   FROM [Employees] e
   WHERE "Unidades Totales" IS NOT NULL 
   AND "Unidades Totales" > AVG("Unidades Totales")
   LIMIT 100;
   ```

   - *En esta consulta, se intenta usar una función de agregación (`AVG`) dentro de la cláusula `WHERE`, lo que provocará un error de sintaxis. Las funciones de agregación deben ser utilizadas en una cláusula `HAVING` que se aplica después de agrupar los resultados.*
  
5. **Uso Correcto de HAVING:**

   ```sql
   SELECT "FirstName",
          "LastName",
          (
              SELECT SUM(OD.Quantity)
              FROM [Orders] o, [OrderDetails] od
              WHERE o.EmployeeID = e.EmployeeID 
              AND o.OrderID = od.OrderID
          ) AS "Unidades Totales"
   FROM [Employees] e
   GROUP BY e.EmployeeID
   HAVING "Unidades Totales" IS NOT NULL 
   AND "Unidades Totales" > AVG("Unidades Totales")
   LIMIT 100;
   ```

    ```sql
   sqlite> SELECT "FirstName",
          "LastName",
          (
              SELECT SUM(OD.Quantity)
              FROM [Orders] o, [OrderDetails] od
              WHERE o.EmployeeID = e.EmployeeID 
              AND o.OrderID = od.OrderID
          ) AS "Unidades Totales"
   FROM [Employees] e
   GROUP BY e.EmployeeID
   HAVING "Unidades Totales" IS NOT NULL 
   AND "Unidades Totales" > AVG("Unidades Totales")
   LIMIT 100;
   ```

   - *En esta consulta, se usa `GROUP BY` para agrupar los resultados por `EmployeeID`. Sin embargo, es importante notar que al agrupar, la suma de cantidades ("Unidades Totales") se convierte en un valor único por empleado.*
   - *Dado que `AVG("Unidades Totales")` también calcula un único promedio para todos los empleados, el resultado de la comparación entre `"Unidades Totales"` y `AVG("Unidades Totales")` puede no tener sentido, ya que, en la mayoría de los casos, el valor de `"Unidades Totales"` de cada empleado será igual al promedio calculado. Por lo tanto, no se devolverán resultados.*

---

### ***Consulta Final***

```sql
SELECT
    "FirstName",
    "LastName",
    (
        SELECT ROUND(SUM(OD.Quantity), 2)
        FROM [Orders] o, [OrderDetails] od
        WHERE
            o.EmployeeID = e.EmployeeID
            AND o.OrderID = od.OrderID
    ) AS "Unidades Totales"
FROM [Employees] e
WHERE
    "Unidades Totales" IS NOT NULL
    AND "Unidades Totales" > (
        SELECT AVG("Unidades Totales")
        FROM (
                SELECT (
                        SELECT SUM(OD.Quantity)
                        FROM [Orders] o, [OrderDetails] od
                        WHERE
                            o.EmployeeID = e2.EmployeeID
                            AND o.OrderID = od.OrderID
                    ) AS "Unidades Totales"
                FROM [Employees] e2
                GROUP BY
                    e2.EmployeeID
            )
    )
LIMIT 100;
```

```sql
sqlite> SELECT
    "FirstName",
    "LastName",
    (
        SELECT ROUND(SUM(OD.Quantity), 2)
        FROM [Orders] o, [OrderDetails] od
        WHERE
            o.EmployeeID = e.EmployeeID
            AND o.OrderID = od.OrderID
    ) AS "Unidades Totales"
FROM [Employees] e
WHERE
    "Unidades Totales" IS NOT NULL
    AND "Unidades Totales" > (
        SELECT AVG("Unidades Totales")
        FROM (
                SELECT (
                        SELECT SUM(OD.Quantity)
                        FROM [Orders] o, [OrderDetails] od
                        WHERE
                            o.EmployeeID = e2.EmployeeID
                            AND o.OrderID = od.OrderID
                    ) AS "Unidades Totales"
                FROM [Employees] e2
                GROUP BY
                    e2.EmployeeID
            )
    )
LIMIT 100;
Nancy|Davolio|1924.0
Janet|Leverling|1725.0
Margaret|Peacock|3232.0
```

---

### ***Descripción de la Consulta***

1. **Selección de Datos:**
   - *La consulta selecciona los nombres (`"FirstName"`) y apellidos (`"LastName"`) de los empleados de la tabla `[Employees]` junto con la suma de las cantidades de productos vendidas, redondeada a dos decimales, que se denomina `"Unidades Totales"`.*

2. **Subconsulta para Sumar Cantidades:**
   - *La subconsulta interna calcula la suma de las cantidades (`SUM(OD.Quantity)`) de la tabla `[OrderDetails]` para cada empleado, filtrando por su `EmployeeID`. Se asegura de que cada orden correspondiente se esté considerando al utilizar `o.OrderID = od.OrderID`.*

3. **Filtrado de Resultados:**
   - *En la cláusula `WHERE`, se filtran los resultados para incluir solo aquellos empleados cuya suma total de unidades no sea nula (`"Unidades Totales" IS NOT NULL`) y que sea mayor que el promedio de unidades vendidas por todos los empleados.*

4. **Cálculo del Promedio:**
   - *La segunda subconsulta dentro de la cláusula `WHERE` calcula el promedio de `"Unidades Totales"` de todos los empleados. Esto se hace mediante una subconsulta anidada que sigue el mismo enfoque que la primera, sumando las cantidades por cada empleado (`SUM(OD.Quantity)`) y agrupando los resultados por `EmployeeID`.*

5. **Limitación de Resultados:**
   - *Finalmente, se limita la salida a los primeros 100 registros que cumplen con las condiciones anteriores.*

---

### ***Consideraciones***

- **Uso de Alias:**
  - *Como se mencionó anteriormente, el uso del alias `"Unidades Totales"` en la cláusula `WHERE` puede no ser portátil ni estándar, pero es aceptable en SQLite. Sin embargo, para mantener buenas prácticas, es preferible realizar cálculos en subconsultas y luego aplicar condiciones en `HAVING` cuando sea necesario.*
  
- **Desempeño:**
  - *Dependiendo del tamaño de las tablas `[Orders]`, `[OrderDetails]` y `[Employees]`, esta consulta puede ser intensiva en recursos debido a las subconsultas anidadas. Se recomienda evaluar la optimización de las consultas para mejorar el rendimiento si es necesario.*
