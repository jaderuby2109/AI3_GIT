CREATE TABLE test.employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES aa_employees(id)
);

INSERT INTO test.employees (id, name, manager_id) VALUES
(1, 'CEO', NULL),         -- 최상위 관리자
(2, 'VP of Sales', 1),
(3, 'VP of Tech', 1),
(4, 'Sales Manager 1', 2),
(5, 'Sales Rep 1', 4),
(6, 'Sales Rep 2', 4),
(7, 'Tech Manager 1', 3),
(8, 'Dev 1', 7),
(9, 'Dev 2', 7),
(10, 'Intern', 8);
