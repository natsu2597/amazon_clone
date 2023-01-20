const express = require("express");
const bcrypt = require("bcryptjs");
const jsonweb = require('jsonwebtoken');


const User = require('../models/user');
const auth = require("../middleware/auth");

const authRouter = express.Router();


// Sign up Route
authRouter.post("/api/signup", async (req,res) => {

    try{
        const {name,email,password} = req.body;

        const existingUser = await User.findOne({ email });
    
        if(existingUser)
        {
            return res.status(400).json({
            msg : "User already exists"
            })
        }
        
        const hashedPassword = await bcrypt.hash(password, 8);

        let user = new User({
            email,
            password: hashedPassword,
            name
        })

        user = await user.save()
        res.json(user)
    }

    catch(e){
        res.status(500).json({
            error : e.message
        })
    }
    

})

// Sign in Route
authRouter.post('/api/signin', async (req,res) => {
    try{
        const{ email, password} = req.body;

        const user = await User.findOne({ email })
        if(!user)
        {
            return res.status(400).json(
                {
                    msg : "User with this email id does not exist"
                }
            )
        }

        const isMatch = await bcrypt.compare(password, user.password);
        if(!isMatch)
        {
            return res.status(400).json(
                {
                    msg : "Password entered is incorrect"
                }
            )
        }
        const token = jsonweb.sign({
            id : user._id
        }, "passwordKey");

        res.json({ token, ...user._doc });
    }

    catch(e){
        res.status(500).json({
            error : e.message
        })
    }
})



authRouter.post('/tokenIsValid', async (req,res) => {
    try{
        const token = req.header('auth-token');
        if(!token)
            return res.json(false);
        const verified = jsonweb.verify(token,'passwordKey');

        if(!verified)
            return res.json(false);
        

            const user = await User.findById(verified.id);

            if(!user)
                return res.json(false)
            return res.json(true)
        
    }

    catch(e){
        res.status(500).json({
            error : e.message
        })
    }
})


//  Get user Data
authRouter.get("/", auth, async (req,res) => {
    const user = await User.findById(req.user)
    res.json({
        ...user._doc,
        token : req.token
    })
})

module.exports = authRouter;