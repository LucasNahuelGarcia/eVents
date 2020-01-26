import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'navBar.dart';
import 'cardEvento.dart';
import '../globalData/user.dart' as userData;

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "eVents",
          textScaleFactor: 1.5,
        ),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.search),
            onPressed: () => {
              Navigator.pushNamed(context, "/crearEvento"),
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal:20,vertical: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: FloatingNavBar(),
        ),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.lighten,
                  color: Theme.of(context).buttonColor),
              child: Text(
                userData.userName ?? "<nombre>",
                textScaleFactor: 1.5,
              ),
              curve: Curves.easeInOutExpo,
              duration: Duration(seconds: 1),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int i) {
          String desc = "";
          for(int n = 100; n < 250; n++)
            desc = desc + String.fromCharCode(n);
          return CardEvento("titulo $i", desc, "$i");
        },
        
      ),
    );
  }
}