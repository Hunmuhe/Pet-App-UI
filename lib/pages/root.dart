import 'package:flutter/material.dart';
import 'package:pet_app_ui/utils/color.dart';
import 'package:pet_app_ui/pages/chat/index.dart';
import 'package:pet_app_ui/pages/favorite/index.dart';
import 'package:pet_app_ui/pages/home/index.dart';
import 'package:pet_app_ui/pages/user/index.dart';

final contents = [
  const HomePage(),
  const FavoritePage(),
  const ChatPage(),
  const PersonPage(),
];

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectedIndex = 0;
  List<IconData> icons = [
    Icons.home_outlined,
    Icons.favorite_outline_rounded,
    Icons.chat,
    Icons.person_outline_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: contents[selectedIndex],
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            icons.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                height: 60,
                width: 50,
                padding: const EdgeInsets.all(5),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        Icon(
                          icons[index],
                          size: 30,
                          color: selectedIndex == index
                              ? blue
                              : black.withValues(alpha: 0.6),
                        ),
                        const SizedBox(height: 5),
                        selectedIndex == index
                            ? Container(
                                height: 5,
                                width: 5,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: blue,
                                ),
                              )
                            : SizedBox(height: 5, width: 5),
                      ],
                    ),
                    index == 2
                        ? Positioned(
                            right: 0,
                            top: -10,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: buttonColor,
                              ),
                              child: const Text(
                                "4",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
