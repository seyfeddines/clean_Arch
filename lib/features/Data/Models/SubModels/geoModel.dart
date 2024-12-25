import 'package:clean_arch/features/domain/Entities/SubEntities/GeoEntities.dart';

import '../../../../core/database/api/endpoint.dart';

class GeoModel extends GeoEntity{
  GeoModel({
    required super.lat,
    required super.lng});
  factory GeoModel.fromJson(Map<String,dynamic> json){
    return GeoModel(
        lat: json[ApiKeys.lat],
        lng: json[ApiKeys.lng],
    );
  }
  Map<String,dynamic> toJson(){
    return {
      ApiKeys.lat: lat,
      ApiKeys.lng: lng,
    };
  }
}