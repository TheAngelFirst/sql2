/*
1. Вывести 1,2 и 5 строки из PIES в порядке увеличения цены продукта
2. Написать запрос, выводящий актуальную (с самым большим EFD) конфигурацию по каждому продукту из таблицы PRODUCT_CONF
*/
--1. Вывести 1,2 и 5 строки из PIES в порядке увеличения цены продукта
select * from (
	select t.*, row_number() over(order by PRICE asc) rn from PIES t
	)
where rn in (1, 2, 5);

--2. Написать запрос, выводящий актуальную (с самым большим EFD) конфигурацию по каждому продукту из таблицы PRODUCT_CONF
select * from(
	select pc.*, row_number() over(partition by PRODUCT order by pc.EFD desc) rn from PRODUCT_CONF pc
	)
where rn in 1;
