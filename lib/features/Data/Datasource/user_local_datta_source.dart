


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
  Future<UserModel> getLastUser() {
    final  jsonString = cach.getData(key:"CachUser" );

    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonString as String)));
    } else {
      throw Exception( "No Internet Connection");
    }
  }
}

