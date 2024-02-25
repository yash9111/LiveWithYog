// routes/randomYoga.js
const express = require('express');
const router = express.Router();

// List of yoga poses
const yogaPoses = [
    ["Boat", "Half Boat", "Cat", "Chair", "Crow", "Dolphin", "Plank", "Side Plank"],
    ["Boat", "Half Boat", "Butterfly", "Seated Forward Bend", "Lotus", "Half Lord of the Fishes", "Splits", "Side Splits"],
    ["Boat", "Half Boat", "Chair", "Dolphin", "Downward-Facing Dog", "Extended Side Angle", "Forearm Stand", "Handstand", "Plank", "Pyramid", "Triangle", "Warrior One", "Warrior Two", "Warrior Three", "Wheel"],
    ["Bow", "Camel", "Cow", "Sphinx", "Upward-Facing Dog", "Wheel", "Wild Thing"]
];

// Function to shuffle an array
function shuffleArray(array) {
    for (let i = array.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
}

// Route to get random and unique yoga poses
router.get('/', (req, res) => {
    let selectedPoses = [];

    // Select 10 random and unique poses
    while (selectedPoses.length < 10) {
        // Select a random category
        const randomCategory = yogaPoses[Math.floor(Math.random() * yogaPoses.length)];
        // Select a random pose from the category
        const randomPose = randomCategory[Math.floor(Math.random() * randomCategory.length)];
        // Check if the pose is not already selected
        if (!selectedPoses.includes(randomPose)) {
            selectedPoses.push(randomPose);
        }
    }

    res.json({ poses: selectedPoses });
});

module.exports = router;
