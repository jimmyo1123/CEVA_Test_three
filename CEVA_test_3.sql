CREATE TABLE model (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Make VARCHAR(50),
    Model VARCHAR(50)
);

INSERT INTO model (Make, Model) VALUES 
('Toyota', 'Corolla'),
('Toyota', 'Camry'),
('Nissan', 'Duke'),
('Nissan', 'Duke'),
('Mazda', 'Mazda 3'),
('Mazda', 'CX5'),
('Toyota', 'Camry'),
('Ford', 'Raptor');

-- Remove duplicates but keep the highest id.
WITH temp AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY Make, Model ORDER BY ID DESC) AS rn
    FROM model
)

DELETE FROM model
WHERE ID IN (
    SELECT ID FROM temp WHERE rn > 1
);
