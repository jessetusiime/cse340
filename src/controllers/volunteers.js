import {
    addVolunteer,
    removeVolunteer
} from '../models/volunteers.js';

const processVolunteerSignup = async (req, res) => {

    const userId = req.session.user.user_id;
    const projectId = req.params.projectId;

    await addVolunteer(userId, projectId);

    req.flash('success', 'You have volunteered for this project.');

    res.redirect(`/project/${projectId}`);
};

const processVolunteerRemoval = async (req, res) => {

    const userId = req.session.user.user_id;
    const projectId = req.params.projectId;

    await removeVolunteer(userId, projectId);

    req.flash('success', 'Volunteer signup removed.');

    res.redirect(`/project/${projectId}`);
};

export {
    processVolunteerSignup,
    processVolunteerRemoval
};