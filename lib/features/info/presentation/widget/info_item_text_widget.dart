import 'package:flutter/material.dart';
import '../../../../core/util/format_date.dart';

class InfoItemTextWidget extends StatefulWidget {
  final String brand;
  final DateTime date;
  final String content;
  const InfoItemTextWidget({super.key, required this.brand, required this.date, required this.content});
  @override
  State<InfoItemTextWidget> createState() => _InfoItemTextWidgetState();
}

class _InfoItemTextWidgetState extends State<InfoItemTextWidget> {
  late bool _showMore = false;
  late int end = 100;

  void setShowMore(){
    setState(() {
      _showMore = !_showMore;
    });
  }
  @override
  void initState() {
    super.initState();
    setState(() {
      if (end > widget.content.length) {
        end = widget.content.length;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
      margin: EdgeInsets.only(top:10, bottom:10),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.brand, style: TextStyle(fontSize: 18,color: Colors.green),),
          Text( formatDate(widget.date) ),
          Text(
            _showMore ? widget.content : '${widget.content.substring(0, 3)}...',
            style: TextStyle(fontSize: 16),
          ),
          TextButton(onPressed: setShowMore, child: Text("Voire plus"))
        ],
      ),
    );
  }
}
