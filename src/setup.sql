-- RESET DATABASE

DROP TABLE IF EXISTS project_category CASCADE;
DROP TABLE IF EXISTS project CASCADE;
DROP TABLE IF EXISTS category CASCADE;
DROP TABLE IF EXISTS organization CASCADE;

-- TABLES

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

```
CONSTRAINT fk_organization
    FOREIGN KEY (organization_id)
    REFERENCES organization(organization_id)
    ON DELETE CASCADE
```

);

CREATE TABLE category (
category_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE project_category (
project_id INT NOT NULL,
category_id INT NOT NULL,

```
PRIMARY KEY (project_id, category_id),

CONSTRAINT fk_project
    FOREIGN KEY (project_id)
    REFERENCES project(project_id)
    ON DELETE CASCADE,

CONSTRAINT fk_category
    FOREIGN KEY (category_id)
    REFERENCES category(category_id)
    ON DELETE CASCADE
```

);

-- ORGANIZATIONS

INSERT INTO organization (
name,
description,
contact_email,
logo_filename
)
VALUES
(
'BrightFuture Builders',
'A nonprofit focused on improving community infrastructure through sustainable construction projects.',
'[info@brightfuturebuilders.org](mailto:info@brightfuturebuilders.org)',
'brightfuture-logo.png'
),
(
'GreenHarvest Growers',
'An urban farming collective promoting food sustainability and education in local neighborhoods.',
'[contact@greenharvest.org](mailto:contact@greenharvest.org)',
'greenharvest-logo.png'
),
(
'UnityServe Volunteers',
'A volunteer coordination group supporting local charities and service initiatives.',
'[hello@unityserve.org](mailto:hello@unityserve.org)',
'unityserve-logo.png'
);

-- PROJECTS

INSERT INTO project (
organization_id,
title,
description,
location,
project_date
)
VALUES
(1, 'Community Water System', 'Installed clean water systems.', 'Kampala', '2026-12-01'),
(1, 'Bridge Rehabilitation', 'Repaired local bridges.', 'Jinja', '2026-12-05'),
(1, 'School Renovation', 'Renovated classrooms.', 'Mukono', '2026-12-10'),
(1, 'Youth Housing Project', 'Built youth shelters.', 'Wakiso', '2026-12-15'),
(1, 'Road Repair Initiative', 'Improved community roads.', 'Masaka', '2026-12-20'),

(2, 'Urban Garden Training', 'Taught urban farming.', 'Entebbe', '2026-01-12'),
(2, 'School Greenhouse Build', 'Built greenhouse facilities.', 'Mukono', '2026-02-18'),
(2, 'Tree Planting Drive', 'Planted community trees.', 'Kampala', '2026-03-09'),
(2, 'Food Sustainability Workshop', 'Hosted sustainability training.', 'Gulu', '2026-04-15'),
(2, 'Community Compost Program', 'Started compost collection.', 'Mbarara', '2026-05-10'),

(3, 'Food Relief Drive', 'Distributed food supplies.', 'Gulu', '2026-01-25'),
(3, 'Charity Marathon', 'Raised funds for charities.', 'Kampala', '2026-02-11'),
(3, 'Health Camp Support', 'Supported local clinics.', 'Arua', '2026-03-17'),
(3, 'Youth Mentorship Program', 'Mentored local students.', 'Mbale', '2026-04-21'),
(3, 'Community Cleanup Campaign', 'Organized neighborhood cleanup.', 'Fort Portal', '2026-05-06');

-- CATEGORIES

INSERT INTO category (name)
VALUES
('Community Development'),
('Environment'),
('Education'),
('Healthcare'),
('Volunteer Service');

-- PROJECT CATEGORY MAPPINGS

INSERT INTO project_category (
project_id,
category_id
)
VALUES

-- BrightFuture Builders
(1,1),
(1,5),

(2,1),

(3,3),

(4,1),
(4,3),

(5,1),

-- GreenHarvest Growers
(6,2),
(6,3),

(7,2),
(7,3),

(8,2),

(9,2),

(10,2),

-- UnityServe Volunteers
(11,5),

(12,5),

(13,4),

(14,3),

(15,2),
(15,5);

CREATE TABLE roles (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL,
    role_description TEXT
);

INSERT INTO roles (role_name, role_description) VALUES 
    ('user', 'Standard user with basic access'),
    ('admin', 'Administrator with full system access');

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role_id INTEGER REFERENCES roles(role_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);