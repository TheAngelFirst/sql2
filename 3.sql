/*
1.Используя CASE вывести своё мнение о цене на блинчики с малиной
2.Вывести данные о пирожках, подменив цену на пирожки с определённой начинкой соответствующей ценой на блины с той же начинкой
3.Увеличить цену пирожков на 33%, уменьшить цену блинов на 33%. Можно выполнить только одну команду update
*/
--1.Используя CASE вывести своё мнение о цене на блинчики с малиной
select PRODUCT_NAME, FILLING, PRICE, 
case 
	when PRICE < 100 then 'Халява'
	when PRICE < 200 then 'Хорошая цена'
	when PRICE >= 200 then 'Дорого'
end as 'COMMENT'
from PIES
where PRODUCT_NAME = 'блин';

--2.Вывести данные о пирожках, подменив цену на пирожки с определённой начинкой соответствующей ценой на блины с той же начинкой
select case 
	when PRODUCT_NAME = 'блин' then 'пирожок'
	when PRODUCT_NAME = 'пирожок' then 'блин'
end as 'PRODUCT_NAME', FILLING, PRICE 
from PIES;

select T1.PRODUCT_NAME, T2.FILLING, T2.PRICE
from PIES 'T1' inner join PIE 'T2' 
on T1.PRODUCT_NAME != T2.PRODUCT_NAME;

--3.Увеличить цену пирожков на 33%, уменьшить цену блинов на 33%. Можно выполнить только одну команду update
update PIES set PRICE = PRICE * case 
	when PRODUCT_NAME = 'блин' then 0.77
	when PRODUCT_NAME = 'пирожок' then 1.33
end;


