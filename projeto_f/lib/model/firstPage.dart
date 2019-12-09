import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:projeto_f/model/menu.dart';
import 'package:projeto_f/Api/api.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key, this.title, @required this.url, @required this.name, @required this.index, @required this.label}) : super(key: key);
//case 1 prod, case 2 review, case 3 customer, case 4 payment, case 5 pedido, case 6 seller 
  final String title;
  final String url;
  final String name;
  final int index;
  final String label;

  @override
  FirstPageState createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {

  final GlobalKey<FormBuilderState> formFields = GlobalKey<FormBuilderState>();
  Future<List<Produto>> prod;
  Future<List<Avaliacao>> rev;
  Future<List<Customer>> cus;
  Future<List<Payment>> pay;
  Future<List<Order>> date;
  Future<List<Seller>> seller;


  List<String> listaux = List<String>();

  @override
  void initState() {

    prod = getProdutos();
    rev = getReview();
    cus = getCustomer();
    pay = getPayment();
    date = getOrder();
    seller = getSeller();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(

      body: SafeArea(

        child: 
            Container(
              height: MediaQuery.of(context).size.height,
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
                        child: Text(widget.label,
                          style: TextStyle(

                            color: Color(0xff818BEC),
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                          height: 200,
                          /*decoration: BoxDecoration(
                            
                            image: DecorationImage(
                            
                              image: ExactAssetImage('lib/assets/image_3.png')
                            )
                          ),*/
                          
                          child: ListView(
                            //scrollDirection: Axis.horizontal,
                            children: [

                              getOther(widget.index)
                            ],
                          ),
                        ),    
                    ]
                  ),
                ),
                ]
              )
            )
      )
    );
  }

    void _showDialog(String i){

    showDialog(
      context: context,
      builder: (BuildContext context){

        return AlertDialog(

          title: Text('Item Adicionado'),
          content: Text('Produto: ' + i + ' foi adicionado'),
          actions: [
            FlatButton(
              child: Text('Fechar'),
              onPressed:(){ Navigator.of(context).pop();}
            )
          ],

        );
      }
    );
  }


  Widget getOther(int i){
    switch(i){
      case 1:{
        return FutureBuilder<List<Produto>>(
          future: prod,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
                  return
                    Column(
                      children:[
                        for(var i=0; i < snapshot.data.length; i++)
                        
                        Column(
                          children:[
                            Container(
                              padding: EdgeInsets.only(left: 20, top: 15, right: 20),
                              height: 50,
                              
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                    child: Text('Categoria: ' + snapshot.data[i].nome + '\nId: ' + snapshot.data[i].id,
                                    style: TextStyle(color: Colors.white),
                                    overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.white,)
                          ]
                        )
                      ]
                    );
              }
            else if (snapshot.hasError) {
                return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
        }
        );
    }
    break;

    case 2:{

      return FutureBuilder<List<Avaliacao>>(
          future: rev,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
                  return
                    Column(
                      children:[
                        for(var i=0; i < snapshot.data.length; i++)

                        Column(                        
                          children:[
                            Container(
                              padding: EdgeInsets.only(left: 20, top: 15, right: 20),
                              height: 80,
                          
                                child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                    child: Text('Id do Pedido: ' + snapshot.data[i].orderId + '\nId: ' + snapshot.data[i].id + '\nComentário: ' + snapshot.data[i].review + '\nNota: ' + snapshot.data[i].rating,
                                    style: TextStyle(color: Colors.white),
                                    overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.white,)
                          ]
                        )
                      ]
                    );
              }
            else if (snapshot.hasError) {
                return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
        }
        );
    }
    break;

    case 3: {
      return FutureBuilder<List<Customer>>(
          future: cus,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
                  return
                    Column(
                      children:[
                        for(var i=0; i < snapshot.data.length; i++)
                        Column(                        
                          children:[
                            Container(
                              padding: EdgeInsets.only(left: 20, top: 15,right: 20),
                              height: 80,
                          
                                child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                    child: Text('Id do Consumidor: ' + snapshot.data[i].id + '\nCidade: ' + snapshot.data[i].city + ' - Estado: ' + snapshot.data[i].state,
                                    style: TextStyle(color: Colors.white),
                                    overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.white,)
                          ]
                        )
                      ]
                    );
              }
            else if (snapshot.hasError) {
                return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
        }
        );
    }
    break;

    case 4:{

      return  FutureBuilder<List<Payment>>(
          future: pay,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
                  return
                    Column(
                      children:[
                        for(var i=0; i < snapshot.data.length; i++)
                        Column(                        
                          children:[
                            Container(
                              padding: EdgeInsets.only(left: 20, top: 15,right: 20),
                              height: 80,
                          
                                child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                    child: Text('Meio de Pagamento: ' + snapshot.data[i].type + '\nNúmero de Parcelas: ' + snapshot.data[i].installments + '\nValor: R\$' + snapshot.data[i].value,
                                    style: TextStyle(color: Colors.white),
                                    overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.white,)
                          ]
                        )
                      ]
                    );
              }
            else if (snapshot.hasError) {
                return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
        }
        );
    }
    break;

    case 5:{

      return  FutureBuilder<List<Order>>(
          future: date,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
                  return
                    Column(
                      children:[
                        for(var i=0; i < snapshot.data.length; i++)
                        Column(                        
                          children:[
                            Container(
                              padding: EdgeInsets.only(left: 20, top: 15,right: 20),
                              height: 80,
                          
                                child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                    child: Text('Id da Compra: ' + snapshot.data[i].id + '\nId do Consumidor: ' + snapshot.data[i].customerId + '\nData e Hora da Compra: ' + snapshot.data[i].date,
                                    style: TextStyle(color: Colors.white),
                                    overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.white,)
                          ]
                        )
                      ]
                    );
              }
            else if (snapshot.hasError) {
                return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
        }
        );      
    }
    break;
    
    case 6:{

      return  FutureBuilder<List<Seller>>(
          future: seller,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
                  return
                    Column(
                      children:[
                        for(var i=0; i < snapshot.data.length; i++)
                        Column(                        
                          children:[
                            Container(
                              padding: EdgeInsets.only(left: 20, top: 15,right: 20),
                              height: 50,
                          
                                child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                    child: Text('Id do Vendedor: ' + snapshot.data[i].id + '\nCidade do Vendedor: ' + snapshot.data[i].city + ' - ' + snapshot.data[i].state,
                                    style: TextStyle(color: Colors.white),
                                    overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.white,)
                          ]
                        )
                      ]
                    );
              }
            else if (snapshot.hasError) {
                return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
        }
        );     
    }
  }
  }
}