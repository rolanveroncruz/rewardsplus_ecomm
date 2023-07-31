import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final int maxLines;
  final bool obscureText;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      this.maxLines = 1});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool isSuffixIconVisible = false;

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
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            suffixIcon: isSuffixIconVisible
                ? IconButton(
                    onPressed: widget.controller.clear,
                    icon: const Icon(Icons.clear),
                  )
                : null,
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
}
