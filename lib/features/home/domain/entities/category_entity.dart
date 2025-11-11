import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String name;
  final String title;
  final int rank;
  final String createdAt;
  final String updatedAt;
  final String publishedAt;
  final CategoryImageEntity image;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.title,
    required this.rank,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.image,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    title,
    rank,
    createdAt,
    updatedAt,
    publishedAt,
    image,
  ];
}

class CategoryImageEntity extends Equatable {
  final int id;
  final String name;
  final String url;

  const CategoryImageEntity({
    required this.id,
    required this.name,
    required this.url,
  });

  @override
  List<Object?> get props => [id, name, url];
}
