import 'package:flutter/material.dart';
import 'package:navigation_flutter/color_picker.dart';
import 'package:navigation_flutter/shades_page.dart';
import 'list_item.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void navigateToShadePageStatic(BuildContext context, MaterialAccentColor color) {
    Navigator.pushNamed(context, '/shades', arguments:color,);
  }


  void navigateToShadePage(BuildContext context, MaterialAccentColor color) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return ShadesPage(color: color,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text("Colors")),
        body: ListView.builder(
          itemCount: Colors.accents.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                navigateToShadePage(context, Colors.accents.elementAt(index),);
              },
              child: ListItem(
                color: Colors.accents.elementAt(index),
              ),
            );
          },
        ),
        floatingActionButton: Container(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context){
              return ColorPicker();
            }));},
            child: const Icon(Icons.brush, size: 40),
            backgroundColor: Theme.of(context).indicatorColor,
          ),
        ));
  }
}