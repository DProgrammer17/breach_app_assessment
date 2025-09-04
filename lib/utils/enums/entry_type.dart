enum EntryType {
  login('LOGIN', 'Login'),
  signup('SIGNUP', 'Sign Up'),
  none('none', 'None');

  const EntryType(this.jsonString, this.displayString);
  final String jsonString;
  final String displayString;
}

extension EntryTypeFromString on String? {
  EntryType? get jsonEntryType {
    return EntryType.values.firstWhere(
          (element) => element.jsonString == this,
      orElse: () => EntryType.none,
    );
  }

  EntryType? get displayEntryType {
    return EntryType.values.firstWhere(
          (element) => element.displayString == this,
      orElse: () => EntryType.none,
    );
  }
}
