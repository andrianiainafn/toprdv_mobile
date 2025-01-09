import 'package:flutter/material.dart';

import '../../features/brand/domain/entity/brand.dart';

class InputSelectWidget extends StatelessWidget {
  final String title;
  final Function(String) onChanged;
  final List<Brand> options;
  final String? initialValue;
  final bool isRequired;
  final String? Function(String?)? validator;
  const InputSelectWidget({super.key, required this.title, required this.onChanged, required this.options, this.initialValue, required this.isRequired, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField<String>(
        value: initialValue,
        decoration: InputDecoration(
          labelText: isRequired ? '$title *' : title,
          border: InputBorder.none,
        ),
        items: options.map((Brand option) {
          return DropdownMenuItem<String>(
            value: option.id.toString(),
            child: Text(option.value),
          );
        }).toList().cast<DropdownMenuItem<String>>(),
        validator: validator ?? (isRequired
            ? (value) => value == null || value.isEmpty
            ? 'Please select a $title'
            : null
            : null),
        onChanged: (String? newValue) {
          if (newValue != null) {
            onChanged(newValue);
          }
        },
      ),
    );
  }
}

