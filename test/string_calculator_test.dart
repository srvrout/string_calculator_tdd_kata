import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('String Calculator', () {
    test('returns 0 for empty string', () {
      expect(StringCalculator.add(''), 0);
    });

    test('returns number itself for single number', () {
      expect(StringCalculator.add('1'), 1);
    });

    test('returns sum of two comma separated numbers', () {
      expect(StringCalculator.add('1,5'), 6);
    });

    test('returns sum of multiple numbers', () {
      expect(StringCalculator.add('1,2,3,4,5'), 15);
    });

    test('handles new line as delimiter', () {
      expect(StringCalculator.add('1\n2,3'), 6);
    });

    test('supports custom delimiter', () {
      expect(StringCalculator.add('//;\n1;2'), 3);
    });

    test('throws exception for single negative number', () {
      expect(
            () => StringCalculator.add('1,2,-3'),
        throwsA(
          predicate(
                (e) =>
            e is Exception &&
                e.toString().contains(
                  'negative numbers not allowed -3',
                ),
          ),
        ),
      );
    });

    test('throws exception listing all negative numbers', () {
      expect(
            () => StringCalculator.add('1,-2,-4,3'),
        throwsA(
          predicate(
                (e) =>
            e is Exception &&
                e.toString().contains(
                  'negative numbers not allowed -2,-4',
                ),
          ),
        ),
      );
    });
  });
}
