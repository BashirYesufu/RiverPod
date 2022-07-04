import 'package:flutter/material.dart';

class RiverPodTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Function()? onTap;
  final bool readOnly;
  final String label;
  final int lines;
  final Color borderColor;
  final int? maxLength;
  final TextInputType? keyboard;

  const RiverPodTextField({
    this.controller,
    required this.label,
    this.lines = 1,
    this.readOnly = false,
    this.onTap,
    this.maxLength,
    this.borderColor = Colors.blue,
    this.keyboard = TextInputType.text,
    Key? key,
  }) : super(key: key);

  @override
  State<RiverPodTextField> createState() => _RiverPodTextFieldState();
}

class _RiverPodTextFieldState extends State<RiverPodTextField> {
  _RiverPodTextFieldState();

  bool _hasText = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        maxLines: widget.lines,
        maxLength: widget.maxLength,
        onTap: widget.onTap,
        keyboardType: widget.keyboard,
        readOnly: widget.readOnly,
        onChanged: (_){
          setState(() {
            int? length = 0;
            length = widget.controller?.text.length;
            if (length == 0) {
              _hasText = false;
            } else {
              _hasText = true;
            }
          });
        },
        controller: widget.controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15.0),
          labelText: widget.label,
          labelStyle: TextStyle(color: Colors.grey),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: _hasText
              ? InkWell(onTap: (){
            setState(() {
              widget.controller?.clear();
              _hasText = false;
            });
          }, child: Icon(Icons.clear, color: Colors.grey,),)
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0),),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}