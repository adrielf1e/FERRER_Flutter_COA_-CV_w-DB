import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Resume',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyResume(),
    );
  }
}

class MyResume extends StatelessWidget {
  const MyResume({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'My CVTae',
            style: TextStyle(color: Colors.amberAccent),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('images/cupcake.jpeg'),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Adriel Anthony Ferrer',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Cyber Security Technician',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 20.0),
              const Divider(),
              const Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('Email: adrielferrer15@gmail.com'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Phone: (639) 09184859602'),
                    ),
                    Divider(),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.linkedin),
                      title: Text('adrielf1e'),
                    ),
                    Divider(),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.github),
                      title: Text('adrielf1e'),
                    ),
                    Divider(),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Summary:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'A brief summary of your skills and experience.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: GNav(
            rippleColor: Colors.grey, // tab button ripple color when pressed
            hoverColor: Colors.grey, // tab button hover color
            haptic: true, // haptic feedback
            tabBorderRadius: 20,
            tabActiveBorder: Border.all(
                color: Colors.amberAccent, width: 1), // tab button border
            tabBorder: Border.all(
                color: Colors.blueGrey, width: 1), // tab button border
            tabShadow: [
              BoxShadow(color: Colors.blueGrey.withOpacity(1), blurRadius: 0)
            ], // tab button shadow
            curve: Curves.easeOutExpo, // tab animation curves
            duration:
                const Duration(milliseconds: 200), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: Colors.white, // unselected icon color
            activeColor: Colors.white70, // selected icon and text color
            iconSize: 35, // tab button icon size
            tabBackgroundColor: Colors.orangeAccent
                .withOpacity(0.1), // selected tab background color
            padding: const EdgeInsets.symmetric(
                horizontal: 25, vertical: 5), // navigation bar padding
            tabs: const [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.heart,
                text: 'Likes',
              ),
              GButton(
                icon: LineIcons.search,
                text: 'Search',
              ),
            ]));
  }
}
