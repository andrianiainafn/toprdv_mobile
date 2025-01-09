import 'package:flutter/material.dart';
import 'package:my_template_project/core/util/input_validator.dart';

class InputWidget extends StatelessWidget {
  final String title;
  final String type;
  final bool? isReadOnly;
  final Function(String) onChanged;
  final IconData icon;
  final TextEditingController? controller; // Accept the controller
  const InputWidget({super.key, required this.title, required this.type, required this.onChanged, required this.icon, this.controller,  this.isReadOnly});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextFormField(
        controller: controller,
        enabled: isReadOnly ?? true,
        onChanged: onChanged,
        validator: (value) {
          if(type == 'email'){
            return validateEmail(value);
          }else{
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: title,
          prefixIcon: Icon(
            icon,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(5.0), // Adjust as needed
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 2.0),
            // Customize focus style
            borderRadius: BorderRadius.circular(5.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2.0),
            // Error border style
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
