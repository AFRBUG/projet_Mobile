import 'package:flutter/material.dart';
import 'package:make_it_easy/models/medication.dart';
import 'package:make_it_easy/models/services/backend_service.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'custom_rect_tween.dart';
import 'hero_dialog_route.dart';
import 'package:make_it_easy/views/alarm_display.dart';


/**
 * @author Afli Ramzi &&  Med  khalil
 * @noteapi c'est la  button pour  ajouter  un medicament
 */
class AddTodoButton extends StatelessWidget {

  const AddTodoButton({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return const  _AddTodoPopupCard();
          }));
        },
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin !, end: end !);
          },
          child: Material(
            color: Colors.blueGrey,
            elevation: 2,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: const Icon(
              Icons.add_rounded,
              size: 56,
            ),
          ),
        ),
      ),
    );
  }
}
const String _heroAddTodo = 'add-todo-hero';



class _AddTodoPopupCard extends StatefulWidget {

  const _AddTodoPopupCard({Key ? key}) : super(key: key);

  @override
  State<_AddTodoPopupCard> createState() => _AddTodoPopupCardState();
}
String? _selectedTime;
 String ?  selectedDate ;
final nameController = TextEditingController();
final descriptionController=TextEditingController() ;
final scheduleController=TextEditingController() ;

class _AddTodoPopupCardState extends State<_AddTodoPopupCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin !, end: end !);
          },
          child: Material(
            color: Colors.blueGrey,
            elevation: 2,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Add Medication ',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight:FontWeight.bold),) ,
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                     TextField(
                      controller: nameController,
                      decoration:const  InputDecoration(
                        hintText: 'Name',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                      maxLines: 6,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),

                     TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        hintText: 'description',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                      maxLines: 6,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    TextButton(
                      onPressed: () {
                        _show();
                        _selectDate(context);
                      },
                      child:const  Icon(Icons.alarm,size: 40,),),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    TextButton(
                      onPressed: () {
                        String name=nameController.value.text;
                        String description=descriptionController.value.text ;
                        Medication medication= Medication(1, name, description,   _selectedTime!) ;
                        //FlutterAlarmClock.createAlarm(16,58 ) ;
                           if(_selectedTime![1]!=":"){
                          FlutterAlarmClock.createAlarm(timeConverter(_selectedTime!), int.parse(_selectedTime![3]+_selectedTime![4]));
                        }else{
                          int.parse(_selectedTime![0]);//mints
                          int.parse(_selectedTime![2]+_selectedTime![3]);
                          FlutterAlarmClock.createAlarm(timeConverter(_selectedTime!), int.parse(_selectedTime![2]+_selectedTime![3])) ;
                        }
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Reminder(medication: medication,);
                              },
                            ),
                          );

                        createMedication(medication) ;
                      // add Medication  methode must be  here
                        },
                      child: const Text('Add' ,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _show() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  alwaysUse24HourFormat: true),
              child: child!);
        });
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked.toString();
      });
    }
  }

}