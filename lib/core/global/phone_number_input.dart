import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberInput extends StatelessWidget {
  final Function(PhoneNumber) onChanged;
  final PhoneNumber? phoneNumber;
  const PhoneNumberInput({super.key, required this.onChanged, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return
      Container(
    decoration: BoxDecoration(
    border: Border.all(color: Colors.grey), // Bordure extérieure
    borderRadius: BorderRadius.circular(8),
    ),
    child: InternationalPhoneNumberInput(
    onInputChanged: onChanged,
    initialValue: phoneNumber ?? PhoneNumber(isoCode: 'US'),
    selectorConfig: SelectorConfig(
    selectorType: PhoneInputSelectorType.DIALOG,
    ),
    inputDecoration: InputDecoration(
    labelText: 'Numéro Téléphone',
    border: InputBorder.none, // Aucune bordure interne
  contentPadding: EdgeInsets.symmetric(horizontal: 10),
  ),
  ),
  );
  }
}
