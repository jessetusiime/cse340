import {
    getUpcomingProjects,
    getProjectDetails
} from '../models/projects.js';

const NUMBER_OF_UPCOMING_PROJECTS = 5;

// Show upcoming projects page
const showProjectsPage = async (req, res) => {

    const projects = await getUpcomingProjects(NUMBER_OF_UPCOMING_PROJECTS);

    const title = 'Upcoming Service Projects';

    res.render('projects', {
        title,
        projects
    });
};

// Show single project details page
const showProjectDetailsPage = async (req, res) => {

    const id = req.params.id;

    const project = await getProjectDetails(id);

    res.render('project', {
        title: project.title,
        project
    });
};

export {
    showProjectsPage,
    showProjectDetailsPage
};