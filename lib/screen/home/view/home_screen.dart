import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet/screen/home/controller/home_controller.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  Animation? position;
  HomeController homeController = Get.put(HomeController());
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 50));
    position = Tween<double>(begin:40,end: 0).animate(animationController!);
    animationController!.repeat();
    animationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(transform: GradientRotation(pi/2),colors: [
                  Color(0xff335492),
                  Color(0xff835AAE),
                ])
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 3.h,),
                  Text("Explore",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35.sp),),
                  SizedBox(height: 1.h,),
                  Row(
                    children: [
                      Text("Solar system",style: TextStyle(color: Colors.white70,fontSize: 16.sp),),
                      SizedBox(width: 1.w,),
                      Transform.rotate(angle: pi/2,child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white70,size: 4.w,))
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Align(
                        alignment: Alignment(0, -0.5),
                        child: Container(
                          height: 50.h,
                          width: 80.w,
                          margin: EdgeInsets.only(left: 5.w,right: 5.w,top: 15.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(color: Colors.black38,blurRadius: 3,spreadRadius: 1,offset: Offset(3, 6))
                            ]
                          ),
                          child: Stack(
                            children: [
                              Align(alignment: Alignment(0.7, 2.5),child: Text("${homeController.detalis[index].place}",style: TextStyle(color: Colors.black12,fontWeight: FontWeight.bold,fontSize: 300.sp),)),
                              Align(
                                alignment: Alignment(0, -2),
                                child: Transform.rotate(angle: position!.value,child: Container(height: 28.h,width: 28.h,child: Image.asset('${homeController.detalis[index].image}',fit: BoxFit.cover,))),
                              ),
                              Align(alignment: Alignment(-0.7, 0.2),child: Text("${homeController.detalis[index].name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50.sp),)),
                              Align(alignment: Alignment(-0.7, 0.4),child: Text("Solar system",style: TextStyle(color: Colors.black54,fontSize: 30.sp),)),
                              Align(alignment: Alignment(-0.8, 0.8),child: InkWell(
                                onTap: () {
                                  Get.toNamed('/deatils',arguments: index);
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Know More",style: TextStyle(color: Colors.blueGrey.shade700,fontSize: 20.sp),),
                                    Icon(Icons.arrow_forward_outlined,color: Colors.blueGrey.shade700),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                      itemCount: homeController.detalis.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
