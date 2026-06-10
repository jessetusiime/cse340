import db from './db.js';

const addVolunteer = async (userId, projectId) => {
    const query = `
        INSERT INTO volunteer (user_id, project_id)
        VALUES ($1, $2)
        ON CONFLICT (user_id, project_id)
        DO NOTHING
    `;

    await db.query(query, [userId, projectId]);
};

const removeVolunteer = async (userId, projectId) => {
    const query = `
        DELETE FROM volunteer
        WHERE user_id = $1
        AND project_id = $2
    `;

    await db.query(query, [userId, projectId]);
};

const isVolunteer = async (userId, projectId) => {
    const query = `
        SELECT *
        FROM volunteer
        WHERE user_id = $1
        AND project_id = $2
    `;

    const result = await db.query(query, [userId, projectId]);

    return result.rows.length > 0;
};

const getVolunteerProjects = async (userId) => {
    const query = `
        SELECT
            p.project_id,
            p.title
        FROM volunteer v
        JOIN project p
            ON v.project_id = p.project_id
        WHERE v.user_id = $1
    `;

    const result = await db.query(query, [userId]);

    return result.rows;
};

export {
    addVolunteer,
    removeVolunteer,
    isVolunteer,
    getVolunteerProjects
};