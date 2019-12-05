import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:projeto_f/model/menu.dart';
import 'package:projeto_f/Api/api.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key, this.title, @required this.url, @required this.name}) : super(key: key);

  final String title;
  final String url;
  final String name;

  @override
  FirstPageState createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {

  final GlobalKey<FormBuilderState> formFields = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(

      body: SafeArea(

        child: 
            Container(
              
              color: Color(0xff40435B),
             
              child: ListView(
                children:[

                   Container(

                    color: Colors.transparent,

                    child: Column(

                      crossAxisAlignment:CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                    children:[

                      Container(
                        height: 100,
                        color: Color(0xff353748),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:[
                            GestureDetector(
                              child: Container(
                                child: Align(

                                  child: Icon(
                                    Icons.menu,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onTap: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
                              },
                            ),
                            
                            Image(
                              image:ExactAssetImage(
                                'lib/assets/Logo.png',
                              ),
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 50),
                      ),

                      Container(

                        child: Text(widget.name,
                          style: TextStyle(
                            color: Color(0xff818BEC),
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),

                      Padding(

                        padding: EdgeInsets.only(top: 20),

                      ),
                      Container(

                        height: 200,
                        //width: 200,
                        child: ListView(
                          children:[
                            Container(
                              height: 400,
                              child: WebView(
                                initialUrl: widget.url,
                                javascriptMode: JavascriptMode.unrestricted,
                              ),
                            ),
                          ],
                        )
                      ),



                      Padding(
                        padding: EdgeInsets.only(top: 50),
                      ),

                      Container(
                        child: Text('OUTROS DADOS',
                          style: TextStyle(

                            color: Color(0xff818BEC),
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 300,
                        /*decoration: BoxDecoration(
                          
                          image: DecorationImage(
                          
                            image: ExactAssetImage('lib/assets/image_3.png')
                          )
                        ),*/
                        
                      )
                    ]
                  ),
                ),
                ]
              )
            )
      )
    );
  }
}