
import 'package:clean_arch/core/database/api/endpoint.dart';
import 'package:clean_arch/features/Data/Models/SubModels/AddresModel.dart';
import 'package:clean_arch/features/Data/Models/SubModels/companey_model.dart';
import 'package:clean_arch/features/domain/Entities/user_Entity.dart';

class UserModel extends UserEntities{
  final String id ;
  final String username;
  final String website;
  final Companey_model companey;
  UserModel({
    required super.name,
    required super.email,
    required this.id,
    required this.companey,
    required this.username,
    required this.website,
    required super.phone,
    required super.address});


  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
        name: json[ApiKeys.name],
        email:  json[ApiKeys.email],
        id: json[ApiKeys.id],
        companey: Companey_model.fromJson(json[ApiKeys.company]),
        username: json[ApiKeys.username],
        website: json[ApiKeys.website],
        phone: json[ApiKeys.phone],
        address: Address_Model.fromJson(json[ApiKeys.address])
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "id": id,
      "name": name,
      "username": username,
      "email": email,
      "address": address,
      "phone": phone,
      "website": website,
      "company":companey
    };
  }
}