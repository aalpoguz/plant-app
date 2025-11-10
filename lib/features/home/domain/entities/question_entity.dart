import 'package:equatable/equatable.dart';

class QuestionEntity extends Equatable {
  final int id;
  final String title;
  final String subtitle;
  final String image_uri;
  final String uri;
  final int order;

  const QuestionEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image_uri,
    required this.uri,
    required this.order,
  });

  @override
  List<Object?> get props => [id, title, subtitle, image_uri, uri, order];
}
