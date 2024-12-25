import 'package:clean_arch/domain/Entities/user_Entity.dart';
import 'package:clean_arch/domain/Reopstries/UserRepostries.dart';

class GetUser{
  late final UserRepostreis repostries ;
  Future<UserEntities> call(){
    return repostries.getuserdata();

  }
}