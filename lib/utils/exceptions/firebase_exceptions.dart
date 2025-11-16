import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

/// Unified Exception Handler for Firebase, Auth, Platform, and Format errors.
class QafExceptionHandler implements Exception {
  final String code;
  final String? customMessage;

  QafExceptionHandler(this.code, [this.customMessage]);

  /// Main message getter
  String get message {
    if (customMessage != null && customMessage!.isNotEmpty) {
      return customMessage!;
    }

    // 🔹 Try Firebase Auth Errors First
    final firebaseAuthMsg = _firebaseAuthErrors[code];
    if (firebaseAuthMsg != null) return firebaseAuthMsg;

    // 🔹 Try Firebase General Errors
    final firebaseMsg = _firebaseErrors[code];
    if (firebaseMsg != null) return firebaseMsg;

    // 🔹 Try Platform Errors
    final platformMsg = _platformErrors[code];
    if (platformMsg != null) return platformMsg;

    // 🔹 Try Format Errors
    final formatMsg = _formatErrors[code];
    if (formatMsg != null) return formatMsg;

    // 🔹 Default fallback
    return 'An unexpected error occurred. Please try again.';
  }

  // ----------------------------
  // 🔸 Firebase Auth Error Messages
  // ----------------------------
  static const Map<String, String> _firebaseAuthErrors = {
    'invalid-credential':
        'The email or password is incorrect. Please check your credentials and try again.',
    'email-already-in-use':
        'The email address is already registered. Please use a different email.',
    'invalid-email':
        'The email address provided is invalid. Please enter a valid email.',
    'weak-password':
        'The password is too weak. Please choose a stronger password.',
    'user-disabled':
        'This user account has been disabled. Please contact support.',
    'user-not-found':
        'Invalid login details. User not found.',
    'wrong-password':
        'Incorrect password. Please check your password and try again.',
    'account-exists-with-different-credential':
        'An account already exists with the same email but different sign-in credentials.',
    'requires-recent-login':
        'This operation is sensitive and requires recent authentication. Please log in again.',
    'credential-already-in-use':
        'This credential is already associated with another user account.',
    'quota-exceeded':
        'Quota exceeded. Please try again later.',
    'internal-error':
        'An internal authentication error occurred. Please try again later.',
    'INVALID_LOGIN_CREDENTIALS':
        'Invalid login credentials. Please double-check your information.',
  };

  // ----------------------------
  // 🔸 General Firebase Errors
  // ----------------------------
  static const Map<String, String> _firebaseErrors = {
    'unknown': 'An unknown Firebase error occurred.',
    'user-disabled': 'The user account has been disabled.',
    'user-mismatch': 'The supplied credentials do not match the signed-in user.',
    'invalid-verification-code':
        'Invalid verification code. Please enter a valid code.',
    'invalid-verification-id':
        'Invalid verification ID. Please request a new verification code.',
    'expired-action-code':
        'The action code has expired. Please request a new one.',
    'app-not-authorized':
        'The app is not authorized to use Firebase Authentication.',
    'app-deleted':
        'This instance of FirebaseApp has been deleted.',
    'web-storage-unsupported':
        'Web storage is not supported or disabled.',
    'requires-recent-login':
        'This operation requires recent login. Please sign in again.',
  };

  // ----------------------------
  // 🔸 Platform Errors
  // ----------------------------
  static const Map<String, String> _platformErrors = {
    'INVALID_LOGIN_CREDENTIALS':
        'Invalid login credentials. Please double-check your information.',
    'too-many-requests':
        'Too many requests. Please try again later.',
    'invalid-argument':
        'Invalid argument provided to the authentication method.',
    'invalid-phone-number':
        'The provided phone number is invalid.',
    'operation-not-allowed':
        'The sign-in provider is disabled for your Firebase project.',
    'session-cookie-expired':
        'The session cookie has expired. Please sign in again.',
    'network-request-failed':
        'Network request failed. Please check your internet connection.',
    'internal-error':
        'Internal error. Please try again later.',
    'quota-exceeded':
        'Quota exceeded. Please try again later.',
  };

  // ----------------------------
  // 🔸 Format Errors
  // ----------------------------
  static const Map<String, String> _formatErrors = {
    'invalid-email-format':
        'The email address format is invalid. Please enter a valid email.',
    'invalid-phone-number-format':
        'The phone number format is invalid. Please enter a valid number.',
    'invalid-date-format':
        'The date format is invalid. Please enter a valid date.',
    'invalid-url-format':
        'The URL format is invalid. Please enter a valid URL.',
    'invalid-credit-card-format':
        'The credit card format is invalid. Please enter a valid card number.',
    'invalid-numeric-format':
        'The input should be a valid numeric format.',
  };

  // ----------------------------
  // 🔸 Factory method for catching any error type easily
  // ----------------------------
  static QafExceptionHandler from(dynamic error) {
    if (error == null) {
      return QafExceptionHandler('unknown');
    }

    if (error is FirebaseAuthException) {
      return QafExceptionHandler(error.code);
    } else if (error is FirebaseException) {
      return QafExceptionHandler(error.code);
    } else if (error is PlatformException) {
      return QafExceptionHandler(error.code);
    } else if (error is FormatException) {
      return QafExceptionHandler('invalid-format', error.message);
    } else if (error is QafExceptionHandler) {
      return error;
    } else {
      return QafExceptionHandler('unknown', error.toString());
    }
  }

  @override
  String toString() => message;
}
