import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final bool forPassword;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.forPassword,
      this.maxLines = 1, });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool isSuffixIconVisible = false;
  bool obscureText = false;

  @override
  initState(){
    obscureText = widget.forPassword;
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12)),
        child: TextField(
          onChanged: (value) {
            setState(() => value.isNotEmpty
                ? isSuffixIconVisible = true
                : isSuffixIconVisible = false);
          },
          controller: widget.controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            suffixIcon: widget.forPassword? iconForPasswordVisibility(): iconForReset(),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
                borderRadius: BorderRadius.circular(12)),
            hintText: widget.hintText,
            labelText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey.shade500),
            fillColor: Colors.grey.shade200,
            filled: true,
          ),
          maxLines: widget.maxLines,
        ),
      ),
    );
  }

  IconButton? iconForPasswordVisibility(){
    return obscureText? IconButton(
              icon: const Icon( Icons.visibility_off),
              onPressed:() { setState(() {
                obscureText = !obscureText;
              });}):
            IconButton(
              icon: const Icon(Icons.visibility),
              onPressed: (){ setState(() {
                obscureText = !obscureText;
              });});
  }

  IconButton? iconForReset(){
    return  isSuffixIconVisible? IconButton(
      onPressed: widget.controller.clear,
      icon: const Icon(Icons.clear),
    )
    : null;

  }
}
