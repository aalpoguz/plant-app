import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:plant_app/features/home/domain/entities/category_entity.dart';
import 'category_image_model.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends Equatable {
  final int id;
  final String name;
  final String title;
  final int rank;
  final String createdAt;
  final String updatedAt;
  final String publishedAt;
  final CategoryImageModel image;

  const CategoryModel({
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
  List<Object?> get props => [id, name, title, rank, createdAt, updatedAt, publishedAt, image];

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      title: title,
      rank: rank,
      createdAt: createdAt,
      updatedAt: updatedAt,
      publishedAt: publishedAt,
      image: image.toEntity(),
    );
  }
}
