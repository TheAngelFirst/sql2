CREATE TABLE PIES
(
	PRODUCT_NAME VARCHAR(15),
	FILLING VARCHAR(15),
	MAKER_ID INTEGER not null,
	MAKER_TYPE VARCHAR(15),
	PRICE INTEGER,
	AVAILABLE INTEGER,
	PROD_DATE DATE
);
INSERT INTO PIES (PRODUCT_NAME, FILLING, MAKER_ID, MAKER_TYPE, PRICE, AVAILABLE, PROD_DATE) 
VALUES 
	('блин', 'клубника', 5, 'дедушка', 159, 20, DATE '2019-09-23'),
  	('блин', 'малина', 4, 'дедушка', 446, 18, DATE '2019-09-23'),
	('блин', 'черника', 4, 'дедушка', 1022, 19, DATE '2019-09-23'),
	('пирожок', 'клубника', 3, 'бабушка', 137, 17, DATE '2019-09-23'),
	('пирожок', 'малина', 1, 'бабушка', 386, 15, DATE '2019-09-23'),
	('пирожок', 'черника', 3, 'бабушка', 883, 16, DATE '2019-09-23');
	
CREATE TABLE PRODUCT_CONF
(
	PRODUCT VARCHAR(15),
	EFD DATE,
	LISTAVTERMS VARCHAR(128),
	LISTAVCURRS VARCHAR(128),
	MINBAL INTEGER
);
INSERT INTO PRODUCT_CONF (PRODUCT, EFD, LISTAVTERMS, LISTAVCURRS, MINBAL) 
select 'Кредит', DATE '2018-10-01', '31/91/361', 'RUR', 10000 from DUAL union all
select 'Кредит', DATE '2018-11-01', '31/91/171/361', 'RUR', 8000 from DUAL union all
select 'Кредит', DATE '2018-12-01', '60/91/361', 'RUR', 20000 from DUAL union all
select 'Кредит', DATE '2016-01-01', '31/60/91/361', 'RUR', 15000 from DUAL union all
select 'Депозит', DATE '2018-10-01', '91/361', 'RUR/USD', 50000 from DUAL union all
select 'Депозит', DATE '2018-10-01', '91/361', 'RUR/USD/EUR', 50000 from DUAL union all
select 'Депозит', DATE '2018-12-01', '91/361/731', 'RUR/USD/EUR', 50000 from DUAL union all
select 'Депозит', DATE '2017-01-01', '31/91/171/361/731', 'RUR/USD/EUR', 40000 from DUAL union all
select 'Ипотека', DATE '2018-10-01', '10000', 'RUR', 1000000 from DUAL union all
select 'Ипотека', DATE '2018-11-01', '10000/15000', 'RUR', 1000000 from DUAL union all
select 'Ипотека', DATE '2019-01-01', '10000/15000', 'RUR', 800000 from DUAL union all
select 'Карта', DATE '2018-11-01', null, 'RUR', 5000 from DUAL union all
select 'Карта', DATE '2018-12-01', null, 'RUR/USD/EUR', 5000 from DUAL;

;