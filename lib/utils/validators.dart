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
}
