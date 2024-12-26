import 'package:clean_arch/features/domain/Entities/SubEntities/GeoEntities.dart';

import '../../../../core/database/api/endpoint.dart';

class GeoModel extends GeoEntity{
  GeoModel({
    required super.lat,
    required super.lng});
  factory GeoModel.fromJson(Map<String,dynamic> json){
    print('try to handle Geo to object');
    GeoModel a =GeoModel(
      lat: json[ApiKeys.lat],
      lng: json[ApiKeys.lng],
    );
    print('i  handle Geo to object seccesfuly');
    return a;
  }
  Map<String,dynamic> toJson(){
    return {
      ApiKeys.lat: lat,
      ApiKeys.lng: lng,
    };
  }
}