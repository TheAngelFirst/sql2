/*
1. Создать и вызвать функцию TheNumbers, производящую деление числа на 2
2. Создать произвольную таблицу и написать процедуру, удаляющую её
3. Создать функцию, которая будет инвертировать введённый текст длинной до 128 символов.
*/
--1. Создать и вызвать функцию TheNumbers, производящую деление числа на 2
create or replace function TheNumbers(num in number) return number
is 
res NUMBER(10,2);
begin
res := ROUND(num / 2,2); 
return res;
end TheNumbers;
/
select TheNumbers(7) from DUAL;

--2. Создать произвольную таблицу и написать процедуру, удаляющую её
CREATE TABLE PIES_SHAK_ARCH as select * from PIES_SHAK;
/
create or replace procedure drop_table_PIES_SHAK_ARCH
is
begin
   execute immediate 'drop table PIES_SHAK_arch';
end drop_table_PIES_SHAK_ARCH;

--3. Создать функцию, которая будет инвертировать введённый текст длинной до 128 символов.
create or replace function ReplaceText(text in varchar2) return varchar2
is
res varchar2(128);
begin
	if length(text)> 128 then
		return 'Ошибка. Количество символов должно быть не больше 128.';
	end if;
	for i in reverse 1..length(text)
	loop
		res := res||substr(text, i, 1);
	end loop;
	return res;
end ReplaceText;
/
select ReplaceText('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec magna enim, vulputate ac turpis sit amet, laoreet pretium posuere.') REPALACED_TEXT from DUAL
union
select ReplaceText('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec magna enim, vulputate ac turpis sit amet, laoreet pretium posuere') from DUAL;