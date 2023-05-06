import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:planet/screen/deatils/view/deatils_screen.dart';
import 'package:planet/screen/home/view/home_screen.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: '/', page: () => HomeScreen(),transition: Transition.fade),
          GetPage(name: '/deatils', page: () => DeatilsScreen(),transition: Transition.fade),
        ],
      ),
    ),
  );
}