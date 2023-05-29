import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // backgroundColor: Color(0xFF17205E),
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 3.0,
            sigmaY: 3.0,
          ),
          child: Container(
            color: Colors.black.withOpacity(.4),
            child: BottomNavigationBar(
                // useLegacyColorScheme: false,
                mouseCursor: MouseCursor.uncontrolled,
                // enableFeedback: false,
                // useLegacyColorScheme: false,

                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.r_mobiledata), label: 'test'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.r_mobiledata), label: 'test'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.r_mobiledata), label: 'test'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.r_mobiledata), label: 'test'),
                ]),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFCFCFE),
              Color(0xFFA3BFF3),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/person.jpg'),
                  radius: 20,
                ),
                title: Text(
                  'Hi, Omar hadek',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/plane_discover.jpg',
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Color.fromARGB(255, 20, 19, 80),
                      BlendMode.colorDodge,
                    ),
                    filterQuality: FilterQuality.high,
                  ),
                ),
                child: Text(
                  'Let’s Discover \na New Adventure !',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ChipItem(
                      icon: Ionicons.airplane_sharp,
                      title: 'Flight',
                    ),
                    ChipItem(
                      title: 'Hotel',
                      icon: Ionicons.bed_sharp,
                    ),
                    ChipItem(
                      title: 'Car',
                      icon: Ionicons.car_sharp,
                    ),
                    ChipItem(
                      title: 'Train',
                      icon: Ionicons.train_sharp,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Explore Destination',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: ListView(
                  itemExtent: 180,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: const [
                    DestinationCard(
                      city: 'Paris',
                      country: 'France',
                      imageUrl: 'assets/paris.jpg',
                    ),
                    DestinationCard(
                      city: 'Bali',
                      country: 'Indonesia',
                      imageUrl: 'assets/bali.jpg',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChipItem extends StatelessWidget {
  final IconData icon;
  final String title;
  const ChipItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: const Color(0xFFA3BFF3)),
              shape: BoxShape.circle,
              color: Colors.white),
          padding: const EdgeInsets.all(15),
          child: Icon(
            icon,
            color: const Color(0xFF346AD2),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(title),
      ],
    );
  }
}

class DestinationCard extends StatelessWidget {
  final String imageUrl;
  final String country;
  final String city;
  const DestinationCard(
      {super.key,
      required this.imageUrl,
      required this.country,
      required this.city});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      width: 150,
      child: GridTile(
        footer: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          // color: Colors.white,
          child: ListTile(
            tileColor: Colors.white,
            title: Text(city),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(country),
                const Wrap(
                  children: [
                    Text('2.4'),
                    Icon(
                      Ionicons.star_sharp,
                      size: 16,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
