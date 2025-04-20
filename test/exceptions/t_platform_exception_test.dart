import 'package:flutter_test/flutter_test.dart';
import 'package:grocify/utils/exceptions/platform_exceptions.dart';


void main() {
  group('TPlatformException', () {
    final testCases = <String, String>{
      'INVALID_LOGIN_CREDENTIALS': 'Invalid login credentials. Please double-check your information.',
      'too-many-requests': 'Too many requests. Please try again later.',
      'invalid-argument': 'Invalid argument provided to the authentication method.',
      'invalid-password': 'Incorrect password. Please try again.',
      'invalid-phone-number': 'The provided phone number is invalid.',
      'operation-not-allowed': 'The sign-in provider is disabled for your Firebase project.',
      'session-cookie-expired': 'The Firebase session cookie has expired. Please sign in again.',
      'uid-already-exists': 'The provided user ID is already in use by another user.',
      'sign_in_failed': 'Sign-in failed. Please try again.',
      'network-request-failed': 'Network request failed. Please check your internet connection.',
      'internal-error': 'Internal error. Please try again later.',
      'invalid-verification-code': 'Invalid verification code. Please enter a valid code.',
      'invalid-verification-id': 'Invalid verification ID. Please request a new verification code.',
      'quota-exceeded': 'Quota exceeded. Please try again later.',
    };

    test('returns correct message for known codes', () {
      testCases.forEach((code, expectedMessage) {
        final exception = TPlatformException(code);
        expect(exception.message, expectedMessage, reason: 'Failed on code: $code');
      });
    });

    test('returns default message for unknown code', () {
      final exception = TPlatformException('some-random-code');
      expect(exception.message, 'An unexpected platform error occurred. Please try again.');
    });
  });
}
