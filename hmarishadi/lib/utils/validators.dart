class Validator {
  /// 📱 Phone Number
  static String? phone(String? val) {
    if (val == null || val.isEmpty) {
      return "Mobile number required";
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(val)) {
      return "Only numbers allowed";
    }

    if (val.length != 10) {
      return "Enter valid 10 digit number";
    }

    if (!RegExp(r'^[6-9]').hasMatch(val)) {
      return "Invalid mobile number";
    }

    return null;
  }

  /// 🔒 Password
  static String? password(String? val) {
    if (val == null || val.isEmpty) {
      return "Password required";
    }

    if (val.length < 6) {
      return "Minimum 6 characters";
    }

    return null;
  }

  /// 👤 Name
  static String? name(String? val) {
    if (val == null || val.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  /// 📧 Email
  static String? email(String? val) {
    if (val == null || val.isEmpty) {
      return "Email required";
    }

    if (!val.contains("@")) {
      return "Enter valid email";
    }

    return null;
  }
}
