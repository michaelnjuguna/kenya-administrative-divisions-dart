import 'package:kenya_administrative_divisions/src/models.dart';
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
}
