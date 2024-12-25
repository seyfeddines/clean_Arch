
import '../../../core/parameter/paramaters.dart';
import '../Entities/user_Entity.dart';
import '../Reopstries/UserRepostries.dart';

class GetUser{
  late final UserRepostreis repostries ;
  Future<UserEntities> call({required UserParams params}){
    return repostries.getuserdata(params: params);

  }
}