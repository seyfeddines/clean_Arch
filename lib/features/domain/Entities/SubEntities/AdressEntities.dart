import 'GeoEntities.dart';

class AdressEntity{
  late final String street;
  late final String suite;
  late final String city;
  late final String zipcode;
  late final GeoEntity geo;
  AdressEntity({
    required this.street,
    required this.suite,
    required this.city,
    required this.geo,
  });
}