
import '../Entities/user_Entity.dart';
import '../Reopstries/UserRepostries.dart';

class GetUser{
  late final UserRepostreis repostries ;
  Future<UserEntities> call(){
    return repostries.getuserdata();

  }
}