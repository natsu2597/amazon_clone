const express = require("express");
const adminRouter = express.Router();
const admin = require("../middleware/admin");
const { Product } = require("../models/product");




// Create Products
adminRouter.post("/admin/add-product", admin, async (req,res) => {
    try{
        const {name, description, images, quantity, price, category} = req.body;
        let product = new Product({
            name,
            description,
            images,
            quantity,
            price,
            category,
        });
        product = await product.save();
        res.json(product);
    }

    catch(e){
        res.status(500).json({
            error : e.message
        })
    }
})


// Read Products from database
adminRouter.get("/admin/get-product",admin,async (req,res) => {
    try{
        const products = await Product.find({});
        res.json(products);
    }
    catch(e)
    {
        res.status(500).json({
            error : e.message
        })
    }
})


adminRouter.post("/admin/delete-product",admin, async (req,res) => {
    try{
        const { id } = req.body;
        let product = await Product.findByIdAndDelete(id);
        res.json(product)
    }       
    catch(e){
        res.status(500).json({
            error : e.message
        })
    }
})

module.exports = adminRouter