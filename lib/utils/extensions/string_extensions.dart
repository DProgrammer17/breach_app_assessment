extension StringCasesExtension on String {
  String get toCamelCase =>
      '${this[0].toUpperCase()}${substring(1).toLowerCase()}';

  String get allToCapital => toUpperCase();

  String get toTitleCase => split(" ").map((str) => str.toCamelCase).join(" ");
}

extension Blank on String? {
  bool get isBlank {
    this?.trim();
    if (this != null && this!.isNotEmpty) return false;

    return true;
  }

  bool get isNotBlank {
    return !isBlank;
  }

  String? get str {
    this?.trim();
    if (this != null && this!.isNotEmpty) return this;

    return null;
  }
}
