import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{

  Future<bool> saveUser (UserModel userModel)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", userModel.token.toString());

    return true;

  }

  Future<UserModel> getUser ()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
   String? token =  prefs.getString("token");

    return UserModel(
      token: token

    );

  }


  Future<bool> logOutUser ()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

    return true;

  }
}