import 'package:capygram/models/user.dart';
import 'package:capygram/resources/auth_methods.dart';
import 'package:flutter/widgets.dart';


class UserProvider extends ChangeNotifier {
  UserModel? _user;
   
  final AuthMethods _authMethods = AuthMethods(); 
  UserModel get getUser => _user!;

  Future<void> refreshUser() async{
    UserModel user = await  _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}