CREATE DEFINER=`root`@`localhost` PROCEDURE `IN_para_procedure`(in d_id int)
BEGIN
#it will taken number(dep no) from user and then it will give you all data from that dep_num
select * from myemp where dep_id=d_id;
END