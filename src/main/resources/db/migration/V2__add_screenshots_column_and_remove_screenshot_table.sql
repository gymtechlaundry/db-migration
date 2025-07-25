-- Add screenshots column to project table
ALTER TABLE project
ADD COLUMN screenshots TEXT;

-- Drop the project_screenshot table
DROP TABLE IF EXISTS project_screenshot;