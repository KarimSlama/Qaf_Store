import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  final String? id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
  });

  static AddressModel empty() => AddressModel(
      id: '',
      name: '',
      phoneNumber: '',
      city: '',
      country: '',
      postalCode: '',
      state: '',
      street: '');

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'PhoneNumber': phoneNumber,
      'City': city,
      'Country': country,
      'State': state,
      'Street': street,
      'PostalCode': postalCode,
    };
  }

  factory AddressModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return AddressModel(
        id: data['Id'] ?? '',
        name: data['Name'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        city: data['City'] ?? '',
        country: data['Country'] ?? '',
        state: data['State'] ?? '',
        street: data['Street'] ?? '',
        postalCode: data['PostalCode'] ?? '',
      );
    } else {
      return AddressModel.empty();
    }
  }
}
