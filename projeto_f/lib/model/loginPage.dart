import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:projeto_f/Api/api.dart';
import 'package:projeto_f/model/firstPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title, this.reg}) : super(key: key);

  final bool reg;
  final String title;

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

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

                    height:200,
                    width: 500,
                    color: Colors.transparent,

                    child: Column(

                      crossAxisAlignment:CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                    children:[

                      GestureDetector(
                    
                        child: Container(
                          height: 200,
                          width: 300,
                          decoration: new BoxDecoration(
                            image: DecorationImage(
                              image: new AssetImage('lib/assets/Logo.png'),
                              fit: BoxFit.fitWidth
                            )
                          ),
                        ),
                        onTap:(){

                          Navigator.pop(context);
                        },
                      ),
                    ]
                  ),
                ),
                (widget.reg)?
                Container(
                  width: 300,
                  child: FormBuilder(
                    key: formFields,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          attribute: "name",
                          decoration: InputDecoration(labelText: "Nome",
                          labelStyle: TextStyle(color: Colors.white)
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        FormBuilderTextField(
                          attribute: "email",
                          decoration: InputDecoration(labelText: "Email",
                          labelStyle: TextStyle(color: Colors.white)
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        FormBuilderTextField(
                          attribute: "password",
                          decoration: InputDecoration(labelText: "Senha",
                          labelStyle: TextStyle(color: Colors.white)
                          ),
                          obscureText: true,
                          keyboardType: TextInputType.text,            

                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        FormBuilderTextField(
                          attribute: "cpf",
                          decoration: InputDecoration(labelText: "CPF",
                          labelStyle: TextStyle(color: Colors.white)
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    )
                  ),
                )
                
                :

                Container(
                  width: 300,
                  child: FormBuilder(
                    key: formFields,
                    child: Container(
                      height: 150,
                      child: Column(
                        children: [
                         
                          FormBuilderTextField(
                            attribute: "email",
                            decoration: InputDecoration(labelText: "Email",
                            labelStyle: TextStyle(color: Colors.white)
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                          ),
                          FormBuilderTextField(
                            attribute: "password",
                            decoration: InputDecoration(labelText: "Senha",
                            labelStyle: TextStyle(color: Colors.white)
                            ),              
                            obscureText: true,
                            keyboardType: TextInputType.text,            
                          ),
                          
                        ],
                      ),
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),

                (!widget.reg)?
                FlatButton(
                  
                  color: Color(0xffC4C4C4),
                  child: Text('Entrar'),
                  onPressed: ()async{

                    formFields.currentState.fields['email'].currentState.setValue(formFields.currentState.fields['email'].currentState.value.toString().trim());
                    formFields.currentState.fields['password'].currentState.setValue(formFields.currentState.fields['password'].currentState.value.toString().trim());
                    print(formFields.currentState.fields['email'].currentState.value);
                    print(formFields.currentState.fields['password'].currentState.value);

                    var res = await login(formFields.currentState.fields['email'].currentState.value, formFields.currentState.fields['password'].currentState.value);
                    
                    if(res){
                      
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage(name: 'Avaliação' ,url: 'https://charts.mongodb.com/charts-project-0-hipsp/embed/charts?id=f5c52d5a-740c-44b3-beba-5e5ad58e67a5&tenant=b9dcfd98-f9d0-4e1b-bd61-1684e4d51234',)));
                    }
                    
                    else{
                      
                      showDialog(
                              context: context,
                            builder: (BuildContext context){
                                return AlertDialog(
                                  title: new Text('Login error'),
                                  content: new Text('Wrong email or password.'),
                                    actions: <Widget>[
                                      new FlatButton(
                                        child: new Text("Close"),
                                                onPressed: () {
                                                Navigator.of(context).pop();

                                               
                                                },
                                        ),
                                    ],
                                );
                            }
                          );
                    }
                    
                  },
                )
                :
                FlatButton(
                  
                  color: Color(0xffC4C4C4),
                  child: Text('Cadastrar'),
                  onPressed: ()async{

                    formFields.currentState.fields['email'].currentState.setValue(formFields.currentState.fields['email'].currentState.value.toString().trim());
                    formFields.currentState.fields['password'].currentState.setValue(formFields.currentState.fields['password'].currentState.value.toString().trim());
                    var res = await login(formFields.currentState.fields['email'].currentState.value, formFields.currentState.fields['password'].currentState.value);
                    
                    if(res){

                      Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage(name: 'Avaliação' ,url: 'https://charts.mongodb.com/charts-project-0-hipsp/embed/charts?id=f5c52d5a-740c-44b3-beba-5e5ad58e67a5&tenant=b9dcfd98-f9d0-4e1b-bd61-1684e4d51234',)));
                    }
                    
                    else{
                      
                      showDialog(
                              context: context,
                            builder: (BuildContext context){
                                return AlertDialog(
                                  title: new Text('Login error'),
                                  content: new Text('Wrong email or password.'),
                                    actions: <Widget>[
                                      new FlatButton(
                                        child: new Text("Close"),
                                                onPressed: () {
                                                Navigator.of(context).pop();

                                                //redirect to loginPage
                                                Navigator.push(context, MaterialPageRoute(
                                                   builder: (context) => LoginPage()
                                                ));
                                                },
                                        ),
                                    ],
                                );
                            }
                          );
                    }
                    
                  },
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                )
              ],
            ),
          ),               
      )
    );
  }
}