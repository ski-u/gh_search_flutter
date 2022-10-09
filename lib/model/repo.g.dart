// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Repo _$$_RepoFromJson(Map<String, dynamic> json) => _$_Repo(
      name: json['name'] as String,
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
      description: json['description'] as String?,
      language: json['language'] as String?,
      stargazersCount: json['stargazers_count'] as int,
    );

Map<String, dynamic> _$$_RepoToJson(_$_Repo instance) => <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
      'description': instance.description,
      'language': instance.language,
      'stargazers_count': instance.stargazersCount,
    };
