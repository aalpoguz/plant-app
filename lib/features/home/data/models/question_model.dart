import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:plant_app/features/home/domain/entities/question_entity.dart';

part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel extends Equatable {
  final int id;
  final String title;
  final String subtitle;
  @JsonKey(name: 'image_uri')
  final String imageUri;
  final String uri;
  final int order;

  const QuestionModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUri,
    required this.uri,
    required this.order,
  });

  @override
  List<Object?> get props => [id, title, subtitle, imageUri, uri, order];

  factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);

  QuestionEntity toEntity() {
    return QuestionEntity(
      id: id,
      title: title,
      subtitle: subtitle,
      imageUri: imageUri,
      uri: uri,
      order: order,
    );
  }
}
