import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'advice_model.g.dart';

@JsonSerializable()
class AdviceModel extends Equatable {
  final String text;
  final int id;

  const AdviceModel({required this.text, required this.id});

  @override
  List<Object?> get props => [text, id];

  factory AdviceModel.fromJson(Map<String, dynamic> json) =>
      _$AdviceModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdviceModelToJson(this);
}
