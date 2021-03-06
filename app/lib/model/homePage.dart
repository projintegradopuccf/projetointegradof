import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
 

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(

      body: SafeArea(

        child: 
            Container(

              color: Color(0xff40435B),
             
              child: Column(
                children:[

                   Container(

                    height:700,
                    width: 500,
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                    children:[

                      Container(
                        height: 200,
                        width: 300,
                        decoration: new BoxDecoration(
                          image: DecorationImage(
                            image: new AssetImage('lib/assets/Logo.png'),
                            fit: BoxFit.fitWidth
                          )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 150),
                      ),

                      Container(
                        height: 40,
                        width: 150,
                        color: Color(0xff818BEC),
                        child: 
                        Center(
                          child: Text('Entrar',
                            style: TextStyle(

                              fontSize: 14,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                      ),

                      Padding(

                        padding: EdgeInsets.only(top: 100.0)                  
                      ),

                      Container(
                        
                        height: 40,
                        width: 150,
                        color: Color(0xff818BEC),
                        child: 
                        Center(
                          child: Text('Registrar',
                            style: TextStyle(

                              fontSize: 14,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                      )
                    ]
                  ),
                ) 
              ],
            ),
          ),               
      )
    );
  }
}