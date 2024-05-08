import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Picker',
      home: ColorPickerScreen(),
    );
  }
}

class ColorPickerScreen extends StatefulWidget {
  @override
  _ColorPickerScreenState createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
  String _selectedColor = 'Choose a color';
  List<String> _colors = ['Choose a color', 'Blue', 'Red', 'Green'];
  Map<String, Color> _colorMap = {
    'Blue': Colors.blue,
    'Red': Colors.red,
    'Green': Colors.green,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Picker'),
      ),
      body: Container(
        color: _colorMap[_selectedColor],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton<String>(
                value: _selectedColor,
                items: _colors.map((String color) {
                  return DropdownMenuItem<String>(
                    value: color,
                    child: Text(color),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedColor = newValue!;
                    print('Selected color: $_selectedColor');
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
