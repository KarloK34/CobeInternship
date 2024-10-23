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
      floatingActionButton: Container(
        height: 54,
        width: 54,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Color(0xFFFC4402),
            foregroundColor: Colors.white,
            shape: CircleBorder(),
            onPressed: () {
              //TODO
            },
            child: Icon(
              Icons.add,
              size: 35,
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFFE9ECF4),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
            child: Column(
          children: [
            MyAppBar(),
            MySearchBar(),
            ChipBar(),
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
      child: Container(
        height: 48,
        child: SearchBar(
          leading: Container(
            height: 20,
            width: 20,
            child: const Icon(
              Icons.search,
              color: Color(0xFFBCC4DC),
            ),
          ),
          hintText: 'Search...',
          hintStyle: WidgetStatePropertyAll(TextStyle(
            fontFamily: 'FilsonPro',
            color: Color(0xFFBCC4DC),
            fontSize: 15,
            fontWeight: FontWeight.w400,
          )),
          backgroundColor: const WidgetStatePropertyAll(Colors.white),
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        ),
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
              totalWidth: 40,
              cornerRadius: 80,
              color: Colors.blue,
              image: const AssetImage('assets/profile_picture.jpeg'),
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

class ChipBar extends StatelessWidget {
  final List<String> chipLabels = [
    'Offline',
    'Online',
    'Parental',
    'Sick',
    'Vacation'
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
                backgroundColor: Color(0xFFE9ECF4),
                side: BorderSide(color: Color(0xFFBCC4DC)),
                label: Text(
                  chipLabels[index],
                  style: TextStyle(
                      color: Color(0xFFBCC4DC),
                      fontSize: 13,
                      fontFamily: 'FilsonPro'),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
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
    return Container(
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /*ProfilePhoto(
            totalWidth: 44,
            cornerRadius: 80,
            color: Colors.blue,
            image: const AssetImage('assets/profile_picture.jpeg'),
          )*/
          Container(
            height: 44.0,
            width: 44.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/profile_picture.jpeg'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const Expanded(
            child: Text(
              'Home',
              style: TextStyle(
                fontFamily: 'FilsonPro',
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF3D4766)),
            ),
          ),
          Container(
            height: 44,
            width: 44,
            child: RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Colors.white,
              shape: const CircleBorder(),
              child: Icon(
                Icons.calendar_month,
                size: 20.0,
                color: Color(0xFF3D4766),
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Container(
            height: 44,
            width: 44,
            child: RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Colors.white,
              shape: const CircleBorder(),
              child: Icon(
                Icons.notifications_none_outlined,
                size: 20.0,
                color: Color(0xFF3D4766),
              ),
            ),
          )
        ],
      ),
    );
  }
}
