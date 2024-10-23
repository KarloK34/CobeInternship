import 'package:flutter/material.dart';
import 'package:profile_photo/profile_photo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
            child: Column(
          children: [
            MyAppBar(),
            MySearchBar(),
            Chips(),
            Expanded(
                child: ListView(
              padding: EdgeInsets.all(8),
              children: [
                UserContainer(),
                SizedBox(
                  height: 20,
                ),
                UserContainer(),
                SizedBox(
                  height: 20,
                ),
                UserContainer(),
                SizedBox(
                  height: 20,
                ),
                UserContainer(),
                SizedBox(
                  height: 20,
                ),
                UserContainer()
              ],
            ))
          ],
        )),
      ),
    );
  }
}

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: SearchBar(
        leading: const Icon(
          Icons.search,
          color: Colors.black,
        ),
        hintText: 'Search...',
        backgroundColor: const WidgetStatePropertyAll(Colors.white),
        shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}

class UserContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      height: 100,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProfilePhoto(
              totalWidth: 70,
              cornerRadius: 80,
              color: Colors.blue,
              image: const AssetImage('assets/profile_picture.jpg'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name and Surname',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text('Text here'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Chips extends StatelessWidget {
  final List<String> chipLabels = [
    'Offline',
    'Online',
    'Parental',
    'Sick',
    'Something'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: chipLabels.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Chip(
                label: Text(chipLabels[index]),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            );
          }),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfilePhoto(
          totalWidth: 70,
          cornerRadius: 80,
          color: Colors.blue,
          image: const AssetImage('assets/profile_picture.jpg'),
        ),
        const SizedBox(
          width: 30,
        ),
        const Expanded(
          child: Text(
            'Home',
            style: TextStyle(fontSize: 30),
          ),
        ),
        RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.white,
          padding: const EdgeInsets.all(14.0),
          shape: const CircleBorder(),
          child: Icon(
            Icons.calendar_month,
            size: 25.0,
            color: Colors.black,
          ),
        ),
        RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.white,
          padding: const EdgeInsets.all(14.0),
          shape: const CircleBorder(),
          child: Icon(
            Icons.notifications,
            size: 25.0,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
