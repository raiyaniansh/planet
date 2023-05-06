import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet/screen/home/controller/home_controller.dart';
import 'package:sizer/sizer.dart';

class DeatilsScreen extends StatefulWidget {
  const DeatilsScreen({Key? key}) : super(key: key);

  @override
  State<DeatilsScreen> createState() => _DeatilsScreenState();
}

class _DeatilsScreenState extends State<DeatilsScreen> with SingleTickerProviderStateMixin{
  HomeController homeController = Get.put(HomeController());
  Animation? position;
  AnimationController? animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 50));
    position = Tween<double>(begin:40,end: 0).animate(animationController!);
    animationController!.repeat();
    animationController!.addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    int i = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment(-0.95, -0.95),
              child: Icon(Icons.arrow_back_ios_new_outlined, size: 10.w),
            ),
            Align(
              alignment: Alignment(-0.8, -0.6),
              child: Text('${homeController.detalis[i].place}',
                  style: TextStyle(color: Colors.black12, fontSize: 200.sp)),
            ),
            Align(
              alignment: Alignment(0.95, -0.95),
              child: Transform.rotate(
                angle: position!.value,
                child: Container(
                    height: 300,
                    width: 300,
                    child: Image.asset(
                      '${homeController.detalis[i].image}',
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            Align(
              alignment: Alignment(-0.85, -0.1),
              child: Text('${homeController.detalis[i].name}',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 50.sp)),
            ),
            Align(
              alignment: Alignment(-0.8, 0),
              child: Text('${homeController.detalis[i].bname}',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp)),
            ),
            Align(
                alignment: Alignment(-0.8, 0.13),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/image/ic_distance.png',color: Colors.black87),
                    SizedBox(width: 2.w,),
                    Text("${homeController.detalis[i].time}",style: TextStyle(fontSize: 15.sp)),
                    SizedBox(width: 5.w,),
                    Image.asset('assets/image/ic_gravity.png',color: Colors.black87),
                    Text("${homeController.detalis[i].second}",style: TextStyle(fontSize: 15.sp)),
                  ],
                )),
            Align(
              alignment: Alignment(0, 1),
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
                    style: TextStyle(fontSize: 15.sp)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
