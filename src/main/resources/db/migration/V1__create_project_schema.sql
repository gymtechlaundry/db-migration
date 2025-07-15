CREATE TABLE project (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    icon VARCHAR(512),
    description TEXT,
    android_link VARCHAR(512),
    ios_link VARCHAR(512),
    website VARCHAR(512),
    github VARCHAR(512)
);

CREATE TABLE project_screenshot (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    project_id BIGINT NOT NULL,
    screenshot VARCHAR(512),
    CONSTRAINT fk_project_screenshot_project FOREIGN KEY (project_id)
        REFERENCES project(id) ON DELETE CASCADE
);