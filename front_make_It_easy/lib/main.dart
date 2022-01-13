import 'package:flutter/material.dart';
import 'package:make_it_easy/views/edit_profile_page.dart';
import 'package:make_it_easy/views/login.dart';
import 'package:make_it_easy/views/profile_page.dart';
import 'package:make_it_easy/views/singin.dart';
import 'package:make_it_easy/views/add_medication.dart';
import 'package:make_it_easy/views/timesup.dart';
import  'package:make_it_easy/views/dashbord.dart' ;
import 'package:make_it_easy/views/welcomescreen.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';




/**
 * @author Bahri && Afli && Chiahoui && Matoussi
 * @noteapi all routes  are here
 */



ThemeData lightTheme = ThemeData.light();
ThemeData darkTheme = ThemeData.dark();

void main() {
  runApp(const Home());
}


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {


    return ThemeProvider(
      initTheme: lightTheme,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/':(ctx)=> const WelcomeScreen() ,
           '/Login':(ctx)=> const Login(),
          '/Sing':(ctx)=> const Singin(),
          '/dashboard' :(ctx) =>  const Dashbord() ,
          '/Add':(ctx)=> const AddMedication() ,
          '/timesup':(ctx) => const Alarme(),
          '/profile':(ctx)=> ProfilePage() ,
          '/editProfile':(ctx)=> const EditProfilePage(),
         // '/test':(ctx)=>  const Notifier() ,
         // '/Reminder':(ctx)=> const Reminder() ,

        },
      ),
    ) ;
  }
}
