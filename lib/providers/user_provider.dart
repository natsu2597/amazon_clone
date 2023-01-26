


import 'package:amazon_clone/models/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier{  
    UserModel _user = UserModel(id: '',
     name: '',
      email: '',
       password: '',
        address: '',
         type: '',
          token: '',
          cart: []) ;

    UserModel get user => _user;


    void setUser(String user)
    {
      _user = UserModel.fromJson(user);
      notifyListeners();
    }

    void setUserFromModel(UserModel user){
      _user = user;
      notifyListeners();
    }
}

    