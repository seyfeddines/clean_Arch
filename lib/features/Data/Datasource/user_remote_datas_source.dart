import 'package:clean_arch/core/database/api/api_constumer.dart';
import 'package:clean_arch/core/database/api/endpoint.dart';
import 'package:clean_arch/core/parameter/paramaters.dart';
import 'package:clean_arch/features/Data/Models/usermodel.dart';

class UserRemoteDataSource {
  late final ApiConsumer api;
  UserRemoteDataSource({required this.api});
  Future<UserModel> getuser(UserParams params)async{
    final response = await api.get('${EndPoint().user}/${params.id}');
    return UserModel.fromJson(response);
  }
}