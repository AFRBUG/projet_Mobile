import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:make_it_easy/models/user.dart';
import 'package:make_it_easy/models/user_preferences.dart';
import 'package:make_it_easy/widgets/appbar_widget.dart';
import 'package:make_it_easy/widgets/profile_widget.dart';
import 'package:make_it_easy/widgets/textfield_widget.dart';


/**
 * @author Imen Chihaoui
 * @noteapi  vous pouvez ici  ajuster quelques information  a propos vos compte
 *
 */
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(
    child: Builder(
      builder: (context) => Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          padding:  const EdgeInsets.symmetric(horizontal: 32),
          physics: const  BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: user.email,
              onChanged: (email) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'About',
              text: user.about,
              maxLines: 5,
              onChanged: (about) {},
            ),
          ],
        ),
      ),
    ),
  );
}