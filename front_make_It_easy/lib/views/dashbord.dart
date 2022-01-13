
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:make_it_easy/models/medication.dart';
import 'package:make_it_easy/models/services/backend_service.dart';
import 'package:make_it_easy/widgets/add_button.dart';
import 'package:make_it_easy/widgets/dashbord_component.dart';


/**
 * @auhor Afli Ramzi
 * @noteapi c'est le dashbord  ou vous pouvez visualiser tous vos medicaments aussi vous pouvez ajouter ou  bien modifier un  medicament
 */

class Dashbord extends StatefulWidget {
  const Dashbord({Key? key}) : super(key: key);

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {

 List <Medication> back_data=[];
 List data = [
   {"color": const  Color(0xffff6968)},
   {"color": const  Color(0xff7a54ff)},
   {"color": const  Color(0xffff8f61)},
   {"color": const  Color(0xff2ac3ff)},
   {"color": const  Color(0xff5a65ff)},
   {"color": const  Color(0xff96da45)},
   {"color": const  Color(0xffff6968)},
   {"color": const  Color(0xff7a54ff)},
   {"color": const  Color(0xffff8f61)},
   {"color": const  Color(0xff2ac3ff)},
   {"color": const  Color(0xff5a65ff)},
   {"color":const   Color(0xff96da45)},

 ];
  @override
      void initState()  {
    getAllMedication.call().then((value) =>
    back_data=value.cast()
    );
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;

    List medication;
    return Scaffold(
      backgroundColor: Colors.white70,
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blueGrey,
          index: 1,
          items: const  <Widget> [
            Icon(Icons.account_circle, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.settings, size: 30),
          ],
          onTap: (index) {
            if(index==0){ Navigator.pushNamed(context, "/profile") ; }            //Handle button tap
          },
        ),
      body:
      FutureBuilder(
      future: getAllMedication().then((value) => medication=value.cast()),
        builder:  (context,medications  ) {
          if (medications.hasError) print(medications.error);
          return medications.hasData ?
           Stack(
          children:[ Column(
          children: [
          Expanded(
          flex: 2,
          child: Container(
          child:Row(
          children: const [
          Padding(
          padding: EdgeInsets.fromLTRB(50 ,50,0,0),
          child: Icon(Icons.arrow_back ,color: Colors.white,
          ),
          ) ,
          Padding(
          padding: EdgeInsets.fromLTRB(80.0,50,0,0),
          child: Text("Schedule" ,style: TextStyle(color:Colors.white , fontSize: 30),),
          )
          ],
          ) ,
          width: double.infinity,
          decoration: const BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
          )
          ),
          ),
          ),

          Expanded(
                flex: 8,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: back_data.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return dashbordComponent(context ,data[index]["color"],back_data[index]);
                    }),
              ),
          ],
          ),
          const Padding(
          padding: EdgeInsets.fromLTRB(280,620,0,0),
          child: AddTodoButton()
          )
          ]
          ):const Center(
          child: CircularProgressIndicator(),
          );
        }
      )
    );

  }
}
