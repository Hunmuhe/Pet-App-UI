import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_app_ui/utils/color.dart';
import 'package:pet_app_ui/data/cats.dart';
import 'package:readmore/readmore.dart';

class PetsDetailPage extends StatefulWidget {
  const PetsDetailPage({super.key});

  @override
  State<PetsDetailPage> createState() => _PetsDetailPageState();
}

class _PetsDetailPageState extends State<PetsDetailPage> {
  late Cat cat;

  @override
  void initState() {
    super.initState();
    final Map<String, dynamic> args = Get.arguments;
    cat = args['cat'];
  }

  @override
  Widget build(BuildContext context) {
    // final Map<String, dynamic> args = Get.arguments;
    // final Cat cat = args['cat'];
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            itemsImageAndBackground(size),
            // for back button and more icon
            backButton(size, context),
            // for name location and favorite icon
            Positioned(
              bottom: 0,
              child: Container(
                height: size.height * 0.52,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        nameAddressAndFavoriteButton(),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            moreInfo(
                              color1,
                              color1.withValues(alpha: 0.5),
                              cat.sex,
                              "Sex",
                            ),
                            moreInfo(
                              color2,
                              color2.withValues(alpha: 0.5),
                              "${cat.age.toString()} Years",
                              "Age",
                            ),
                            moreInfo(
                              color3,
                              color3.withValues(alpha: 0.5),
                              "${cat.weight.toString()} KG",
                              "Weight",
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // for woiner name and contact
                        wonerInfo(),
                        // for description
                        const SizedBox(height: 20),
                        // for this see more and see less you need to add a package
                        ReadMoreText(
                          cat.description,
                          textAlign: TextAlign.justify,
                          trimCollapsedText: 'See More',
                          colorClickableText: Colors.orange,
                          trimLength: 100,
                          trimMode: TrimMode.Length,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // for adopt me button
                        Container(
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: buttonColor,
                          ),
                          child: const Center(
                            child: Text(
                              'Adopt Me',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row wonerInfo() {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: cat.color,
          backgroundImage: AssetImage(cat.owner.image),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cat.owner.name,
                style: const TextStyle(
                  fontSize: 18,
                  color: black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${cat.name} Owner",
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color3.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.chat_outlined,
            color: Colors.lightBlue,
            size: 16,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.phone_outlined, color: Colors.red, size: 16),
        ),
      ],
    );
  }

  Row nameAddressAndFavoriteButton() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cat.name,
                style: const TextStyle(
                  fontSize: 25,
                  color: black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, color: blue),
                  Text(
                    '${cat.location} (${cat.distance} Km)',
                    style: TextStyle(
                      color: black.withValues(alpha: 0.6),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // for favorite icon
        Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3),
                color: cat.fav
                    ? Colors.red.withValues(alpha: 0.1)
                    : black.withValues(alpha: 0.2),
                blurRadius: 2,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Icon(
            cat.fav ? Icons.favorite_rounded : Icons.favorite_border_rounded,
            color: cat.fav ? Colors.red : black.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  Positioned backButton(Size size, BuildContext context) {
    return Positioned(
      height: size.height * 0.14,
      right: 20,
      left: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios_rounded, color: black),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: const Icon(Icons.more_horiz, color: black),
          ),
        ],
      ),
    );
  }

  Container itemsImageAndBackground(Size size) {
    return Container(
      height: size.height * 0.50,
      width: size.width,
      decoration: BoxDecoration(color: cat.color.withValues(alpha: 0.5)),
      child: Stack(
        children: [
          Positioned(
            left: -60,
            top: 30,
            child: Transform.rotate(
              angle: -11.5,
              child: Image.network(
                "https://clipart-library.com/images/rTnrpap6c.png",
                color: cat.color,
                height: 200,
              ),
            ),
          ),
          Positioned(
            right: -60,
            bottom: 0,
            child: Transform.rotate(
              angle: 12,
              child: Image.network(
                "https://clipart-library.com/images/rTnrpap6c.png",
                color: cat.color,
                height: 200,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Hero(
              tag: cat.image,
              child: Image.asset(cat.image, height: size.height * 0.45),
            ),
          ),
        ],
      ),
    );
  }
}

ClipRRect moreInfo(pawColor, backgroundColr, title, value) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Stack(
      children: [
        Positioned(
          bottom: -20,
          right: 0,
          child: Transform.rotate(
            angle: 12,
            child: Image.network(
              'https://clipart-library.com/images/rTnrpap6c.png',
              color: pawColor,
              height: 55,
            ),
          ),
        ),
        Container(
          height: 100,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: backgroundColr,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
