import 'package:flutter/material.dart';

class DateTimeInput extends StatelessWidget {
  final DateTime? selectedDateTime;
  final Function(DateTime?) onDateTimeChanged;

  const DateTimeInput({
    super.key,
    required this.selectedDateTime,
    required this.onDateTimeChanged,
  });

  Future<void> _selectDateTime(BuildContext context) async {

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate == null) return;


    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedDateTime != null
          ? TimeOfDay.fromDateTime(selectedDateTime!)
          : TimeOfDay.now(),
    );

    if (pickedTime == null) return;


    DateTime combinedDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    onDateTimeChanged(combinedDateTime);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDateTime(context),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10,bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Text(
          selectedDateTime != null
              ? "${selectedDateTime!.toLocal()}".split('.')[0]
              : "Tap to select date and time",
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
