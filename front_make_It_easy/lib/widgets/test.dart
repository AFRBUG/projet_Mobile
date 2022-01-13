import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';


/**
 * @author Afli Ramzi &&  Bahri Med Khalil
 * @noteapi  Medication name reader  is here
 */

class MyReader extends StatefulWidget {
  const MyReader({Key? key}) : super(key: key);

  @override
  _MyReaderState createState() => _MyReaderState();
}

class _MyReaderState extends State<MyReader> {
   final FlutterTts flutterTts=FlutterTts() ;

  @override

  Widget build(BuildContext context) {
    _speak() async{
      await  flutterTts.setLanguage("fr-FR");
      await flutterTts.setPitch(1);
      await flutterTts.speak('hahaha');


    }
    return Container(

      alignment: Alignment.center,
      color: Colors.white,
      child: TextButton(
        child:  const Text("test  is test"),
        onPressed: (){
          _speak();
        },

      ),
    );
  }
}
