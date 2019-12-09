import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:projeto_f/model/firstPage.dart';

class Menu extends StatefulWidget {
  Menu({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {

  final GlobalKey<FormBuilderState> formFields = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(

      body: SafeArea(

        child: 
            Container(

              color: Color(0xff40435B),
             
              child: Column(
                
                children:[
                  
                  GestureDetector(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black
                        )
                      ),

                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                          ),
                          Icon(
                            Icons.person_outline,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                          ),
                          Center(
                            child: Text(
                              'Consumidores',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                              ),
                              )
                          ),
                        ],
                      ),
                    ),
                    onTap: (){

                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage(name:'Consumidores',url: 'https://charts.mongodb.com/charts-project-0-hipsp/embed/charts?id=f5c52d5a-740c-44b3-beba-5e5ad58e67a5&tenant=b9dcfd98-f9d0-4e1b-bd61-1684e4d51234', index: 3,label: "Cidade e Estado dos Consumidores",)));
                    },
                  ),

                  GestureDetector(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black
                        )
                      ),

                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                          ),
                          Icon(
                            Icons.place,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                          ),
                          Center(
                            child: Text(
                              'Geolocalização',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                              ),
                              )
                          ),
                        ],
                      ),
                    ),
                    onTap: (){
                      Navigator.pop(context);
                     Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage(name:'Geolocalização',url: 'https://charts.mongodb.com/charts-project-0-hipsp/embed/charts?id=105a1c7a-a31d-499f-87fe-7c2ecb97bd99&tenant=b9dcfd98-f9d0-4e1b-bd61-1684e4d51234', index: 3, label: "Estado dos pedidos",)));

                    },
                  ),
                                    
                  GestureDetector(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black
                        )
                      ),

                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                          ),
                          Icon(
                            Icons.credit_card,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                          ),
                          Center(
                            child: Text(
                              'Meios de Pagamento',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                              ),
                              )
                          ),
                        ],
                      ),
                    ),
                    onTap: (){
                     Navigator.pop(context);
                     Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage(name: 'Meios de Pagamento', url: 'https://charts.mongodb.com/charts-project-0-hipsp/embed/charts?id=db4a5a0a-5f0d-45ef-81f2-bdea2e07a5f7&tenant=b9dcfd98-f9d0-4e1b-bd61-1684e4d51234', index: 4, label: "Formas de Pagamentos",)));

                    },
                  ),

                  GestureDetector(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black
                        )
                      ),

                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                          ),
                          Icon(
                            Icons.star_border,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                          ),
                          Center(
                            child: Text(
                              'Avaliação',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                              ),
                              )
                          ),
                        ],
                      ),
                    ),
                    onTap: (){

                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage(name: 'Avaliação',url: 'https://charts.mongodb.com/charts-project-0-hipsp/embed/charts?id=f5c52d5a-740c-44b3-beba-5e5ad58e67a5&tenant=b9dcfd98-f9d0-4e1b-bd61-1684e4d51234', index: 2,label: "Comentários sobre os produtos",)));

                    },
                  ),

                  GestureDetector(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black
                        )
                      ),

                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                          ),
                          Icon(
                            Icons.local_offer,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                          ),
                          Center(
                            child: Text(
                              'Pedidos',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                              ),
                              )
                          ),
                        ],
                      ),
                    ),
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage(name:'Pedidos',url: 'https://charts.mongodb.com/charts-project-0-hipsp/embed/charts?id=105a1c7a-a31d-499f-87fe-7c2ecb97bd99&tenant=b9dcfd98-f9d0-4e1b-bd61-1684e4d51234', index: 5, label: "Data de Hora dos pedidos",)));

                    },
                  ),

                  GestureDetector(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black
                        )
                      ),

                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                          ),
                          Icon(
                            Icons.inbox,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                          ),
                          Center(
                            child: Text(
                              'Produtos',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                              ),
                              )
                          ),
                        ],
                      ),
                    ),
                    onTap: (){

                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage(name:'Produtos',url: 'https://charts.mongodb.com/charts-project-0-hipsp/embed/charts?id=efaef927-691a-4c56-b81a-4e613edcbf18&tenant=b9dcfd98-f9d0-4e1b-bd61-1684e4d51234', index: 1, label: "Categorias dos Produtos",)));
                    },
                  ),

                  GestureDetector(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black
                        )
                      ),

                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                          ),
                          Icon(
                            Icons.group,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                          ),
                          Center(
                            child: Text(
                              'Vendedores',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                              ),
                              )
                          ),
                        ],
                      ),
                    ),
                    onTap: (){
                   
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage(name:'Vendedores', url: 'https://charts.mongodb.com/charts-project-0-hipsp/embed/charts?id=80276554-f178-474f-b98e-59eb4709463d&tenant=b9dcfd98-f9d0-4e1b-bd61-1684e4d51234',index: 6, label: "Localização dos Vendedores",)));

                    },
                  ),             
                ]
              )
            )
      )
    );
  }
}