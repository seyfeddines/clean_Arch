


import 'dart:convert';

import 'package:clean_arch/core/database/cach/chachFluterSecureStorage.dart';
import 'package:clean_arch/features/Data/Models/usermodel.dart';

class UserLocalData {
  late final SecureStorageHelper cach;
  UserLocalData({required this.cach});

  CachUser(UserModel ToCachModel){
    if(ToCachModel !=null){
      cach.saveData(key: 'CachUser', value: jsonEncode(ToCachModel.toJson()));
    }else{
       print('No Internet');
    }

  }
  Future<UserModel> getLastUser() async{
    final  jsonString = await cach.getData(key:"CachUser" );
    print('this is the last object :$jsonString');
    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    } else {
      throw Exception( "No Internet Connection");
    }
  }
}

