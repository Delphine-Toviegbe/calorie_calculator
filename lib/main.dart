import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
MaterialColor  primary_color1 = Colors.pink;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //MaterialColor primary_color1 =Colors.pink;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primary_color1,
      ),
      home: const MyHomePage(title: 'Calorie calculation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MaterialColor primary_color2 =Colors.pink;
  bool interrupteur=false;
  DateTime? date;
  int? age;
  double sliderDouble=0.0;
  String changed= "Delphe";
  String submited="Delphe";
  int? itemSelection;

  List <String> sport=["Faible", "Moderne", "Forte"];

  //set primary_color1(MaterialColor primary_color1) {}

  List<Widget> radios(){
    List<Widget> l=[];
    for(int x=0; x<3; x++){
      Column column =Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [
          Radio(
              value: x,
              groupValue: itemSelection,
              onChanged: (int? i){
                setState(() {
                  itemSelection=i!;
                });
              },
            activeColor: primary_color2,
              ),
          Text(sport[x], style: TextStyle(color: primary_color2),)
        ],
      );
      l.add(column);
    }
    return l;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              //width: MediaQuery.of(context).size.width*0.9,
              padding: EdgeInsets.all(8.0),
              child: Text("Remplissez tous les champs pour obtenir votre besoin journalier en calorie", textAlign: TextAlign.center,textScaleFactor: 1.2,),
            ),
            SizedBox(
             width: MediaQuery.of(context).size.width*0.88,
             height: MediaQuery.of(context).size.height*0.6,
             child: Card(
               elevation: 2.5,
               child:  Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                 children: <Widget>[
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children:<Widget> [
                       Text("Femme", style: TextStyle(color: Colors.pink),),
                       Switch(
                           value: interrupteur,
                           inactiveTrackColor: Colors.pink,
                           activeColor: Colors.blue,
                           onChanged: (bool b){
                             setState(() {
                               interrupteur=b;
                               primary_color2=Colors.blue;
                               primary_color1=Colors.blue;
                             });
                           }
                       ),
                       Text("Homme", style: TextStyle(color: Colors.blue),),
                     ],
                   ),
                   TextButton(
                     onPressed: showDate,
                     child: Text((date==null)? 'Appuyez pour entrer votre âge': "Vous avez "+age.toString()+" ans"),
                     style: ButtonStyle(
                       foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                       backgroundColor: MaterialStateProperty.all<Color>(primary_color2),
                     ),
                   ),
                   Text("Votre taille est de : $sliderDouble cm.", style: TextStyle(color: primary_color2),),
                   Slider(
                       value: sliderDouble,
                       activeColor: primary_color2,
                       //min: 100.0,
                       max: 215,
                       onChanged: (double d){
                         setState(() {
                           sliderDouble=d;
                         });
                       }
                       ),
                   Container(
                     width: MediaQuery.of(context).size.width*0.75,
                     child: TextField(
                       keyboardType: TextInputType.number,
                       onChanged: (String string){
                         setState(() {
                           changed=string;
                         });
                       },
                       onSubmitted: (String string){
                         setState(() {
                           submited=string;
                         });
                       },
                       decoration: InputDecoration(
                           labelText: 'Entrez votre poids en kilogramme',
                           hintText: "votre poids"
                       ),
                     ),
                   ),
                   Container(
                     width: MediaQuery.of(context).size.width*0.6,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children:<Widget> [
                         Text("Quelle est votre activité sportive ?", style: TextStyle(color: primary_color2),),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: radios(),
                         )
                       ],
                     ),
                   )
                 ],
               )
             ),
           ),
            TextButton(
                onPressed: (){

                },
                child: Text("Calculer"),
                style: TextButton.styleFrom(
                  backgroundColor: primary_color2,
                  primary: Colors.white,
                  minimumSize: Size(88, 36),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                )
            )
          ],
        ),
    );
  }

  Future<Null> showDate() async{
    DateTime? choix = await showDatePicker(
        context: context,
        initialDatePickerMode: DatePickerMode.year,
        initialDate: DateTime.now(),
        firstDate: DateTime(1920),
        lastDate: DateTime(2023),
    );
    if(choix !=null){
      setState(() {
        date=choix;
        age=2022-choix.year;
      });
    }
  }
}
