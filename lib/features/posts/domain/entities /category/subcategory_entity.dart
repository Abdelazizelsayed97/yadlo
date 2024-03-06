import 'package:equatable/equatable.dart';

class SubCategoryEntity extends Equatable {
  final String? categoryId;
  final String? enName;


  const SubCategoryEntity({required this.categoryId, required this.enName, });

  @override
  // TODO: implement props
  List<Object?> get props => [categoryId,enName,];

}