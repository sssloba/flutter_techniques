class Validators {
  bool isEmail(String email) {
    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    // ^: Asserts the start of a line.
    // [a-zA-Z0-9._%+-]+: Matches one or more occurrences of:
    // --- a-zA-Z: Any uppercase or lowercase letter.
    // --- 0-9: Any digit.
    // --- ._%+-: Special characters often allowed in email local parts.
    // @: Matches the '@' character, which is mandatory in all email addresses.
    // [a-zA-Z0-9.-]+: Matches the domain part of the email address, allowing:
    // --- Letters, digits, periods (.), and hyphens (-).
    // \.: Matches the dot . character, separating the domain and the top-level domain (TLD).
    // [a-zA-Z]{2,}: Matches the top-level domain (TLD), which must be at least two characters long and consist of letters.
    // $: Asserts the end of the line.
    return emailRegex.hasMatch(email.trim());
  }

  bool strongPassword(String password) {
    final RegExp passwordRegex = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&.,^#])[A-Za-z\d@$!%*?&.,^#]{8,}$');
    //  ^: Asserts the start of the string.
    // (?=.*[A-Z]): Positive lookahead to ensure at least one uppercase letter exists.
    // (?=.*[a-z]): Positive lookahead to ensure at least one lowercase letter exists.
    // (?=.*\d): Positive lookahead to ensure at least one digit exists.
    // (?=.*[@$!%*?&.,^#]): Positive lookahead to ensure at least one special character exists. You can add or remove special characters in the square brackets to fit your needs.
    // [A-Za-z\d@$!%*?&.,^#]{8,}: Matches any string that contains only the specified characters and is at least 8 characters long.
    // --- NOTE: If the password contains even one character that is not set previous square brackets, the entire regex will fail, resulting in no match (returning false as a result).
    // $: Asserts the end of the string.
    return passwordRegex.hasMatch(password);
  }

  bool isSymbolAllowed(String password) {
    final RegExp passwordRegex = RegExp(r'^[A-Za-z\d@$!%*?&.,^#]{1,}$');
    // [A-Za-z\d@$!%*?&.,^#]{1,}: Matches any string that contains only the specified characters at least once.
    // If it contains any symbol that doesn't match the pattern such as +,-,/ etc. it will return false.
    // Can be used in combination with [strongPassword] to announce Users if is used any symbol that is not allowed.
    return passwordRegex.hasMatch(password);
  }

  bool strongPasswordUnrestricted(String password) {
    final RegExp passwordRegex =
        RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$');
//   (?=.*[\W_]): This ensures that the password includes at least one special character.
// \W matches any non-word character, which includes symbols, punctuation, and whitespace.
// _ is added explicitly to include the underscore as well.
// [A-Za-z\d\W_]{8,}: This allows any character that is an uppercase letter, lowercase letter, digit, or non-word character (which includes most special characters).
    return passwordRegex.hasMatch(password);
  }
}
