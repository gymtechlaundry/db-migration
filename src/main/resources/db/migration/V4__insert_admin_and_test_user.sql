-- Insert admin user (devin)
INSERT INTO users (username, password)
VALUES (
    'devincooper',
    '$2a$10$aMiOjEm3qTDcaKQQ4hXnduQJerUvLQxjQvVz9CvjWHiHu2RydbycK'
);

-- Assign ADMIN role to devin
INSERT INTO user_roles (user_id, role_id)
SELECT u.id, r.id
FROM users u, roles r
WHERE u.username = 'devincooper' AND r.name = 'ADMIN';

-- Insert test user with USER role only
INSERT INTO users (username, password)
VALUES (
    'testuser',
    '$2a$10$L4K95DWlqixTo9MqbOvKE.XPzM62hkZPAjF0tMfOtTI5BL9TjPphm' -- password: test123
);

-- Assign USER role to testuser
INSERT INTO user_roles (user_id, role_id)
SELECT u.id, r.id
FROM users u, roles r
WHERE u.username = 'testuser' AND r.name = 'USER';