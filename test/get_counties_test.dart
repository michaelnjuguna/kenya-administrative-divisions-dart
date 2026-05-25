import 'package:kenya_administrative_divisions/src/models.dart';
import 'package:test/test.dart';
import 'package:kenya_administrative_divisions/kenya_administrative_divisions.dart';

void main() {
  late MainController kad;
  setUp(() {
    kad = kenyaAdministrativeDivisions;
  });
  group('Get counties', () {
    test('No parameter passed', () {
      final List<County> result = kad.getCounties();
      expect(result, isList);
      expect(result.length, equals(47));
    });
    test('Valid number passed as parameter', () {
      final List<County> result = kad.getCounties(countyCode: 1);
      expect(result.length, 1);
      final County county = result[0];
      expect(county.countyName, equals('Mombasa'));
      expect(county.countyCode, 1);
    });
  });
}
