import 'package:json_annotation/json_annotation.dart';

part 'order_status.g.dart';

@JsonSerializable(createToJson: true, createFactory: false)
class OrderStatus {
  final String title;
  final bool done;
  final DateTime? createdDate;

  OrderStatus({
    required this.title,
    required this.done,
    required this.createdDate,
  });

  Map<String, dynamic> toJson() => _$OrderStatusToJson(this);
}
