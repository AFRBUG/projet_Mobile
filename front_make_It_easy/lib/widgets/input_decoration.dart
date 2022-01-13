import 'package:flutter/material.dart';


/**
 * @author  Wissem Matoussi && Afli Ramzi
 * @noteapi   customizing  the  input  fields pour  avoir un input field  sous une  forme  unique dans  notre application
 */

InputDecoration buildInputDecoration(IconData icons,String hinttext) {
  return InputDecoration(
    hintText: hinttext,
    prefixIcon: Icon(icons ,color: Colors.blueGrey,),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide:const  BorderSide(
          color: Colors.blue,
          width: 1.5
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide:const  BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
    enabledBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: const   BorderSide(
        color:Colors.blueGrey,
        width: 1.5,
      ),
    ),
  );
}