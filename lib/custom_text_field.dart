import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final TextEditingController? textEditingController;
  final String placeholderText;
  final void Function(String)? onChange;

  const CustomTextField({
    this.textEditingController,
    super.key,
    required this.placeholderText,
    this.onChange,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      onChanged: widget.onChange,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        enabled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        filled: true,
        hintText: widget.placeholderText,
        hintStyle: const TextStyle(
            color: Color.fromARGB(255, 142, 142, 142),
            fontWeight: FontWeight.w500,
            fontSize: 14),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 177, 177, 177)),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 177, 177, 177)),
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
