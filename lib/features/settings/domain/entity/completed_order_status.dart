import 'package:json_annotation/json_annotation.dart';

part 'completed_order_status.g.dart';

@JsonSerializable(createToJson: false)
class CompletedOrderStatusEntity {
  final String title;
  final bool done;
  final DateTime? createdDate;

  CompletedOrderStatusEntity({
    required this.title,
    required this.done,
    required this.createdDate,
  });

  factory CompletedOrderStatusEntity.fromJson(Map<String, dynamic> json) =>
      _$CompletedOrderStatusEntityFromJson(json);
}
