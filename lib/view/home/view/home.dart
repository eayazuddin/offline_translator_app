import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_strings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(AppStrings.bangladesh.tr,style: TextStyle(
              fontSize: 20,
              color: Colors.green,
              fontWeight: FontWeight.w500
            ),),
            Text(AppStrings.bangladesh.tr,style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              color: Colors.deepOrange,
            ),),
            Text(AppStrings.bangladesh.tr,style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.blue
            ),),
            Text(AppStrings.bangladesh.tr,style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
               color: Colors.grey
            ),),
          ],
        ),
      ),
    );
  }
}