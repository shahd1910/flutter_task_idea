class UserModel {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String dateOfBirth;
  final String imageUrl;
  final String gender;

  UserModel({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.imageUrl,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth,
      'imageUrl': imageUrl,
      'gender': gender,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullName: map['fullName'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      dateOfBirth: map['dateOfBirth'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      gender: map['gender'] ?? 'Male',
    );
  }
}
