import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:make_it_easy/models/medication.dart';


/**
 * @author Afli  Ramzi
 * @noteapi  methodes  pour  la communication avec  la  partie  backend
 */




Future   getAll( String  type) async{

  var url=Uri.parse("http://127.0.0.1:8000/api/user/type/${type}");
  var resrponse= await  http.get(url,
    headers: {
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*'
    },
  ) ;
  return resrponse.body ;
}




Map<String, dynamic> toJson(Medication medication) {
  List ScheduleList=[];
  //ScheduleList.add({medication.scheduleList}) ;

   return {
     'name': medication.name,
     'description': medication.description,
     'scheduleList': medication.scheduleList ,
   } ;
}

  Future<List> getAllMedication() async {
    var url = Uri.parse("http://10.0.2.2:8080/api/v1/medication/getall");
    var response = await http.get(
        url, headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*'
        },
    );
    if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body) as List ;
    List responseList=[] ;
    Medication medication ;
    jsonResponse.forEach((element) {
      Medication medication = Medication(element["id"], element["name"], element["description"], element["scheduleList"].toString());
      responseList.add(medication) ;
    });
    return responseList  as List ;
    } else {
    print('Request failed with status: ${response.statusCode}.');
    return [] ;
    }
    }



    Future createMedication(Medication medication ) async {
  print(convert.jsonEncode(toJson(medication)));
        var url = Uri.parse("http://10.0.2.2:8080/api/v1/medication/create");
        var  response = await http.post(url,headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*'
        },body: convert.jsonEncode(toJson(medication)) );
        if(response.statusCode!=200){
            return "something  geos  wrong" ;
        }
    }
    Future updateMedication(int id ,Medication medication ) async {
    var url =Uri.parse('http://10.0.2.2:8080/api/v1/medication/'+id.toString());
    var  response = await http.put(url,headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*'},
        body: toJson(medication) );
    if(response.statusCode!=0){
             return 'something  goes  wrong' ;
    }
    }


    Future deleteMedication(int id ) async {
        var url =Uri.parse('http://10.0.2.2:8080/api/v1/medication/'+id.toString());
        var response=await http.delete(url,headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*'},
        );
    }