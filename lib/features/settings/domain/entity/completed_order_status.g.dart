// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_order_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedOrderStatusEntity _$CompletedOrderStatusEntityFromJson(
        Map<String, dynamic> json) =>
    CompletedOrderStatusEntity(
      title: json['title'] as String,
      done: json['done'] as bool,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
    );
