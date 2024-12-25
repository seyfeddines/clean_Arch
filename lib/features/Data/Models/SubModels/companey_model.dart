import '../../../../core/database/api/endpoint.dart';

class Companey_model{
  final String name;
  final String catchPhrase;
  final String bs;
  Companey_model({
    required this.name,
    required this.catchPhrase,
    required this.bs});
  factory Companey_model.fromJson(Map<String,dynamic> json){
    return Companey_model(
      name: json[ApiKeys.name],
      catchPhrase: json[ApiKeys.catchPhrase],
      bs: json[ApiKeys.bs],
    );
  }

  Map<String,dynamic> toJson(){
    return {
      ApiKeys.name: name,
      ApiKeys.catchPhrase: catchPhrase,
      ApiKeys.bs: bs,
    };
  }
}