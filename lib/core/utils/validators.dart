import 'package:intl/intl.dart';

/// this file is for the common validations in the application
class Validators {
  // Validated for required fields
  static String? requiredField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return Intl.message("field_required");
    }
    return null;
  }
}
