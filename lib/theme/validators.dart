class Validators {
  static String? notEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "A mező nem lehet üres.";
    }
    return null;
  }

  static String? minLength(String? value, int min) {
    if (value == null || value.length < min) {
      return "Legalább $min karakter szükséges.";
    }
    return null;
  }
}
