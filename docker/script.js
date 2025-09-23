const jwt = require('jsonwebtoken');

const secret = "yW4wJ6a9X8jK8bF1rC3x8uWq7tNp4QeUdLxvB9zVz2k="; // PGRST_JWT_SECRET bilan bir xil

const payload = { role: "anon" }; // pgRest anon role
const token = jwt.sign(payload, secret, { algorithm: "HS256" });

console.log(token);
