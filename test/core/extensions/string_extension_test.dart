import 'package:flutter_test/flutter_test.dart';
import 'package:basic_project/core/extensions/string_extension.dart';

void main() {
  group('StringExtension toArabicNumbers tests', () {
    test('should map English digits to Arabic digits', () {
      expect('123'.toArabicNumbers, '١٢٣');
      expect('05987654321'.toArabicNumbers, '٠٥٩٨٧٦٥٤٣٢١');
    });

    test('should preserve non-digit characters', () {
      expect('Hello 123 World!'.toArabicNumbers, 'Hello ١٢٣ World!');
      expect('Price: \$45.99'.toArabicNumbers, 'Price: \$٤٥.٩٩');
    });

    test('should handle empty string', () {
      expect(''.toArabicNumbers, '');
    });
  });
}
