import 'package:json_annotation/json_annotation.dart';
import 'package:plant_app/features/home/domain/entities/question_entity.dart';

part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel {
  final int id;
  final String title;
  final String subtitle;
  final String image_uri;
  final String uri;
  final int order;

  QuestionModel({required this.id, required this.title, required this.subtitle, required this.image_uri, required this.uri, required this.order});

  factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);

  QuestionEntity toEntity() {
    return QuestionEntity(id: id, title: title, subtitle: subtitle, image_uri: image_uri, uri: uri, order: order);
  }
}
