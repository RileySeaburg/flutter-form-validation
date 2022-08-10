// Copyright (c) 2022 Evolving Software Corporation
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

class ValidationMixin {
  String? validateEmail(String? value) {
    // return null if the value is valid
    if (!value!.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    // return null if the value is valid
    if (value!.length < 6) {
      return 'Please enter a valid password';
    }
    return null;
  }


}
