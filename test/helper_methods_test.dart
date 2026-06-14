import 'package:test/test.dart';
import 'package:kenya_administrative_divisions/kenya_administrative_divisions.dart';
import 'test_utils.dart';

void main() {
  late MainController kad;
  setUp(() {
    kad = kenyaAdministrativeDivisions;
  });
  group('Helper methods ', () {
    test('Get all', () {
      final List<County> counties = kad.getAll;
      expect(counties.length, equals(47));
      expectValidCounty(counties.first,
          expectedCode: 1, expectedName: 'Mombasa');
    });
    test('Get county names', () {
      final List<String> counties = kad.getCountyNames;
      expect(counties.length, equals(47));
      expect(counties.first, equals('Mombasa'));
    });
  });
  group('Get constituency names', () {
    test('Invalid number passed as county code', () {
      expect(
          () => kad.getConstituencyNames(countyCode: 48), throwsArgumentError);
      expect(
          () => kad.getConstituencyNames(countyCode: 0), throwsArgumentError);
    });
    test('Valid number passed as county code', () {
      final List<String> result = kad.getConstituencyNames(countyCode: 1);
      expect(result.first, 'Changamwe');
    });
    test('Invalid name passed as county name', () {
      expect(() => kad.getConstituencyNames(countyName: 'Invalid name'),
          throwsArgumentError);
    });
    test('Valid name passed as county name', () {
      final List<String> result =
          kad.getConstituencyNames(countyName: 'mombasa');
      expect(result.first, 'Changamwe');
    });
    test('No param passed', () {
      final List<String> result = kad.getConstituencyNames();
      expect(result[2], 'Kisauni');
    });
  });
}
