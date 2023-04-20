select * from customers
DELIMITER //
create PROCEDURE getCusBYId
(in cusNum int(11))
begin
select * from customers where customerNumber = cusNum;
end//
DELIMITER ;
call getCusById(233);
DELIMITER //

CREATE PROCEDURE GetCustomersCountByCity(

    IN  in_city VARCHAR(50),

    OUT total INT

)

BEGIN

    SELECT COUNT(customerNumber)

    INTO total

    FROM customers

    WHERE city = in_city;

END//
DELIMITER ;
CALL GetCustomersCountByCity('Lyon',@total);
select @total;

 -- INOUT là sự kết hợp giữa IN và OUT, ví dụ:
DELIMITER //

CREATE PROCEDURE SetCounter(

    INOUT counter INT,

    IN inc INT

)

BEGIN

    SET counter = counter + inc;

END//

DELIMITER ;
SET @counter = 1;

CALL SetCounter(@counter,1); -- 2

CALL SetCounter(@counter,1); -- 3

CALL SetCounter(@counter,5); -- 8

SELECT @counter; -- 8

