const express = require('express');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const config = require('../config/config');
const User = require('../models/User');

const authRouter = express.Router();

authRouter.use(bodyParser.json());





// Registration route
authRouter.post('/register', async (req, res) => {
  try {
    const {
      username, password, firstName, lastName, gender, age, weight, height, disease, profession, goal,
    } = req.body;

    // Check if the username is already taken
    const existingUser = await User.findOne({ username });
    if (existingUser) {
      return res.status(400).json({ message: 'Username already taken' });
    }

    // Hash the password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Create a new user with additional information
    const newUser = new User({
      username,
      password: hashedPassword,
      firstName,
      lastName,
      gender,
      age,
      weight,
      height,
      disease,
      profession,
      goal,
    });

    // Save the new user to the database
    await newUser.save();

    res.status(201).json({ message: 'Registration successful' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = authRouter;

// Authentication route
authRouter.post('/login', async (req, res) => {
  try {
    const { username, password } = req.body;

    // Find the user by username
    const user = await User.findOne({ username });
    if (!user) {
      return res.status(401).json({ message: 'Invalid username or password' });
    }

    // Compare the provided password with the stored hashed password
    const passwordMatch = await bcrypt.compare(password, user.password);
    if (!passwordMatch) {
      return res.status(401).json({ message: 'Invalid username or password' });
    }

    // Generate a JWT token for authentication
    const token = jwt.sign({ username: user.username }, config.secretKey, { expiresIn: '1h' });

    // Return user details along with the token
    res.json({
      token,
      user: {
        username: user.username,
        firstName: user.firstName,
        lastName: user.lastName,
        gender:user.gender,
        age:user.age,
        weight:user.weight,
        height:user.height,
        disease:user.disease,
        profession:user.profession,
        goal:user.goal
        // Add other user details as needed
      },
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = authRouter;
