-- Add screenshots column to project table
ALTER TABLE project
ADD COLUMN screenshots TEXT;

UPDATE project p
JOIN (
    SELECT
        project_id,
        GROUP_CONCAT(screenshot ORDER BY id SEPARATOR ',') AS screenshots
    FROM project_screenshot
    GROUP BY project_id
) ps ON p.id = ps.project_id
SET p.screenshots = ps.screenshots;

DROP TABLE IF EXISTS project_screenshot;