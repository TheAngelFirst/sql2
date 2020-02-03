/*
1.Вычислить 2 переменные: самый дешёвый продукт, производимый бабушкой и дедушкой. Сравнить эти переменные. 
  Вывести строку "Самый дешёвый продукт делает %MAKER_TYPE%", либо сообщение о равенстве цен самых дешёвых продуктов.
2.Если средняя цена на блины меньше, чем средняя на пирожки, вывести сообщение: 
  «В среднем, блины дешевле пирожков на X руб», где X – абсолютное значение разницы между средней ценой пирожка и средней ценой блина. 
  Если средняя цена на блины больше или равна средней цены на пирожки, вывести сообщение: «блины стоят не меньше пирожков».
*/
--1.Вычислить 2 переменные: самый дешёвый продукт, производимый бабушкой и дедушкой. Сравнить эти переменные. Вывести строку "Самый дешёвый продукт делает %MAKER_TYPE%", либо сообщение о равенстве цен самых дешёвых продуктов.
declare
	cheapest_gpa varchar2(32);
	cheapest_gma varchar2(32);
begin
	select PRODUCT_NAME into cheapest_gpa from PIES where ROWNUM <= 1 and MAKER_TYPE = 'дедушка' order by PRICE asc;
	select PRODUCT_NAME into cheapest_gma from PIES where ROWNUM <= 1 and MAKER_TYPE = 'бабушка' order by PRICE asc;
	if cheapest_gpa < cheapest_gma then
		dbms_output.put_line('Самый дешёвый продукт делает дедушка');
	elsif cheapest_gpa > cheapest_gma then
		dbms_output.put_line('Самый дешёвый продукт делает бабушка');
	elsif cheapest_gpa = cheapest_gma then
		dbms_output.put_line('Минимальные цены равны');
	else
		dbms_output.put_line('1');
	end if;
end;

--2.Если средняя цена на блины меньше, чем средняя на пирожки, вывести сообщение: «В среднем, блины дешевле пирожков на X руб», где X – абсолютное значение разницы между средней ценой пирожка и средней ценой блина. Если средняя цена на блины больше или равна средней цены на пирожки, вывести сообщение: «блины стоят не меньше пирожков».
declare
	avg_prise_pies number(5);
	avg_prise_panc number(5);
begin
	select avg(PRICE) into avg_prise_pies from PIES where PRODUCT_NAME = 'пирожок';
	select avg(PRICE) into avg_prise_panc from PIES where PRODUCT_NAME = 'блин';
	if avg_prise_pies > avg_prise_panc then
		dbms_output.put_line('В среднем, блины дешевле пирожков на '||ABS(avg_prise_pies-avg_prise_panc)||' руб');
	elsif avg_prise_panc >= avg_prise_pies then
		dbms_output.put_line('блины стоят не меньше пирожков');
	else
		dbms_output.put_line('1');
	end if;
end;