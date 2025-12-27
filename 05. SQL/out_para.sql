CREATE PROCEDURE `Out_para_procedure` (out ms int)
BEGIN
select max(salary) into ms from myemp;
END
