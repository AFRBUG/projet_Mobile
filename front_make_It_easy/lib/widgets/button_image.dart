import 'package:flutter/material.dart';


/**
 * @author Imen chihaoui
 * @noteapi  c'est  les  buttons de type  medicament (pills ...)
 *
 */

class ButtonImage extends StatelessWidget {
       String ? img ;
   ButtonImage({
    Key? key,
    required this.img,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height ;
    final width =MediaQuery.of(context).size.width ;
    return Container(
      height: height/10,
      width: width/8,
      decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage("$img"),
            fit: BoxFit.fill,
          ),
          borderRadius:const BorderRadius.all(Radius.circular(80)
          )
      ),
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: (){
          //test() ;
        },
      ),
    );
  }
}
