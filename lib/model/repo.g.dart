// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Repo _$$_RepoFromJson(Map<String, dynamic> json) => _$_Repo(
      name: json['name'] as String,
      description: json['description'] as String?,
      language: json['language'] as String?,
      stargazersCount: json['stargazers_count'] as int,
    );

Map<String, dynamic> _$$_RepoToJson(_$_Repo instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'language': instance.language,
      'stargazers_count': instance.stargazersCount,
    };
