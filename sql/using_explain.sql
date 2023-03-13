USE TestDB;
CREATE TABLE test_estimates (
  id INT AUTO_INCREMENT PRIMARY KEY, val INT, val2 INT
);
ALTER TABLE test_estimates ADD INDEX idx(val);
