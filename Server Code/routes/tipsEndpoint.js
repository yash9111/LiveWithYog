// tipsEndpoint.js
const express = require('express');
const router = express.Router();

// Tips related to health, hygiene, food, yoga, and lifestyle
const tips = [
    "Remember to drink plenty of water throughout the day to stay hydrated.",
    "Wash your hands regularly with soap and water to prevent the spread of germs.",
    "Incorporate more fruits and vegetables into your diet for better overall health.",
    "Try practicing yoga or meditation to reduce stress and improve flexibility.",
    "Get at least 7-8 hours of sleep each night to allow your body to rest and recharge.",
    "Limit your intake of processed foods and opt for whole, nutrient-dense options instead.",
    "Take short breaks throughout the day to stretch and move around, especially if you sit for long periods.",
    "Practice good posture to prevent back and neck pain.",
    "Spend time outdoors in nature to boost your mood and get some fresh air.",
    "Surround yourself with positive influences and supportive relationships for better mental and emotional well-being.",
  "Set aside time for hobbies and activities you enjoy to relax and unwind.",
    "Make time for regular exercise to keep your body strong and healthy.",
    "Practice deep breathing exercises to reduce stress and promote relaxation.",
    "Keep a gratitude journal to focus on the positive aspects of your life.",
    "Challenge yourself to learn something new every day to keep your mind sharp.",
    "Establish a consistent sleep schedule to improve sleep quality and overall health.",
    "Stay connected with friends and family through regular communication and social activities.",
    "Limit screen time before bedtime to improve sleep quality and reduce eye strain.",
    "Find ways to give back to your community through volunteering or acts of kindness.",
    "Listen to your body and prioritize self-care to maintain physical and emotional well-being."
];




// Endpoint to get a random tip
router.get('/random-tip', (req, res) => {
    const randomIndex = Math.floor(Math.random() * tips.length);
    const randomTip = tips[randomIndex];
    res.json({ tip: randomTip });
});

module.exports = router;
