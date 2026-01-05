class StringCalculator {
  static int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String numbersSection = numbers;
    String delimiter = ',';

// Support different delimiters
    if (numbers.startsWith('//')) {
      final List<String> parts = numbers.split('\n');

      delimiter = parts.first.substring(2);

      numbersSection = parts.last;
    }

    final List<int> filteredNumList = numbersSection
        .replaceAll('\n', delimiter)
        .split(delimiter)
        .where((e) => e.isNotEmpty)
        .map(int.parse)
        .toList();

// Negative numbers List
    final List<int> negativeNumList =
    filteredNumList.where((n) => n < 0).toList();
    if (negativeNumList.isNotEmpty) {
      throw Exception(
        'negative numbers not allowed ${negativeNumList.join(',')}',
      );
    }

    return filteredNumList.fold(0, (prev, element) => prev + element);
  }
}
