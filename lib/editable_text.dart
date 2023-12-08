library editable_text;
import 'package:flutter/material.dart';

class EditableText extends StatefulWidget {
   const EditableText({super.key, required this.initialText, required this.onSubmitted,  this.style,  this.overflow,this.textDirection,this.textAlign,this.maxLine, this.onEditingComplete, this.onChanged, this.onTap, this.onTapOutside, this.inputDecoration });
  final String initialText;
  final TextStyle? style;
  final TextOverflow? overflow;
  final Function(String)? onSubmitted;
   final TextAlign? textAlign;
   final TextDirection? textDirection;
   final int? maxLine;
   final Function()? onEditingComplete;
   final Function(String)? onChanged;
   final Function()? onTap;
   final Function()? onTapOutside;
   final InputDecoration? inputDecoration;

   @override
  State<EditableText> createState() => _EditableTextState(initialText: initialText,onSubmitted: onSubmitted,style: style,overflow: overflow,textAlign: textAlign,textDirection: textDirection,maxLine:maxLine,onEditingComplete:this.onEditingComplete, onChanged:this.onChanged,onTap:this.onTap, inputDecoration:this.inputDecoration);
}

class _EditableTextState extends State<EditableText> {
  bool _isEditingText = false;
  late TextEditingController _editingController;
  String initialText;
  final TextStyle? style;
  final TextOverflow? overflow;
  int? maxLine;

   TextAlign? textAlign;
TextDirection? textDirection;

  final Function(String)? onSubmitted;
  final Function()? onEditingComplete;
  final Function(String)? onChanged;
  final Function()? onTap;
  final InputDecoration? inputDecoration;

  _EditableTextState( { this.style, this.overflow, required this.onSubmitted, required this.initialText,this.textAlign,this.textDirection,this.maxLine,this.onEditingComplete, this.onChanged, this.onTap, this.inputDecoration,});

  @override
  void initState() {
    _editingController = TextEditingController(text: initialText);
    super.initState();
  }
  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isEditingText ?  TextField(
      onSubmitted: (newValue){
        setState(() {
          initialText = newValue;
          _isEditingText =false;
          onSubmitted?.call(initialText);
        });
      },
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      decoration: inputDecoration,
      style: style,
      autofocus: true,
      controller: _editingController,
    ):InkWell(
        onTap: () {
          setState(() {
            _isEditingText = true;
          });
        },
        child: Text(
          initialText,
          style: style,
          overflow: overflow,
          textAlign: textAlign,
          textDirection: textDirection,
          maxLines: maxLine,
        ));
  }
}
