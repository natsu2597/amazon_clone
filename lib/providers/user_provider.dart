


import 'package:amazon_clone/models/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier{  
    UserModel _user = UserModel(id: '',
     name: '',
      email: '',
       password: '',
        address: '',
         type: '',
          token: '') ;

    UserModel get user => _user;


    void setUser(String user)
    {
      _user = UserModel.fromJson(user);
      notifyListeners();
    }
}

    