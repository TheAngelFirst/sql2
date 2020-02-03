/*
1.Написать цикл, выводящий последовательно квадраты чисел от 1 до 12
2.Написать цикл, увеличивающий цену пирожков на 20% до тех пор, пока средняя цена пирожков не будет равна или превышать среднюю цену на блины.
3.Дополнить цикл из задачи № 2 условием, по которому выполнение цикла прекратиться в случае, если максимальная цена на пирожок превысит максимальную цену на блин
*/
--1.Написать цикл, выводящий последовательно квадраты чисел от 1 до 12
begin
  for i in 1..12 loop
    dbms_output.put_line(i*i);
  end loop;
end;

--2.Написать цикл, увеличивающий цену пирожков на 20% до тех пор, пока средняя цена пирожков не будет равна или превышать среднюю цену на блины.
declare
	avg_prise_pies number(5);
	avg_prise_panc number(5);
begin
	select avg(PRICE) into avg_prise_pies from PIES where PRODUCT_NAME = 'пирожок';
	select avg(PRICE) into avg_prise_panc from PIES where PRODUCT_NAME = 'блин';
  while avg_prise_pies < avg_prise_panc loop
		update PIES set PRICE = ROUND(PRICE * 1.2) where PRODUCT_NAME = 'пирожок';
    select avg(PRICE) into avg_prise_pies from PIES where PRODUCT_NAME = 'пирожок';
    select avg(PRICE) into avg_prise_panc from PIES where PRODUCT_NAME = 'блин';
	end loop;
end;

--3.Дополнить цикл из задачи № 2 условием, по которому выполнение цикла прекратиться в случае, если максимальная цена на пирожок превысит максимальную цену на блин
declare
	avg_prise_pies number(5);
	max_prise_pies number(5);
	avg_prise_panc number(5);
	max_prise_panc number(5);
begin
	select avg(PRICE) into avg_prise_pies from PIES where PRODUCT_NAME = 'пирожок';
	select max(PRICE) into max_prise_pies from PIES where PRODUCT_NAME = 'пирожок';
	select avg(PRICE) into avg_prise_panc from PIES where PRODUCT_NAME = 'блин';
	select max(PRICE) into max_prise_panc from PIES where PRODUCT_NAME = 'блин';
  while avg_prise_pies < avg_prise_panc and max_prise_pies <= max_prise_panc 
  loop
	update PIES set PRICE = ROUND(PRICE * 1.2) where PRODUCT_NAME = 'пирожок';
    select avg(PRICE) into avg_prise_pies from PIES where PRODUCT_NAME = 'пирожок';
    select max(PRICE) into max_prise_pies from PIES where PRODUCT_NAME = 'пирожок';
    select avg(PRICE) into avg_prise_panc from PIES where PRODUCT_NAME = 'блин';
    select max(PRICE) into max_prise_panc from PIES where PRODUCT_NAME = 'блин';
  end loop;
end;