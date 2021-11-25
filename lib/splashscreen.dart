import 'dart:async';
import 'package:flutter/material.dart';
import 'package:packingtracker/pages/detailpage_shippingitem.dart';
import 'package:packingtracker/pages/list_shippingitems.dart';
import 'package:packingtracker/pages/login.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  //in init state calls first when page load and after 3sec move to Homepage
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>const ListShippingItems())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(child: Image.asset('assets/happenstance.png')));
  }
}
