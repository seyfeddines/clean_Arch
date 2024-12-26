import 'package:clean_arch/core/conection/network_info.dart';
import 'package:clean_arch/core/parameter/paramaters.dart';
import 'package:clean_arch/features/Data/Datasource/user_local_datta_source.dart';
import 'package:clean_arch/features/Data/Datasource/user_remote_datas_source.dart';
import 'package:clean_arch/features/Data/Models/usermodel.dart';
import 'package:clean_arch/features/domain/Entities/user_Entity.dart';
import 'package:clean_arch/features/domain/Reopstries/UserRepostries.dart';

class UserRepostriesImplm extends UserRepostreis {
   final UserRemoteDataSource remoredata ;
  final UserLocalData localdata;
  UserRepostriesImplm({required this.networkInfo,required this.remoredata,required this.localdata});
  late final NetworkInfo networkInfo;
  @override
  Future<UserEntities> getuserdata({required UserParams params}) async{
    if(await networkInfo.isConnected!){
      try{
        print('helo world');
        final UserModel responseuser = await remoredata.getuser(params);
        print("this is response user : ${responseuser.name}");
        localdata.CachUser(responseuser);
        return responseuser;
      }catch(e){
        throw Exception('theres is no internet :$e');
      }
    }else{
      try{
        print('start get user from cash');
         final userlast = await localdata.getLastUser();
         print('i get the user ');
         return userlast;
      }catch(e){
        throw Exception('there is no user in cach $e');
      }
    }
  }

}