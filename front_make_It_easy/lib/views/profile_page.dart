import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_it_easy/models/user.dart';
import 'package:make_it_easy/views/edit_profile_page.dart';
import 'package:make_it_easy/models/user_preferences.dart';
import 'package:make_it_easy/widgets/appbar_widget.dart';
import 'package:make_it_easy/widgets/button_widget.dart';
import 'package:make_it_easy/widgets/profile_widget.dart';

/**
 * @author Wissem Matoussi
 * @noteapi  ici vous pouvez acceder  pour  visitez vos compte
 *
 */
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user  = UserPreferences.myUser;

    return   ThemeSwitchingArea (
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>const EditProfilePage()),
                  );
                },
              ),
              const SizedBox(height: 24),
              buildName(user),
              const SizedBox(height: 24),
              Center(child: buildUpgradeButton()),
              const SizedBox(height: 24),
              //NumbersWidget(),
              const SizedBox(height: 48),
              Center(child: buildAbout(user)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        user.email,
        style: TextStyle(color: Colors.grey),
      )
    ],
  );

  Widget buildUpgradeButton() => ButtonWidget(
    text: 'Upgrade To PRO',
    onClicked: () {},
  );

  Widget buildAbout(User user) => Container(
    padding: const  EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: const Text(
            'About',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            user.about,
            style:  const TextStyle(fontSize: 20, height: 1.4),
          ),
        ),
      ],
    ),
  );
}