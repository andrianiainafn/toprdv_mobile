import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberInput extends StatelessWidget {
  final Function(PhoneNumber) onChanged;
  final PhoneNumber? phoneNumber;
  final bool? isEdit;
  const PhoneNumberInput({super.key, required this.onChanged, required this.phoneNumber, this.isEdit});

  Future<PhoneNumber> getInitialPhoneNumber() async {
    if (phoneNumber != null) {
      try {
        return await PhoneNumber.getRegionInfoFromPhoneNumber(
            phoneNumber!.phoneNumber ?? '',
            phoneNumber!.isoCode ?? 'MG'
        );
      } catch (e) {
        return phoneNumber!;
      }
    }

    return PhoneNumber(
        phoneNumber: "",
        isoCode: "MG",
        dialCode: "261"
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PhoneNumber>(
      future: getInitialPhoneNumber(),
      builder: (context, snapshot) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: InternationalPhoneNumberInput(
            isEnabled: isEdit ?? true,
            onInputChanged: onChanged,
            initialValue: snapshot.data ?? PhoneNumber(isoCode: 'MG'),
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DIALOG,
            ),
            inputDecoration: const InputDecoration(
              labelText: 'Numéro Téléphone',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        );
      },
    );
  }
}
