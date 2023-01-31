const mongoose = require('mongoose');
const { productSchema } = require('./product');

const orderSchema = mongoose.Schema({
    products : [
        {
            product : productSchema,
            quantiy : {
                type : Number,
                required : true
            }
        }
    ],
    totalPrice : {
        required : true,
        type : Number
    },
    address : {
        type : String,
        required : true,
    },
    userId : {
        required : true,
        type : String
    },
    orderAt : {
        type : Number,
        required : true,
    },
    status : {
        type : Number,
        default : 0,
    }
})

const Order = mongoose.model('Order', orderSchema);
module.exports = Order;