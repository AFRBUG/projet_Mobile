import 'package:flutter/material.dart';
import  'package:make_it_easy/widgets/input_decoration.dart' ;


/**
 * @author Afli Ramzi && Wissem matoussi
 * @noteapi  vous pouvez cree  un compte ici
 */

class Singin extends StatefulWidget {
  const Singin({Key? key}) : super(key: key);
  @override
  _SinginState createState() => _SinginState();
}

class _SinginState extends State<Singin> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height ;
    final width=MediaQuery.of(context).size.width ;
    return Scaffold(
      body:SingleChildScrollView(
        child: Center(
          child: Stack(
              children:[
                SizedBox(
                  height: height,
                  width: width,

                ),
                Positioned(
                  top: 8,
                  left: 40,
                  right: 40,
                  child: Container(
                    height: height/2.5,
                    width: width/2,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/logo.png"),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(120)
                        )
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  right: 10,
                  top: 210,
                  child: Container(
                    height: height/1.2,
                    width: width/2,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)
                        )
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                              child: TextField(
                                  decoration: buildInputDecoration(Icons.account_circle ,"Full  Name")
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                              child: TextField(
                                  decoration: buildInputDecoration( Icons.email ,"Email")
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                              child: TextField(
                                  decoration:  buildInputDecoration(Icons.password,"Password")
                              ),
                            ),
                            Padding(
                              padding:  const EdgeInsets.fromLTRB(20, 40, 20, 0),
                              child: TextField(
                                  obscureText: true,
                                  decoration: buildInputDecoration(Icons.password," Confirm Password")
                              ),
                            ),
                            Padding(padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                              child: Container(
                                height: height / 18,
                                width: width / 2,
                                decoration: BoxDecoration(
                                    color:Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Create',
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
