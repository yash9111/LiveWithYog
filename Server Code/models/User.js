const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  username: { type: String, unique: true, required: true },
  password: { type: String, required: true },
  firstName: { type: String, required: true },
  lastName: { type: String, required: true },
  gender: { type: String },
  age: { type: Number },
  weight: { type: Number },
  height: { type: Number },
  disease: { type: String },
  profession: { type: String },
  goal: { type: String },
});

const User = mongoose.model('User', userSchema);

module.exports = User;
