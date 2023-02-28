-- Example of using OUT parameter
-- Example:
--    call my_sqrt(10, @out_value);
--    select @out_value;
DELIMITER $$
DROP PROCEDURE IF EXISTS my_sqrt;
CREATE PROCEDURE my_sqrt(
    input_number INT,       -- Default mode
    OUT out_number FLOAT)   -- You will need to put a var for the output when CALL the procedure
BEGIN
    SET out_number = SQRT(input_number);
END $$
DELIMITER ;
