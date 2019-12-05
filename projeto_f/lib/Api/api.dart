import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer';


/*class DataBDState extends State<DataBD>{
  
  final String url = "http://10.0.2.2:3333/products";
  List data;
  Map<String, int> contador = Map<String, int>();
  List<String> aux1 = List<String>();

  Future<String> getData() async{

      print('isgadihashdasdksnkasndka');

      _http.get(Uri.parse(url)).then((result){
      print(result);
      var aux = json.decode(result.body);
      int i = 0;


      aux.forEach((type){

        if(contador.containsKey(type['product_category_name'])){
          contador[type['product_category_name']] ++;
        }else{

          contador[type['product_category_name']] = 1;
        }
      });

      contador.forEach((categoria, total){
        aux1[i] = categoria ;
        i++;
        print(categoria + ' = ' + total.toString());
      });

    }).catchError((error) {

              print(error);
            });
    
    return "Success!";
       
      
  }*/


Future <bool> login(String usuario, String senha) async{

  var data = {"email": usuario, "password": senha};
  final response=
      await http.post('http://10.0.2.2:3333/singin/', body: data);

  print(response);
  if(response.statusCode==200){// If the call to the server was successful, parse the JSON.
    return true;
  }
  else{// If that call was not successful, throw an error.
    return false;
  }
}