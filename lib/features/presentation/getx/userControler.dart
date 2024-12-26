import 'package:clean_arch/features/Data/Datasource/user_local_datta_source.dart';
import 'package:clean_arch/features/Data/Datasource/user_remote_datas_source.dart';
import 'package:clean_arch/features/domain/Entities/user_Entity.dart';
import 'package:get/get.dart';
import 'package:clean_arch/core/parameter/paramaters.dart'; // تأكد من المسار الصحيح
import 'package:clean_arch/features/domain/usecases/getuser.dart'; // تأكد من المسار الصحيح
import 'package:clean_arch/features/Data/Repostries/UserRepostries.dart'; // تأكد من المسار الصحيح
import 'package:clean_arch/core/conection/network_info.dart'; // تأكد من المسار الصحيح
import 'package:clean_arch/core/database/api/http_constumer.dart'; // تأكد من المسار الصحيح
import 'package:clean_arch/core/database/cach/chachFluterSecureStorage.dart'; // تأكد من المسار الصحيح
import 'package:connectivity_plus/connectivity_plus.dart'; // تأكد من المسار الصحيح
import 'package:http/http.dart' as http;

class UserControler extends GetxController {
  var userState = Rx<UserState>(UserState.loading); // الحالة المبدئية هي تحميل
  var user = Rx<UserEntities?>(null);
  var errorMessage = ''.obs;
  @override
  void onInit() {
    print("helo word");
    UserWIfiOrCach(1);
    super.onInit();
  }
  // دالة لجلب بيانات المستخدم بناءً على الاتصال بالشبكة أو التخزين المحلي
  UserWIfiOrCach(int id) async {
    userState.value = UserState.loading;
    errorMessage.value = ''; // إعادة تعيين رسالة الخطأ في بداية التحميل

    try {
      var userResponse = await GetUser(
        repostries: UserRepostriesImplm(
          networkInfo: NetworkInfoImpl(),
          remoredata: UserRemoteDataSource(api: HttpConsumer(client: http.Client())),
          localdata: UserLocalData(cach: SecureStorageHelper()),
        ),
      ).call(params: UserParams(id: id.toString()));

      // إذا كانت الاستجابة صحيحة (غير فارغة)
      if (userResponse != null) {
        userState.value = UserState.success;
        user.value = userResponse;  // تخزين البيانات في المتغير `user`
      } else {
        userState.value = UserState.failure;
        errorMessage.value = 'Failed to load user data';
      }
    } catch (e) {
      userState.value = UserState.failure;
      errorMessage.value = 'Error: $e';
    }
  }
}

enum UserState { loading, success, failure }
