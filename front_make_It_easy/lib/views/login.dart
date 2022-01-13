
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:make_it_easy/widgets/input_decoration.dart' ;

/**
 * @author Bahri Med khalil
 * @noteapi ici  vous pouvez connecter
 */

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  color: Colors.white,
                ),
                Positioned(
                  top: 45,
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
                    top: 250,

                    child: Container(
                      height: height / 1.5,
                      width: width,
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 60, 10, 0),
                              child: TextField(
                                  decoration: buildInputDecoration( Icons.email ,"Email")
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
                              child: TextField(
                                  obscureText: true,
                                  decoration: buildInputDecoration(Icons.password,"Password")
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text('if you dont have account try  to',
                                    style: TextStyle(fontSize: 15,color: Colors.black
                                    ),),

                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/Sing');
                                    },
                                    child:const Text(
                                      'create account',
                                      style: TextStyle(
                                          color:Colors.blueGrey, fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Container(
                                height: height / 18,
                                width: width / 2,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context,'/dashboard');
                                    //your  migration to here
                                  },
                                  child: const Text('Login',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                )
              ]
          ),
        ),
      ),
    );
  }


}

