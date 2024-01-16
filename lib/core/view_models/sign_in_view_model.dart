import 'package:architec_practice2/core/enums/view_state.dart';
import 'package:architec_practice2/core/services/authentication_api.dart';
import 'package:architec_practice2/locator.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_view_model.dart';

class SignInViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey();
  final AuthenticationAPI _authenticationAPI = locator<AuthenticationAPI>();

  final iDController = TextEditingController();
  final passwordController = TextEditingController();

  /// To toggle obscure text (Password field)

  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void changeIsPasswordVisible() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  /// Saving credentials only after a successful login

  Future<void> setSavedPassword() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    iDController.text = preferences.getString('savedId') ?? '';
    passwordController.text = preferences.getString('savedPassword') ?? '';

    if (iDController.text.isNotEmpty) {
      _isCredentialsSaved = true;
    }

    notifyListeners();
  }

  /// Authentication (IsAccountCredentialsCorrect)

  Future<bool> signIn() async {
    setViewState(ViewState.busy);

    final SharedPreferences preferences = await SharedPreferences.getInstance();

    int? returnedStatusCode = await _authenticationAPI.signInAPI(
        iDController.text, passwordController.text);

    setViewState(ViewState.idle);

    if (returnedStatusCode == 201) {
      if (_isCredentialsSaved) {
        preferences.setString('savedId', iDController.text);
        preferences.setString('savedPassword', passwordController.text);
      } else {
        preferences.remove('savedId');
        preferences.remove('savedPassword');
      }

      return true;
    } else {
      preferences.remove('savedId');
      preferences.remove('savedPassword');

      return false;
    }
  }

  /// Validator for credentials text field

  String? mobileNumberValidator(String value) {
    String pattern = r'(^(01)[0-9]{9}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'মোবাইল নম্বর প্রয়োজন';
    } else if (!regExp.hasMatch(value)) {
      return 'সঠিক মোবাইল নম্বর প্রদান করুন';
    }
    return null;
  }

  String? passwordValidator(String value) {
    print(value);
    String pattern = r"(^[a-zA-Z\d@%+'!#$^?:.~\-_.]{8,256}$)";
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'পাসওয়ার্ড প্রয়োজন';
    } else if (value.length < 8) {
      return 'কমপক্ষে ৮ অক্ষর বা তার বেশি প্রয়োজন';
    } else if (!regExp.hasMatch(value)) {
      return 'ভুল অক্ষর ব্যবহার করা হয়েছে';
    }

    return null;
  }

  bool _isCredentialsSaved = false;

  bool get isCredentialsSaved => _isCredentialsSaved;

  void toggleIsCredentialsSaved() async {
    _isCredentialsSaved = !_isCredentialsSaved;

    notifyListeners();
  }
}
