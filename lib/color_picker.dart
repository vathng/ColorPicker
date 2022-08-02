import 'package:flutter/material.dart';


class ColorPicker extends StatelessWidget {
  const ColorPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Color Picker")),
      body: SliderRange());
  }
}

class SliderRange extends StatefulWidget {
  const SliderRange({Key? key}) : super(key: key);

  @override
  State<SliderRange> createState() => _SliderRangeState();
}


class _SliderRangeState extends State<SliderRange> {

  double _currentSliderValueA = 0;
  double _currentSliderValueB = 0;
  double _currentSliderValueC = 0;
  Color _combinedColor = Color.fromARGB(100, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Slider(
          value: _currentSliderValueA,
          max: 255,
          label: _currentSliderValueA.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValueA = value;
              _combinedColor = Color.fromARGB(255, _currentSliderValueA.toInt(),
                  _currentSliderValueB.toInt(), _currentSliderValueC.toInt());
            });
          },
          activeColor: const Color.fromARGB(255, 255, 0, 0),
          inactiveColor: Colors.black12,
          thumbColor: Colors.black,
        ),
        Slider(
          value: _currentSliderValueB,
          max: 255,
          label: _currentSliderValueB.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValueB = value;
              _combinedColor = Color.fromARGB(255, _currentSliderValueA.toInt(),
                  _currentSliderValueB.toInt(), _currentSliderValueC.toInt());
            });
          },
          activeColor: const Color.fromARGB(255, 0, 255, 0),
          inactiveColor: Colors.black12,
          thumbColor: Colors.black,
        ),
        Slider(
          value: _currentSliderValueC,
          max: 255,
          label: _currentSliderValueC.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValueC = value;
              _combinedColor = Color.fromARGB(255, _currentSliderValueA.toInt(),
                  _currentSliderValueB.toInt(), _currentSliderValueC.toInt());
            });
          },
          activeColor: const Color.fromARGB(255, 0, 0, 255),
          inactiveColor: Colors.black12,
          thumbColor: Colors.black,
        ),
        Container(
          height: 150,
          width: 150,
          margin: EdgeInsets.all(50),
          decoration:
          BoxDecoration(color: _combinedColor, shape: BoxShape.circle),
        ),
        ElevatedButton(
            onPressed: () =>
            {
              Navigator.of(context).pop(),
              showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      AlertDialog(
                        content: Row(
                          children: [
                            Text("You have chosen "),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _combinedColor),
                            )
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                              onPressed: () => Navigator.pop(context, "OK"),
                              child: Text("OK"))
                        ],
                      ))
            },
            child: Text("Choose"))
      ],
    );
  }
}
