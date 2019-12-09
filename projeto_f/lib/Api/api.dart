import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer';



  
  

  Future<List> getData() async{

    final String url = "https://10.0.2.2:8080/products";
    Map<String, int> contador = Map<String, int>();
    List<String> aux1 = List<String>();
    List<String> aux2 = List<String>();

      print('isgadihashdasdksnkasndka');

      http.get(Uri.parse(url)).then((result){
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
    
    return aux1;
       
  }



Future <bool> login(String usuario, String senha) async{

  var data = {"email": usuario, "password": senha};
  var body = json.encode(data);

  final response=
      await http.post('https://api-projintegradof.herokuapp.com/signin', body: body, headers: {"Content-Type": "application/json"});

  print(response.statusCode);
  if(response.statusCode==200){// If the call to the server was successful, parse the JSON.
    return true;
  }
  else{// If that call was not successful, throw an error.
    return false;
  }
}

Future<bool> singup(String email, String senha)async{

  var data = {"email": email, "password": senha};
  var body = json.encode(data);

  final response=
      await http.post('https://api-projintegradof.herokuapp.com/signup', body: body, headers: {"Content-Type": "application/json"});

  print(response.statusCode);
  if(response.statusCode==200){// If the call to the server was successful, parse the JSON.
    return true;
  }
  else{// If that call was not successful, throw an error.
    return false;
  }
}

Future<List<Produto>> getProdutos() async{
  final response=
    await http.get('https://api-projintegradof.herokuapp.com/products');

  if(response.statusCode==200){// If the call to the server was successful, parse the JSON.
    var produtos = json.decode(response.body);
    List<Produto> prodList = new List(produtos.length);
    for(var i = 0; i< produtos.length; i++){
      prodList[i] = (Produto.fromJson(json.decode(response.body)[i]));
    }
    return prodList;
  }
  else{// If that call was not successful, throw an error.
    throw Exception('Erro ao buscar produtos');
  }
}

  class Produto{
    final String uid;
    final String id;
    final String nome;

  Produto({this.uid, this.id, this.nome,});
    factory Produto.fromJson(Map<String, dynamic> json){
    return Produto(
        id:json['product_id'],
        nome:json['product_category_name'],
       
    );
  }
}



Future<List<Avaliacao>> getReview() async{
  final response=
    await http.get('https://api-projintegradof.herokuapp.com/reviews');

  if(response.statusCode==200){// If the call to the server was successful, parse the JSON.
    var produtos = json.decode(response.body);
    List<Avaliacao> prodList = new List(produtos.length);
    for(var i = 0; i< produtos.length; i++){
      prodList[i] = (Avaliacao.fromJson(json.decode(response.body)[i]));
    }
    return prodList;
  }
  else{// If that call was not successful, throw an error.
    throw Exception('Erro ao buscar produtos');
  }
}

  class Avaliacao{

    final String review;
    final String id;
    final String orderId;
    final String rating;

  Avaliacao({ this.review, this.id, this.orderId, this.rating});
    factory Avaliacao.fromJson(Map<String, dynamic> json){
    return Avaliacao(
        review:json['review_comment_message'],
        id:json['review_id'],
        orderId:json['order_id'],
        rating:json['review_score']
       
    );
  }
}

Future<List<Customer>> getCustomer() async{
  final response=
    await http.get('https://api-projintegradof.herokuapp.com/customers');

  if(response.statusCode==200){// If the call to the server was successful, parse the JSON.
    var produtos = json.decode(response.body);
    List<Customer> prodList = new List(produtos.length);
    for(var i = 0; i< produtos.length; i++){
      prodList[i] = (Customer.fromJson(json.decode(response.body)[i]));
    }
    return prodList;
  }
  else{// If that call was not successful, throw an error.
    throw Exception('Erro ao buscar produtos');
  }
}

  class Customer{
    final String state;
    final String city;
    final String id;

  Customer({this.state, this.city,this.id});
    factory Customer.fromJson(Map<String, dynamic> json){
    return Customer(
        city:json['customer_city'],
        state:json['customer_state'],
        id: json['customer_unique_id']

       
    );
  }
}


Future<List<Payment>> getPayment() async{
  final response=
    await http.get('https://api-projintegradof.herokuapp.com/payments');

  if(response.statusCode==200){// If the call to the server was successful, parse the JSON.
    var produtos = json.decode(response.body);
    List<Payment> prodList = new List(produtos.length);
    for(var i = 0; i< produtos.length; i++){
      prodList[i] = (Payment.fromJson(json.decode(response.body)[i]));
    }
    return prodList;
  }
  else{// If that call was not successful, throw an error.
    throw Exception('Erro ao buscar produtos');
  }
}

  class Payment{
    final String type;
    final String value;
    final String installments;

  Payment({this.type, this.value, this.installments});
    factory Payment.fromJson(Map<String, dynamic> json){
    return Payment(

        type:json['payment_type'],       
        value: json['payment_value'],
        installments: json['payment_installments']
    );
  }
}

Future<List<Order>> getOrder() async{
  final response=
    await http.get('https://api-projintegradof.herokuapp.com/orders');

  if(response.statusCode==200){// If the call to the server was successful, parse the JSON.
    var produtos = json.decode(response.body);
    List<Order> prodList = new List(produtos.length);
    for(var i = 0; i< produtos.length; i++){
      prodList[i] = (Order.fromJson(json.decode(response.body)[i]));
    }
    return prodList;
  }
  else{// If that call was not successful, throw an error.
    throw Exception('Erro ao buscar produtos');
  }
}

  class Order{
    final String date;
    final String id;
    final String customerId;

  Order({this.date, this.id, this.customerId});
    factory Order.fromJson(Map<String, dynamic> json){
    return Order(

        date:json['order_purchase_timestamp'],  
        id:json['order_id'],
        customerId: json['customer_id']    
    );
  }
}


Future<List<Seller>> getSeller() async{
  final response=
    await http.get('https://api-projintegradof.herokuapp.com/sellers');

  if(response.statusCode==200){// If the call to the server was successful, parse the JSON.
    var produtos = json.decode(response.body);
    List<Seller> prodList = new List(produtos.length);
    for(var i = 0; i< produtos.length; i++){
      prodList[i] = (Seller.fromJson(json.decode(response.body)[i]));
    }
    return prodList;
  }
  else{// If that call was not successful, throw an error.
    throw Exception('Erro ao buscar produtos');
  }
}

  class Seller{
    final String city;
    final String state;
    final String id;

  Seller({this.city, this.state, this.id});
    factory Seller.fromJson(Map<String, dynamic> json){
    return Seller(

        city:json['seller_city'],       
        state:json['seller_state'],
        id: json['seller_id']
    );
  }
}