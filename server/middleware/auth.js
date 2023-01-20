const jsonweb = require('jsonwebtoken')


const auth = (req,res,next) => {
    try{
        const token = req.header('auth-token');
        if(!token)
            return res.status(401).json({
                msg :"No Auth token access denied"
            })
        const verified = jsonweb.verify(token,'passwordKey')
        if(!verified)
            return res.status(401).json({
                msg : "Token Verfication failed"
            })

        req.user = verified.id;
        req.token = token;
        next();
    }

    catch(e)
    {
        res.status(500).json({
            error : e.message
        })
    }
}

module.exports = auth;