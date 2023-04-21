import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextInput extends StatefulWidget {
  final TextEditingController
      controller; // A controller Object to retrieve the input value

  bool isValid = false; // A variable to check if the value of input is valid

  final String text; // The text to show besides the TextField

  final Color color;

  // Component's constructor
  TextInput(
      {super.key,
      required this.text,
      required this.controller,
      required this.isValid,
      required this.color});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  // A local variable to store the error to show corresponding to user's input
  String? _errorText;
  bool _isError = false;

  bool divisiblePar7(int n) {
    if (n ~/ 10 == 0) {
      return n % 7 == 0;
    } else {
      int u = n % 10;
      int a = n ~/ 10;
      int r = (a - 2 * u).abs();
      return divisiblePar7(r);
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(_isError.toString());
    // Add some padding to the component
    return TextField(
      // The TextField controller that comes from the constructor
      // to retrieve user's input
      controller: widget.controller,

      // Style of the text inside the TextField
      style: const TextStyle(
        fontSize: 18,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),

      // Set Cursor's color
      cursorColor: widget.color,

      // Styme of the TextField
      decoration: InputDecoration(
        // Set the label text
        labelText: widget.text,

        // Se
        floatingLabelStyle: _isError
            ? const TextStyle(color: Color(0xffe63946))
            : TextStyle(color: widget.color),

        errorText: _errorText,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: widget.color, width: 2)),

        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.color, width: 2)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.color, width: 2)),
        labelStyle: TextStyle(color: widget.color),
        errorStyle: const TextStyle(color: Color(0xffe63946)),
        constraints: const BoxConstraints(minHeight: 30),
        contentPadding: const EdgeInsets.all(10),
      ),

      onChanged: (text) {
        if (text == "") {
          _errorText = "n ne peut pas etre vide!";
          widget.isValid = false;
        } else if (int.tryParse(text) == null) {
          _errorText = "n doit etre un entier";
          widget.isValid = false;
        } else if (int.parse(text) < 100 || int.parse(text) > 1000) {
          _errorText = "n doit etre entre 100 et 1000";
          widget.isValid = false;
        } else if (divisiblePar7(int.parse(text)) == false) {
          _errorText = "n doit etre divisible par 7";
          widget.isValid = false;
        } else {
          _errorText = null;
          widget.isValid = true;
        }
        _isError = !widget.isValid;
        setState(() {});
      },
    );
  }
}
