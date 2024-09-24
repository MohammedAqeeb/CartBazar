class UserInfoEnity {
  final String uid, firstName, lastName, email, gender;
  final String? image;

  UserInfoEnity({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    this.image,
  });
}
