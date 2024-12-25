
import 'package:clean_arch/core/parameter/paramaters.dart';

import '../Entities/user_Entity.dart';
abstract class UserRepostreis{
  Future<UserEntities> getuserdata({UserParams params});
}