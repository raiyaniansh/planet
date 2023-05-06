import 'package:get/get.dart';
import 'package:planet/screen/home/modal/home_modal.dart';

class HomeController extends GetxController
{
  RxList<HomeModal> detalis=<HomeModal>[
    HomeModal(image: "assets/image/earth.png",place: "3",name: "EARTH",bname: "Milkyway Glaxey",time: "54.6m km",second: "3.711 m/s"),
    HomeModal(image: "assets/image/jupiter.png",place: '5',name: "JUPITER",bname: "Milkyway Glaxey",time: "50.6m km",second: "3.500 m/s"),
    HomeModal(image: "assets/image/mars.png",place: "4",name: "MARS",bname: "Milkyway Glaxey",time: "60.6m km",second: "2.88 m/s"),
    HomeModal(image: "assets/image/Mercury.png",place: "1",name: "MERCURY",bname: "Milkyway Glaxey",time: "58.6m km",second: "3.454 m/s"),
    HomeModal(image: "assets/image/seturn.png",place: '6',name: "SATURN",bname: "Milkyway Glaxey",time: "54.7m km",second: "3.009 m/s"),
    HomeModal(image: "assets/image/uranus.png",place: '7',name: "URANUS",bname: "Milkyway Glaxey",time: "45.6m km",second: "3.600 m/s"),
    HomeModal(image: "assets/image/venus.png",place: "2",name: "VENUS",bname: "Milkyway Glaxey",time: "45.6m km",second: "3.600 m/s"),
  ].obs;
}