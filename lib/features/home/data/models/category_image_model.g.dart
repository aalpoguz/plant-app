// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryImageModel _$CategoryImageModelFromJson(Map<String, dynamic> json) =>
    CategoryImageModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      alternativeText: json['alternativeText'] as String?,
      caption: json['caption'] as String?,
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      hash: json['hash'] as String?,
      ext: json['ext'] as String?,
      mime: json['mime'] as String,
      size: json['size'],
      url: json['url'] as String,
      previewUrl: json['previewUrl'] as String?,
      provider: json['provider'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$CategoryImageModelToJson(CategoryImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alternativeText': instance.alternativeText,
      'caption': instance.caption,
      'width': instance.width,
      'height': instance.height,
      'hash': instance.hash,
      'ext': instance.ext,
      'mime': instance.mime,
      'size': instance.size,
      'url': instance.url,
      'previewUrl': instance.previewUrl,
      'provider': instance.provider,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
