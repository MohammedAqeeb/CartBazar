import 'package:cart_bazar/features/authentication/domain/entity/user_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable(createToJson: false)
class UserInfoDetails extends UserInfoEnity {
  UserInfoDetails({
    required super.uid,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.gender,
    super.image,
  });

  factory UserInfoDetails.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDetailsFromJson(json);
}
