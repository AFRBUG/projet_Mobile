import 'package:flutter/material.dart';




class Alarme extends StatefulWidget {
  const Alarme({Key? key}) : super(key: key);

  @override
  _AlarmeState createState() => _AlarmeState();
}

class _AlarmeState extends State<Alarme> {
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;


    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          leading: IconButton(
            icon:const  Icon(Icons.arrow_back_ios_sharp),
            color: Colors.black,
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const  Icon(
                Icons.cancel_outlined,
              ),
              color: Colors.black,
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child:  Container(
            child: Column(
              children: [
                SizedBox(
                  height: height/12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child:const  Text(
                        "Alarm",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height/25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text(
                        "14.00",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height/10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text(
                        "Dose 1",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height/20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width-20,
                      height: height/7,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width:width/15),
                          Container(
                            width: width/3.8,
                            child: Image.network(
                                "https://media.ouest-france.fr/v1/pictures/MjAyMTExOTMzMzI3NTkyZTRlZjRhNWE0ZmFhNTMyYTg4OTJjNjA?width=375&height=210&focuspoint=50%2C25&cropresize=1&client_id=bpeditorial&sign=2c63a24966ab8a052e340089fbe7ffe2950504560b20c9454ddf77026c4d60f3"),
                          ),
                          SizedBox(
                            width: width/15,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: height/100,
                              ),
                             const Text(
                                "Omega 3 ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height:height/20,
                              ),
                              Row(
                                children:  [
                                 const Text(
                                    "one tablet after meals",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    width: width/20,
                                  ),
                                   const Text(
                                    "7 days",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height/20,
                ),
                Container(
                  width: width/1.2,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdTr_cK7X9UO55Jo2i7SXC_MdD8fBvVqSzRA&usqp=CAU",
                    scale: 1,
                  ),
                ),
                Container(
                  width: width-20,
                  height: height/15,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/schedule');
                    },
                    child:const Text("Done",style: TextStyle(color: Colors.white),),
                    color: Colors.blue,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                ),
              const  SizedBox(height: 20,)
              ],
            ),
          ),
        ));
  }
}