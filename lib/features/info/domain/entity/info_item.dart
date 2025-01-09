import 'package:equatable/equatable.dart';

class InfoItem extends Equatable{
  final int id;
  final String audioLink;
  final String videoLink;
  final String text;
  final String flyerLink;
  final String infoFormat;
  final DateTime createdAt;
  final String brandName;

  const InfoItem(this.id, this.audioLink, this.videoLink, this.text, this.flyerLink, this.infoFormat, this.createdAt, this.brandName);
  @override
  List<Object?> get props => [id, audioLink, videoLink, infoFormat, createdAt, brandName,flyerLink];

}