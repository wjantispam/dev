DELIMITER $$
DROP PROCEDURE IF EXISTS HelloWorld;
CREATE PROCEDURE HelloWorld()
BEGIN
    SELECT "Hello World";
END $$
DELIMITER ;

CALL HelloWorld()

-- now you can load this with
-- source p_hello_world.sql