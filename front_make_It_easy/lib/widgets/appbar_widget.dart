import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_it_easy/widgets/themes.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

/**
 * @author Wissem  Matoussi
 * @noteapi  c'est  le  navbar de la  page dashbord
 */
AppBar buildAppBar(BuildContext context) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final icon = CupertinoIcons.moon_stars;
  return AppBar(
    leading:  const  BackButton(color: Colors.black,),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      ThemeSwitcher(
        builder: (context) => IconButton(
          icon: Icon(icon,color: Colors.black,),
          onPressed: () {
            final theme = isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;
            final switcher = ThemeSwitcher.of(context);
            switcher.changeTheme(theme: theme);
          },
        ),
      ),
    ],
  );
}