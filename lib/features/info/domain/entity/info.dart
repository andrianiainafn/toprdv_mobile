
import 'package:equatable/equatable.dart';
import 'package:my_template_project/features/info/domain/entity/info_item.dart';

class Info extends Equatable{
  final List<InfoItem> content;
  final int totalPages;
  final int pageNumber;

  const Info(this.content, this.totalPages, this.pageNumber);
  @override
  List<Object?> get props => [];

}