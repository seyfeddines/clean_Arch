

import 'SubEntities/AdressEntities.dart';

class UserEntities {
  late final String name;
  late final String email;
  late final String phone;
  late final AdressEntity address;
  UserEntities({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });
}

