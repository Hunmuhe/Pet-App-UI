import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_app_ui/l10n/app_localizations.dart';
import 'package:pet_app_ui/storages/config.dart';
import 'package:pet_app_ui/utils/color.dart';
import 'package:pet_app_ui/data/boards.dart';
import 'package:pet_app_ui/routes/navigation.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key});

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  late List<Board> boards;
  late AppLocalizations localizations;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    localizations = AppLocalizations.of(context)!;
    boards = boardsData(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.7,
            color: Colors.white,
            child: PageView.builder(
              itemCount: boards.length,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              controller: _pageController,
              itemBuilder: (context, index) {
                return onBoardingItems(size, index);
              },
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (currentPage == boards.length - 1) {
                await Get.find<ConfigStore>().setFirstLaunch(false);
                Navigation.toRoot();
              } else {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              }
            },
            child: Container(
              height: 70,
              width: size.width * 0.6,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  currentPage == boards.length - 1
                      ? localizations.getStarted
                      : localizations.continuex,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                boards.length,
                (index) => indicatorForSlider(index: index),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AnimatedContainer indicatorForSlider({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: currentPage == index ? 20 : 10,
      height: 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: currentPage == index
            ? Colors.orange
            : black.withValues(alpha: 0.2),
      ),
    );
  }

  Column onBoardingItems(Size size, int index) {
    return Column(
      children: [
        Container(
          height: size.height * 0.4,
          width: size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 240,
                    width: size.width * 0.9,
                    color: orangeContainer,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 5,
                          left: -40,
                          height: 130,
                          width: 130,
                          child: Transform.rotate(
                            angle: -11,
                            child: Image.network(
                              "https://clipart-library.com/images/rTnrpap6c.png",
                              color: pawColor1,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -20,
                          right: -20,
                          height: 130,
                          width: 130,
                          child: Transform.rotate(
                            angle: -12,
                            child: Image.network(
                              "https://clipart-library.com/images/rTnrpap6c.png",
                              color: pawColor1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 60,
                child: Image.asset(
                  boards[index].image,
                  height: 375,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 35,
              color: black,
              fontWeight: FontWeight.w900,
              height: 1.2,
            ),
            children: [
              TextSpan(text: localizations.findYou),
              TextSpan(
                text: localizations.dream,
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.w900,
                ),
              ),
              TextSpan(text: localizations.petHere),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          boards[index].text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15.5, color: Colors.black38),
        ),
      ],
    );
  }
}
