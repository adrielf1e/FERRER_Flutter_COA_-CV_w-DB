import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

// ignore: camel_case_types
class skillpage extends StatelessWidget {
  const skillpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(50.0),
        child: Column(
          children: [
            AchievementTile(
              icon: LineIcons.pizzaSlice,
              title: 'Culinary Skills',
              description: 'Home Cooking',
            ),
            SizedBox(height: 16),
            Divider(),
            AchievementTile(
              icon: LineIcons.winkingFaceWithTongue,
              title: 'Dancing Skills',
              description: 'Boogie Wonderland',
            ),
            SizedBox(height: 16),
            Divider(),
            AchievementTile(
              icon: LineIcons.alternateMicrophone,
              title: 'Singing Skills',
              description: 'Karaoke Battle!',
            ),
            SizedBox(height: 16),
            Divider(),
            AchievementTile(
              icon: LineIcons.biking,
              title: 'Cycling Skills',
              description: 'Bicycle ko Brrr!',
            ),
            SizedBox(height: 16),
            Divider(),
            AchievementTile(
              icon: LineIcons.bookReader,
              title: 'Narration Skills',
              description: 'I love Reading Books!',
            ),
          ],
        ),
      ),
    );
  }
}

class AchievementTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const AchievementTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 40, color: Colors.grey),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                    fontSize: 20,
                  )),
              const SizedBox(height: 4),
              Text(description),
            ],
          ),
        ),
      ],
    );
  }
}
