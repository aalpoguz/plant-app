import 'package:equatable/equatable.dart';

class QuestionEntity extends Equatable {
  final int id;
  final String title;
  final String subtitle;
  final String imageUri;
  final String uri;
  final int order;

  const QuestionEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUri,
    required this.uri,
    required this.order,
  });

  @override
  List<Object?> get props => [id, title, subtitle, imageUri, uri, order];
}
