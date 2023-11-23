import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: camel_case_types
class infohome extends StatelessWidget {
  const infohome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              // <-- Added this Padding widget
              padding: EdgeInsets.only(
                  top: 50.0), // Adjust the value to your desired padding
              child: CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('images/cupcake.jpeg'),
              ),
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
                    title: Text('adrielferrer16@gmail.com'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('(+639) 184859602'),
                  ),
                  Divider(),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.linkedin),
                    title: Text('adrielferrer15@gmail.com'),
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
    );
  }
}
