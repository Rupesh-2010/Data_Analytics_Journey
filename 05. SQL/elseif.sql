CREATE PROCEDURE `elseif_procedure` ()
BEGIN
if x > 0 then
select"The Num is Positive" as Result;
else
select "The num is Negative" as result;
end if;
END
