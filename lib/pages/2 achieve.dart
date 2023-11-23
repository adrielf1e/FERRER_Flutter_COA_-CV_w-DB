import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

// ignore: camel_case_types
class achievepage extends StatelessWidget {
  const achievepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(50.0),
        child: Column(
          children: [
            AchievementTile(
              icon: LineIcons.school,
              title: 'Daniel Maramba National High School',
              description: 'Junior & Senior Graduate 2019-2020',
            ),
            SizedBox(height: 16),
            Divider(),
            AchievementTile(
              icon: LineIcons.school,
              title: 'Philippine College of Science and Technology',
              description:
                  'Bachelors of Science in Information Technology 2023-2024',
            ),
            SizedBox(height: 16),
            Divider(),
            AchievementTile(
              icon: LineIcons.certificate,
              title: 'CCNA Certified',
              description:
                  'Cisco Certificate in Cyber Security with specialty in Linux 2025',
            ),
            SizedBox(height: 16),
            Divider(),
            AchievementTile(
              icon: LineIcons.certificate,
              title: 'Star Achievement',
              description:
                  'You have earned a star for exceptional performance!',
            ),
            SizedBox(height: 16),
            Divider(),
            AchievementTile(
              icon: LineIcons.certificate,
              title: 'Unlocked Feature',
              description: 'You unlocked a new feature. Explore now!',
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
