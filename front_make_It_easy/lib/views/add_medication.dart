import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:make_it_easy/models/medication.dart';
import 'package:make_it_easy/models/services/backend_service.dart';
import  'package:make_it_easy/widgets/input_decoration.dart' ;
import 'package:make_it_easy/widgets/button_image.dart';

/**
 * @author Bahri MedKhalil
 * @noteapi pour  ajouter  un medicament c'est  la partie Ui
 */


class AddMedication  extends StatefulWidget {
  const AddMedication ({Key? key}) : super(key: key);
  @override
  State<AddMedication> createState() => _AddMedicationState();
}

class _AddMedicationState extends State<AddMedication> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final  String type;

    TextEditingController nameEditingController = TextEditingController();
    TextEditingController descriptionEditingController = TextEditingController();


    @override
    void dispose() {
      descriptionEditingController.dispose();
      nameEditingController.dispose() ;
      super.dispose();
    }

    return Scaffold(
    backgroundColor: Colors.white70,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueGrey,
        items: const  <Widget> [
          Icon(Icons.account_circle, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: (index) {
          if(index==0){ Navigator.pushNamed(context, "/profile") ; }
          if(index==1){ Navigator.pushNamed(context, "/dashboard") ; }
          if(index==2){ Navigator.pushNamed(context, "routeName") ; }
          //Handle button tap
        },
      ),
      body:Stack(
          children:[ Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child:Row(
                    children:  const [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20 ,50,0,0),
                        child: Icon(Icons.arrow_back ,color: Colors.white,
                        ),
                      ) ,
                      Padding(
                        padding: EdgeInsets.fromLTRB(50.0,50,0,0),
                        child: Text("ADD Medication" ,style: TextStyle(color:Colors.white , fontSize: 30),),
                      )
                    ],
                  ) ,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                        bottomLeft:  Radius.circular(25),
                        bottomRight:  Radius.circular(25),
                      )
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: SingleChildScrollView(
                  child: Column(

                    children: [
                       const  SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ButtonImage(img:"assets/npill.png"),
                          ButtonImage(img:"assets/serum.png"),
                          ButtonImage(img:"assets/vaccin.png"),
                          ButtonImage(img:"assets/pill.png"),
                        ],
                      ),
                   Padding(
                        padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
                        child: TextField(
                            controller: nameEditingController,
                            decoration: buildInputDecoration(Icons.keyboard_arrow_down ,"Name of  Drug")
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                        child: TextField(
                            controller: descriptionEditingController ,
                            decoration:  buildInputDecoration(Icons.description ,"Some description")
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(90, 50, 90,0 ),
                      child: Container(
                        height: height /14,
                        width:width,
                        decoration: BoxDecoration(
                            color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                          onPressed: () {
                            String  name=nameEditingController.value.text   ;
                            String description=descriptionEditingController.value.text ;
                            Medication   medication=Medication(1,name,description,"[]") ;
                            createMedication(medication) ;
                            Navigator.pushNamed(context,"/dashboard");
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ),

                    ],
                  ),
                )
              ),
            ],
          ),

          ]
      )
    ) ;
  }
}
