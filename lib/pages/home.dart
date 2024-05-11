import 'package:carousel_slider/carousel_slider.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/models/bag.dart';
import 'package:shopping_app/pages/camera.dart';
import 'package:shopping_app/pages/heart.dart';
import 'package:shopping_app/pages/shop.dart';

import '../widgets/bag_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Bag> bags = listOfBags();
  List<String> heroImages = [
    "assets/images/img1.png",
    "assets/images/img2.png",
    "assets/images/img3.png",
    "assets/images/img4.png",
  ];

  final controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 90,
          elevation: 0,
          title: Text("Power Glam",
              style: GoogleFonts.playfairDisplay(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          leading: IconButton(
              iconSize: 40,
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/menu.svg")),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 12),
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  color: Colors.black, shape: BoxShape.circle),
              child:
                  Image.asset("assets/images/img.png", fit: BoxFit.contain),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              carousel(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: bags.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 250,
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 13,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return BagItem(bag: bags[index]);
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: navigationBar());
  }

  Widget navigationBar() {
    return Container(
      height: 65,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(69)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.home,
              size: 30,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.search,
              size: 30,
            )),
            IconButton(
          onPressed: () {
            // Navegar a la página de la cámara
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CameraApp()),
            );
          },
          icon: const Icon(
            FeatherIcons.camera,
            size: 30,
          ),
        ),
        IconButton(
  onPressed: () {
    // Navegar a la página de favoritos
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HeartPage()),
    );
  },
  icon: const Icon(
    FeatherIcons.heart,
    size: 30,
  ),
),

        Stack(
          children: [
  IconButton(
    onPressed: () {
      // Navegar a la página de shop
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ShopApp()),
      );
    },
    icon: const Icon(
      FeatherIcons.shoppingCart,
      size: 30,
    ),
  ),
  const Positioned(
    right: 1,
    top: 1,
    child: CircleAvatar(
      backgroundColor: Colors.black,
      radius: 10,
      child: Text(
        "1",
        style: TextStyle(fontSize: 13),
      ),
    ),
  )
],

        )
      ]),
    );
  }

  Widget carousel() {
    return Stack(
      children: [
        CarouselSlider.builder(
            carouselController: controller,
            itemCount: heroImages.length,
            options: CarouselOptions(
                viewportFraction: 1, height: 230, enableInfiniteScroll: true),
            itemBuilder: (context, index, realIndex) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(heroImages[index]),
                        fit: BoxFit.cover)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Text(
                          " ¡Lo último! ",
                          style: GoogleFonts.playfairDisplay(
                              backgroundColor: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
              );
            }),
        Positioned(
          bottom: 1,
          right: 22,
          child: Row(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(50, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0))),
                  onPressed: previousPage,
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  )),
              const SizedBox(width: 3),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(50, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0))),
                  onPressed: nextPage,
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 30,
                  ))
            ],
          ),
        )
      ],
    );
  }

  void previousPage() {
    controller.previousPage(duration: const Duration(milliseconds: 400));
  }

  void nextPage() {
    controller.nextPage(duration: const Duration(milliseconds: 400));
  }
}
