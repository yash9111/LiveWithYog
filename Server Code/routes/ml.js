const express = require('express');
const router = express.Router();
const tf = require('@tensorflow/tfjs-node');


const modelPath = "model.json";

// Load the TensorFlow.js model
async function loadModel() {
    try {
        const model = await tf.loadLayersModel('file://' + modelPath);
        return model;
    } catch (error) {
        console.error('Error loading TensorFlow.js model:', error.message);
        throw error;
    }
}

// Route for making predictions
router.post('/predict', async (req, res) => {
    try {
        // Load the TensorFlow.js model
        const model = await loadModel();

        // Get input data from the request body
        const inputData = req.body.inputData;

        // Convert input data to TensorFlow tensor
        const inputTensor = tf.tensor2d([inputData], [1, inputData.length]);

        // Make predictions using the model
        const output = model.predict(inputTensor);

        // Get prediction results
        const prediction = output.dataSync();

        // Send prediction results to the client
        res.json({ prediction });
    } catch (error) {
        console.error('Error making predictions:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
});

module.exports = router;
