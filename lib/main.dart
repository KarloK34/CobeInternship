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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: SearchBar(
                leading: const Icon(Icons.search, color: Colors.black,),
                hintText: 'Search...',
                
                backgroundColor: const WidgetStatePropertyAll(Colors.white),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              ),
            )
          ],
        )),
      ),
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
