// import 'package:express/express.dart'
// Import for packages
const express = require('express');
const mongoose = require("mongoose");


// Import for all files
const authRouter = require('./routes/auth');

// Initialization
const PORT = 3000
const app = express()
const DB = "mongodb+srv://natsu2597:natsuSAMA1@cluster0.gqcqqnp.mongodb.net/?retryWrites=true&w=majority";

// middleware
app.use(express.json())
app.use(authRouter)

// Connections
mongoose.connect(DB).then(() => {
    console.log("Connection Successful")
}).catch((e) => {
    console.log(e);
})




app.listen(PORT, "0.0.0.0", () => {
    console.log(`Connected to port ${PORT}`);
})