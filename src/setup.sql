-- Organization table

CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

CREATE TABLE project (
	project_id SERIAL PRIMARY KEY,
	organization_id INT NOT NULL,
	title VARCHAR(100) NOT NULL,
	description TEXT NOT NULL,
	location VARCHAR(100) NOT NULL,
	project_date DATE NOT NULL,

	CONSTRAINT fk_organization
		FOREIGN KEY (organization_id)
		REFERENCES organization(organization_id)
		ON DELETE CASCADE
);

CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE project_category (
    project_id INT NOT NULL,
    category_id INT NOT NULL,

    PRIMARY KEY (project_id, category_id),

    CONSTRAINT fk_project
        FOREIGN KEY (project_id)
        REFERENCES project(project_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_category
        FOREIGN KEY (category_id)
        REFERENCES category(category_id)
        ON DELETE CASCADE
);

-- Insert sample data: Organizations

INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

INSERT INTO project (
    organization_id,
    title,
    description,
    location,
    project_date
)
VALUES
(1, 'Community Water System', 'Installed clean water systems.', 'Kampala', '2026-01-10'),
(1, 'Bridge Rehabilitation', 'Repaired local bridges.', 'Jinja', '2026-02-14'),
(1, 'School Renovation', 'Renovated classrooms.', 'Mukono', '2026-03-20'),
(1, 'Youth Housing Project', 'Built youth shelters.', 'Wakiso', '2026-04-05'),
(1, 'Road Repair Initiative', 'Improved community roads.', 'Masaka', '2026-05-01');

INSERT INTO project (
    organization_id,
    title,
    description,
    location,
    project_date
)
VALUES
(2, 'Urban Garden Training', 'Taught urban farming.', 'Entebbe', '2026-01-12'),
(2, 'School Greenhouse Build', 'Built greenhouse facilities.', 'Mukono', '2026-02-18'),
(2, 'Tree Planting Drive', 'Planted community trees.', 'Kampala', '2026-03-09'),
(2, 'Food Sustainability Workshop', 'Hosted sustainability training.', 'Gulu', '2026-04-15'),
(2, 'Community Compost Program', 'Started compost collection.', 'Mbarara', '2026-05-10');

INSERT INTO project (
    organization_id,
    title,
    description,
    location,
    project_date
)
VALUES
(3, 'Food Relief Drive', 'Distributed food supplies.', 'Gulu', '2026-01-25'),
(3, 'Charity Marathon', 'Raised funds for charities.', 'Kampala', '2026-02-11'),
(3, 'Health Camp Support', 'Supported local clinics.', 'Arua', '2026-03-17'),
(3, 'Youth Mentorship Program', 'Mentored local students.', 'Mbale', '2026-04-21'),
(3, 'Community Cleanup Campaign', 'Organized neighborhood cleanup.', 'Fort Portal', '2026-05-06');

INSERT INTO category (name)
VALUES
('Community Development'),
('Environment'),
('Education'),
('Healthcare'),
('Volunteer Service');

INSERT INTO project_category (project_id, category_id)
VALUES
(1, 1),
(1, 5),

(2, 1),

(3, 2),
(3, 3),

(4, 3),

(5, 4);

SELECT project_id, title, project_date
FROM project;

UPDATE project
SET project_date = '2026-12-01'
WHERE project_id = 1;

UPDATE project
SET project_date = '2026-12-05'
WHERE project_id = 2;

UPDATE project
SET project_date = '2026-12-10'
WHERE project_id = 3;

UPDATE project
SET project_date = '2026-12-15'
WHERE project_id = 4;

UPDATE project
SET project_date = '2026-12-20'
WHERE project_id = 5;