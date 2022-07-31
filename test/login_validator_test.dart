import 'package:flutter_test/flutter_test.dart';
import 'package:silverkakis1/screens/login_screen.dart';

void main(){

  /// To test for error output when email is empty
  test('empty email returns error string', () {
    var result = EmailFieldValidator.validate('');
    expect(result, 'Email can\'t be empty');
  });

  /// To test for error output when email is invalid
  test('non-empty email returns null', (){
    var result = EmailFieldValidator.validate('email');
    expect(result, null);
  });

  ///To test for error output when password is empty
  test('empty password returns error string', () {
    var result = PasswordFieldValidator.validate('');
    expect(result, 'Password can\'t be empty');
  });

  ///To test for error output when password is invalid
  test('non-empty password returns null', (){
    var result = PasswordFieldValidator.validate('email');
    expect(result, null);
  });
}

