import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:plant_app/features/home/domain/entities/category_entity.dart';

part 'category_image_model.g.dart';

@JsonSerializable()
class CategoryImageModel extends Equatable {
  final int id;
  final String name;
  final String? alternativeText;
  final String? caption;
  final int width;
  final int height;
  final String? hash;
  final String? ext;
  final String mime;
  final dynamic size;
  final String url;
  final String? previewUrl;
  final String? provider;
  final String createdAt;
  final String updatedAt;

  const CategoryImageModel({
    required this.id,
    required this.name,
    this.alternativeText,
    this.caption,
    required this.width,
    required this.height,
    this.hash,
    this.ext,
    required this.mime,
    required this.size,
    required this.url,
    this.previewUrl,
    this.provider,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryImageModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryImageModelToJson(this);

  CategoryImageEntity toEntity() {
    return CategoryImageEntity(id: id, name: name, url: url);
  }

  @override
  List<Object?> get props => [
    id,
    name,
    alternativeText,
    caption,
    width,
    height,
    hash,
    ext,
    mime,
    size,
    url,
    previewUrl,
    provider,
    createdAt,
    updatedAt,
  ];
}
