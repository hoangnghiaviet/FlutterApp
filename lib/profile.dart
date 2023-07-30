import 'package:flutter/material.dart';
import 'package:my_app/Components/profile_section.dart';
import 'package:my_app/Components/title_bar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TitleBar(title: "Profile"),
          ProfileSection(title: "Full name", profileKey: "name", icon: Icons.person_outline),
          ProfileSection(title: "Phone number", profileKey: "phone", icon: Icons.phone_outlined),
          ProfileSection(title: "Email", profileKey: "email", icon: Icons.mail_outline),
          ProfileSection(title: "Address", profileKey: "address", icon: Icons.location_on_outlined),
        ],
      )
    );
  }
}