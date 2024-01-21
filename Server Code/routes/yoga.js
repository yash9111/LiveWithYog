const express = require('express');
const axios = require('axios');
const router = express.Router();

// Yoga API Endpoint
const yogaApiUrl = 'https://yoga-api-nzy4.onrender.com/v1/categories';

// Route to fetch yoga categories and poses
router.get('/categories', async (req, res) => {
  try {
    // Make a GET request to the Yoga API
    const response = await axios.get(yogaApiUrl);

    // Extract relevant data from the response
    const yogaCategories = response.data;

    // Send the extracted data in the response
    res.json(yogaCategories);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = router;
