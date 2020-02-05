/*
1.В разделе declare объявить переменную mystr, положить в неё значение «Hello, World!». Затем вывести на экран, используя dbms_output.put_line();
2.Повторить п.1, присвоив значение «Hello, World!» внутри блока begin..end с помощью конструкции :=
3.Повторить п.1, присвоив значение «Hello, World!» внутри блока begin..end с помощью конструкции select … into
4.Используя with … as, создать табличное выражение, содержащее все записи, с ценой товара больше 70. С помощью select отобразить всё содержимое этого выражения.
*/
--1.В разделе declare объявить переменную mystr, положить в неё значение «Hello, World!». Затем вывести на экран, используя dbms_output.put_line();
set serveroutput on format wraped;
declare
	mystr varchar2(32):='Hello, World!';
begin
	dbms_output.put_line(mystr);
end;

--2.Повторить п.1, присвоив значение «Hello, World!» внутри блока begin..end с помощью конструкции :=
declare
	mystr varchar2(32);
begin
	mystr:='Hello, World!';
	dbms_output.put_line(mystr);
end;

--3.Повторить п.1, присвоив значение «Hello, World!» внутри блока begin..end с помощью конструкции select … into
declare
	mystr varchar2(32);
begin
	select 'Hello, World!' into mystr from dual;
	dbms_output.put_line(mystr);
end;

--4.Используя with … as, создать табличное выражение, содержащее все записи, с ценой товара больше 70. С помощью select отобразить всё содержимое этого выражения.
with ABC as (
select * from PIES_SHAK where PRICE > 70
)
select * from ABC;
