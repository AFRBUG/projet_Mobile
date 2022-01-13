import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:make_it_easy/models/medication.dart';


/**
 * @author Afli Ramzi && Med Khalil  Bahri
 * @noteapi   c'est  la page  de  display  du Alarm partie Ui
 */

class Reminder extends StatefulWidget {
  final  Medication medication ;
  const Reminder({Key?  key  ,
  required this.medication,
 }) : super(key: key,);





  @override
  _ReminderState createState() => _ReminderState();
}


final FlutterTts flutterTts=FlutterTts() ;

class _ReminderState extends State<Reminder> {


  @override
  Widget build(BuildContext context) {
     Medication medication=super.widget.medication;
    _speak() async{
      await  flutterTts.setLanguage("fr-FR");
      await flutterTts.setPitch(1);
      await flutterTts.speak(medication.name);
    }
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex:1,
              child:Container(
                width: double.infinity,
                color:Colors.blueGrey,
                child: Padding(
                  padding: const  EdgeInsets.fromLTRB(0,100,0,0),
                  child: Center(child:  Container(
                    height:250 ,
                     width:350 ,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.45),
                              spreadRadius: 7,
                              blurRadius: 7,
                              offset:  const Offset(0, 7), // changes position of shadow
                            ),
                          ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                      child: Center(
                        child: Text("${DateTime.now().hour}:${DateTime.now().minute}", style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                  ),
                  ),
                ),
      )
          ),
          Expanded(

              flex:1,
              child:Container(
                width: double.infinity,
                color:Colors.blueGrey,
                child: Center(child:  Container(
                    height:250 ,
                    width:350 ,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 7,
                            blurRadius: 7,
                            offset: const Offset(0, 7), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    child: Center(child: Text("${medication.name}",
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
                ),
                ),
              )
          ),
        ],
      ),
    );
  }
}
