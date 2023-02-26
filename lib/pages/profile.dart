import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:practice/theme/main.dart';
import 'package:practice/utility/globals.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                  height: 140,
                  width: double.infinity,
                  color: Colors.blueAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 30, right: 15),
                          child: Builder(
                            builder: (context) => IconButton(
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 32,
                              ),
                              onPressed: () =>
                                  Scaffold.of(context).openEndDrawer(),
                            ),
                          ))
                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: context.watch<ThemeManager>().isDark
                              ? Color(0xFF303030)
                              : Colors.white,
                        ),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset(
                              'assets/images/profile.jpeg',
                              height: 100,
                              width: 100,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 18),
          Container(
              child: Column(
            children: [
              Text(
                "Arman Hadzigrahic",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                "@armeono",
                style: TextStyle(
                    color: context.watch<ThemeManager>().isDark
                        ? Colors.white
                        : Colors.black45),
              )
            ],
          ))
        ],
      ),
      endDrawer: Drawer(
        child: Container(
          height: 100,
          width: 100,
          child: ListView(children: [
            ListTile(
              title: Text("Item 1"),
              onTap: () => {},
            ),
            ListTile(
              title: Text("Item 2"),
              onTap: () => {},
            ),
            TextButton(
                onPressed: () {
                  context.read<ThemeManager>().toggleTheme();
                },
                child: Icon(context.watch<ThemeManager>().isDark
                    ? Icons.mode_night
                    : Icons.sunny)),
          ]),
        ),
      ),
    );
  }
}
