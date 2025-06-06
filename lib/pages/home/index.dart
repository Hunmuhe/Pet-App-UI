import 'package:flutter/material.dart';
import 'package:pet_app_ui/l10n/app_localizations.dart';
import 'package:pet_app_ui/utils/color.dart';
import 'package:pet_app_ui/data/cats.dart';
import 'package:pet_app_ui/routes/navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            headerParts(),
            const SizedBox(height: 20),
            joinNow(),
            const SizedBox(height: 30),
            categoryViewAll("Categories"),
            const SizedBox(height: 25),
            categoryItems(),
            const SizedBox(height: 20),
            categoryViewAll("Adopt Pet"),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(cats.length, (index) {
                  final cat = cats[index];
                  return petsItems(size, cat);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding petsItems(Size size, Cat cat) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: () {
          Navigation.toPetsDetail(cat);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: size.height * 0.3,
            width: size.width * 0.55,
            color: cat.color.withValues(alpha: 0.5),
            child: Stack(
              children: [
                Positioned(
                  bottom: -10,
                  right: -10,
                  height: 100,
                  width: 100,
                  child: Transform.rotate(
                    angle: 12,
                    child: Image.network(
                      "https://clipart-library.com/images/rTnrpap6c.png",
                      color: cat.color,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: -25,
                  height: 90,
                  width: 90,
                  child: Transform.rotate(
                    angle: -11.5,
                    child: Image.network(
                      "https://clipart-library.com/images/rTnrpap6c.png",
                      color: cat.color,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -10,
                  right: 10,
                  child: Hero(
                    tag: cat.image,
                    child: Image.asset(cat.image, height: size.height * 0.23),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cat.name,
                              style: const TextStyle(
                                fontSize: 20,
                                color: black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: blue,
                                  size: 18,
                                ),
                                Text(
                                  "${cat.distance} km",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          cat.fav
                              ? Icons.favorite_rounded
                              : Icons.favorite_outline_rounded,
                          color: cat.fav ? Colors.red : black.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView categoryItems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black12.withValues(alpha: 0.03),
            ),
            child: const Icon(Icons.tune_rounded),
          ),
          ...List.generate(
            categories.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {});
                  selectedCategory = index;
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: selectedCategory == index
                        ? buttonColor
                        : Colors.black12.withValues(alpha: 0.03),
                  ),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: 16,
                      color: selectedCategory == index ? Colors.white : black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding categoryViewAll(name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              const Text(
                "View All",
                style: TextStyle(fontSize: 12, color: Colors.amber),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsetsDirectional.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.amber,
                ),
                child: const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding headerParts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Location",
                style: TextStyle(fontSize: 16, color: black.withValues(alpha: 0.6)),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: blue,
                size: 18,
              ),
            ],
          ),
          Row(
            children: [
              const Text.rich(
                TextSpan(
                  text: "Chicago, ",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: black,
                  ),
                  children: [
                    TextSpan(
                      text: "US",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black12.withValues(alpha: 0.03),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.search),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black12.withValues(alpha: 0.03),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    const Icon(Icons.notifications_outlined),
                    Positioned(
                      right: 5,
                      top: 5,
                      child: Container(
                        height: 7,
                        width: 7,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding joinNow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 180,
          width: double.infinity,
          color: blueBackground,
          child: Stack(
            children: [
              Positioned(
                bottom: -20,
                right: -30,
                width: 100,
                height: 100,
                child: Transform.rotate(
                  angle: 12,
                  child: Image.network(
                    "https://clipart-library.com/images/rTnrpap6c.png",
                    color: pawColor2,
                  ),
                ),
              ),
              Positioned(
                bottom: -35,
                left: -15,
                width: 100,
                height: 100,
                child: Transform.rotate(
                  angle: -12,
                  child: Image.network(
                    "https://clipart-library.com/images/rTnrpap6c.png",
                    color: pawColor2,
                  ),
                ),
              ),
              Positioned(
                top: -40,
                left: 120,
                width: 110,
                height: 110,
                child: Transform.rotate(
                  angle: -16,
                  child: Image.network(
                    "https://clipart-library.com/images/rTnrpap6c.png",
                    color: pawColor2,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 20,
                height: 170,
                child: Image.asset("assets/images/cat1.png"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Join Our Animal\nLovers Community",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.1,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amberAccent,
                      ),
                      child: const Text(
                        "Join Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
