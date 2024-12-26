import 'package:clean_arch/features/presentation/getx/userControler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserScreen extends StatelessWidget {
  final UserControler controller = Get.put(UserControler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Data")),
      body: Obx(() {
        // عرض واجهة تحميل إذا كانت البيانات لا تزال في حالة تحميل
        if (controller.userState.value == UserState.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        // عرض رسالة خطأ إذا كان هناك فشل في تحميل البيانات
        if (controller.userState.value == UserState.failure) {
          return Center(child: Text(controller.errorMessage.value));
        }

        // عرض بيانات المستخدم إذا كانت الحالة ناجحة
        if (controller.userState.value == UserState.success && controller.user.value != null) {
          final user = controller.user.value!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name: ${user.name}", style: TextStyle(fontSize: 20)),
                Text("Email: ${user.email}", style: TextStyle(fontSize: 20)),
                Text("Address: ${user.address}", style: TextStyle(fontSize: 20)),
                Text("Phone: ${user.phone}", style: TextStyle(fontSize: 20)),
              ],
            ),
          );
        }

        // في حالة غير معروفة (لن تحدث هنا إذا كانت الحالات في مكانها الصحيح)
        return const Center(child: Text("No Data Available"));
      }),
    );
  }
}
