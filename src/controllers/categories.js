import {
    getAllCategories,
    getCategoryDetails,
    getProjectsByCategoryId
} from '../models/categories.js';

// Show all categories page
const showCategoriesPage = async (req, res) => {

    const categories = await getAllCategories();

    const title = 'Service Categories';

    res.render('categories', {
        title,
        categories
    });
};

// Show single category details page
const showCategoryDetailsPage = async (req, res) => {

    const categoryId = req.params.id;

    const category = await getCategoryDetails(categoryId);

    const projects = await getProjectsByCategoryId(categoryId);

    res.render('category', {
        title: category.name,
        category,
        projects
    });
};

export {
    showCategoriesPage,
    showCategoryDetailsPage
};