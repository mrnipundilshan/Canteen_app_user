import 'dart:js';

import 'package:canteen/backgrounds/signup_bg.dart';
import 'package:canteen/pages/menu/food_card.dart';
import 'package:canteen/pages/menu/food_class.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;
import 'package:canteen/config/config.dart';

class menupage extends StatefulWidget {
  // final token;
  // const menupage({@required this.token, Key? key}) : super(key: key);

  final String user;
  const menupage({required this.user, Key? key}) : super(key: key);

  @override
  State<menupage> createState() => _menupageState();
}

class _menupageState extends State<menupage> {
  List<Menu> menus = getmenu();

  static List<Menu> getmenu(){
    const data = {

    }

    return data.map<Menu>(Menu.fromJson).toList();
  }
  
  late String mobile_number;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);

  //   mobile_number = jwtDecodedToken['mobile_number'];
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: size.height,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.05,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: size.height * 0.01,
                    ),
                    Image.asset(
                      "assets/profile.png",
                      width: size.width * 0.15,
                    ),
                    SizedBox(
                      width: size.height * 0.03,
                    ),
                    Image.asset(
                      "assets/profile.png",
                      width: size.width * 0.15,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "2024.06.24 Menu",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.08,
                          color: const Color.fromRGBO(60, 121, 98, 1.0)),
                    ),
                    buildmenus(menus),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildmenus(List<Menu> menus) => ListView.builder(
  itemCount: menus.length,
  itemBuilder: (context, index){
    final Menu = menus[index];

    food_card(food_name: Menu.name, price: Menu.price);
  },
  
);

}



