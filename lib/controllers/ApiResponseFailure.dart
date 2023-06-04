import 'package:equatable/equatable.dart';

/// {@template api_response_failure}
/// Represents an api failure response.
/// {@endtemplate}
class ApiResponseFailure extends Equatable implements Exception {
  /// {@macro api_response_failure}
  const ApiResponseFailure({
    required this.statusCode,
    this.reasonPhrase,
  }) : super();

  /// The HTTP status code for this response.
  final int statusCode;

  /// The reason phrase associated with the status code.
  final String? reasonPhrase;

  /// User needs to reset password and go through 2FA
  bool get isTwoFactorAuthenticationNeeded => statusCode == 412;

  @override
  List<Object?> get props => [
        statusCode,
        reasonPhrase,
        isTwoFactorAuthenticationNeeded,
      ];
}
