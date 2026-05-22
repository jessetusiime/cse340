import db from './db.js';

const getAllCategories = async () => {

    const query = `
        SELECT
            category_id,
            name
        FROM public.category;
    `;

    const result = await db.query(query);

    return result.rows;
};

// Get one category by ID
const getCategoryDetails = async (categoryId) => {

    const query = `
        SELECT
            category_id,
            name
        FROM category
        WHERE category_id = $1;
    `;

    const result = await db.query(query, [categoryId]);

    return result.rows[0];
};

// Get all projects for a category
const getProjectsByCategoryId = async (categoryId) => {

    const query = `
        SELECT
            p.project_id,
            p.title,
            p.project_date,
            o.organization_id,
            o.name AS organization_name
        FROM project_category pc

        JOIN project p
            ON pc.project_id = p.project_id

        JOIN organization o
            ON p.organization_id = o.organization_id

        WHERE pc.category_id = $1

        ORDER BY p.project_date ASC;
    `;

    const result = await db.query(query, [categoryId]);

    return result.rows;
};

export {
    getAllCategories,
    getCategoryDetails,
    getProjectsByCategoryId
};