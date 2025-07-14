// ✅ Extension with multiple String utility functions
extension StringUtils on String {
  // Capitalize first letter
  String capitalize() => isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';

  // Convert entire string to title case (each word capitalized)
  String toTitleCase() => split(" ")
      .map((word) => word.isEmpty ? word : word[0].toUpperCase() + word.substring(1).toLowerCase())
      .join(" ");

  // Reverse the string
  String reversed() => split('').reversed.join('');

  // Check if the string contains only alphabets
  bool isAlphabetic() => RegExp(r'^[a-zA-Z]+$').hasMatch(this);

  // Remove extra spaces between words
  String removeExtraSpaces() => trim().replaceAll(RegExp(r'\s+'), ' ');
}

void main() {
  String sentence = "   hello    world  ";
  String name = "dileep";
  String phrase = "the quick brown fox";

  print(name.capitalize());         // Output: Dileep
  print(phrase.toTitleCase());      // Output: The Quick Brown Fox
  print(name.reversed());           // Output: peelid
  print("Flutter".isAlphabetic());  // Output: true
  print(sentence.removeExtraSpaces()); // Output: hello world
}
