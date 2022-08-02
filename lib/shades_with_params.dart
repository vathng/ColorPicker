import 'package:flutter/material.dart';
import'package:navigation_flutter/shades_page.dart';


    class ShadesWithParams extends StatelessWidget {
      const ShadesWithParams({Key? key}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        final data =
            ModalRoute.of(context)!.settings.arguments as MaterialAccentColor;
        return Container();
      }
    }
