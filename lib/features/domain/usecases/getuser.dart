
import 'package:clean_arch/core/parameter/paramaters.dart';
import '../Entities/user_Entity.dart';
import '../Reopstries/UserRepostries.dart';

class GetUser{
  GetUser({required this.repostries});
    final UserRepostreis repostries ;
  Future<UserEntities> call({required UserParams params})async {
    print('start ');
    UserEntities user = await repostries.getuserdata(params: params);
    print('end');
    print('this name is from get user ;:${user.name}');
    return user;
  }
}