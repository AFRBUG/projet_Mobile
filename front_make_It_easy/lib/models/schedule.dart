
import 'package:flutter/foundation.dart';

/**
* @author Afli  Ramzi
* @noteapi les  classes pour le  mapping
*/

class  Schedules  {
  @required DateTime _date=DateTime.now() ;
  @required int   _dosage =0 ;


  Schedule(DateTime date , int   dosage ) {
    this .date=date ;
    this.dosage=dosage ;
  }


  DateTime  get  date  =>_date ;
  int get  dosage => _dosage ;
  set date(DateTime dateTime) {
    _date=dateTime   ;
  }

  set   dosage (int dose  )
  {
     this._dosage=dose  ;
  }


}