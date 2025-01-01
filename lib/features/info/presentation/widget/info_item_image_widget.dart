import 'package:flutter/material.dart';
import '../../../../core/util/format_date.dart';

class InfoItemImageWidget extends StatelessWidget {
  final String brand;
  final DateTime date;
  final String imageUrl;
  const InfoItemImageWidget({super.key, required this.brand, required this.date, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white.withAlpha(77),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(20),
                blurRadius: 10,
                offset: Offset(0, 4),
              )
            ]
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(brand, style: TextStyle(fontSize: 18,color: Colors.green),),
            Text( formatDate(date) ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              width: double.infinity,
              height: 150,
              child: ClipRRect(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
    );
  }
}
