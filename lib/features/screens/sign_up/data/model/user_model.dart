import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qaf_store/utils/formaters/qaf_formaters.dart';

class UserModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String? userName;
  final String email;
  final String phone;
  final String? password;
  String? profilePicture;

  UserModel(
      {required this.firstName,
      required this.lastName,
      required this.phone,
      required this.profilePicture,
      this.id,
      this.password,
      this.userName,
      required this.email,
      });

  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? userName,
    String? email,
    String? phone,
    String? password,
    String? profilePicture,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  String get fullName => '$firstName $lastName';

  String get formattedPhoneNo => QafFormaters.formatPhoneNumber(phone);

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUserName = "$firstName$lastName";
    String userNameWithPrefix = "cwt_$camelCaseUserName";
    return userNameWithPrefix;
  }

  static UserModel empty() => UserModel(
      firstName: '',
      lastName: '',
      phone: '',
      profilePicture: '',
      id: '',
      userName: '',
      password: '',
      email: '');

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'FirstName': firstName,
      'LastName': lastName,
      'Username': userName,
      'Email': email,
      'Phone': phone,
      'ProfilePicture': profilePicture,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        firstName: data['FirstName'] ?? '',
        id: data['Id'] ?? '',
        lastName: data['LastName'] ?? '',
        phone: data['Phone'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
        userName: data['Username'] ?? '',
        email: data['Email'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
