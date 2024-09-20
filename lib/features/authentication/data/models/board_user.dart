class OnBoardUser {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? gender;
  String? age;

  OnBoardUser({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  OnBoardUser copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
  }) {
    return OnBoardUser(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'firstName': firstName,
  //     'lastName': lastName,
  //     'email': email,
  //     'password': password,
  //     ''
  //   };
  // }

  // factory OnBoardUser.fromMap(Map<String, dynamic> map) {
  //   return OnBoardUser(
  //     firstName: map['firstName'] != null ? map['firstName'] as String : null,
  //     lastName: map['lastName'] != null ? map['lastName'] as String : null,
  //     email: map['email'] != null ? map['email'] as String : null,
  //     password: map['password'] != null ? map['password'] as String : null,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory OnBoardUser.fromJson(String source) =>
  //     OnBoardUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
