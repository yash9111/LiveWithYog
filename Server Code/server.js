const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mongoose = require('mongoose');
const config = require('./config/config');
const User = require('./models/User');

// Import routes
const yogaRoutes = require('./routes/yoga');
const authRoutes = require('./routes/auth');

const app = express();

app.use(cors());
app.use(bodyParser.json());

// MongoDB Connection 
mongoose.connect(config.databaseURL, { useNewUrlParser: true, useUnifiedTopology: true });

// Routes
app.use('/yoga', yogaRoutes);
app.use('/auth', authRoutes);  // Use authRoutes for /auth endpoints

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
