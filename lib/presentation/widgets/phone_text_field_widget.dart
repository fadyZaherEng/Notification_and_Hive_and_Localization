import 'package:flutter/material.dart';

class PhoneTextFieldWidget extends StatelessWidget {
  TextEditingController controller;
  void Function(String value)? onChanged;
  String? errorMSG;
  String text;
  PhoneTextFieldWidget({super.key,
    required this.controller, this.onChanged,required this.text,required this.errorMSG
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(
            color: Colors.grey, fontSize: 15),
        label:  Text(text),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromRGBO(226, 226, 226, 1),
          ),),
        enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromRGBO(226 ,226, 226,1),
            )
        ),
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      validator: (val) {
        return errorMSG;
      },
      keyboardType: TextInputType.phone,
      onChanged: onChanged,
    );
  }
}
