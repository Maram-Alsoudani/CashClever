class AppValidators {
  AppValidators._();

  static String? validateEmail(String? val) {
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (val == null) {
      return 'This Field Is Required';
    } else if (val.trim().isEmpty) {
      return 'This Field Is Required';
    } else if (emailRegex.hasMatch(val) == false) {
      return 'Please Enter A Valid Email';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    RegExp passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
    if (val == null) {
      return 'This Field Is Required';
    } else if (val.isEmpty) {
      return 'This Field Is Required';
    } else if (val.length < 8 || !passwordRegex.hasMatch(val)) {
      return 'Password should be at least 8 characters long and contain at least one letter and one number.';
    } else {
      return null;
    }
  }

  static String? validateLoginPassword(String? val) {
    if (val == null || val.isEmpty) {
      return 'This Field Is Required';
    }  else {
      return null;
    }
  }


  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return 'This Field Is Required';
    } else if (val != password) {
      return 'Confirm Password must match the Password.';
    } else {
      return null;
    }
  }


  static String? validateUsername(String? val) {
    RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (val == null) {
      return 'This Field Is Required';
    } else if (val.isEmpty) {
      return 'This Field Is Required';
    } else if (!usernameRegex.hasMatch(val)) {
      return 'Please Enter A Valid Username';
    } else {
      return null;
    }
  }


}