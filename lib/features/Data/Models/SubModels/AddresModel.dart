import 'package:clean_arch/features/Data/Models/SubModels/geoModel.dart';
import 'package:clean_arch/features/domain/Entities/SubEntities/AdressEntities.dart';

import '../../../../core/database/api/endpoint.dart';

class Address_Model extends AdressEntity{
  Address_Model({
    required super.street,
    required super.suite,
    required super.city,
    required super.geo});


  factory Address_Model.fromJson(Map<String,dynamic> json){
    print('try to handle addres to object');
   Address_Model a =  Address_Model(
        street: json[ApiKeys.street],
        suite: json[ApiKeys.suite],
        city: json[ApiKeys.city],

        geo: GeoModel.fromJson(json[ApiKeys.geo])
    );
    print('i handle adress to object seccfuly');
    return a;
  }
  Map<String,dynamic> toJson(){
    return {
      ApiKeys.street: street,
      ApiKeys.suite: suite,
      ApiKeys.city: city,
      ApiKeys.geo: geo,
    };
  }
}