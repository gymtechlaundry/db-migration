-- Prefix bcrypt-hashed passwords in 'users' table with {bcrypt}
-- Only update passwords that are not already prefixed

UPDATE users
SET password = CONCAT('{bcrypt}', password)
WHERE password NOT LIKE '{bcrypt}%'
  AND (
    password LIKE '$2a$%' OR
    password LIKE '$2b$%' OR
    password LIKE '$2y$%'
  );