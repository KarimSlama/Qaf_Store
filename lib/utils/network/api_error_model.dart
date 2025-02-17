import 'package:json_annotation/json_annotation.dart';
<<<<<<< HEAD
part 'api_error_model.g.dart';
=======
// part 'api_error_model.g.dart';
>>>>>>> onboarding

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;

  ApiErrorModel({
    required this.message,
    this.code,
  });

<<<<<<< HEAD
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
=======
  // factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
  //     _$ApiErrorModelFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
>>>>>>> onboarding
}