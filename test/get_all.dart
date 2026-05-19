import 'package:kenya_administrative_divisions/src/models.dart';
import 'package:test/test.dart';
import 'package:kenya_administrative_divisions/kenya_administrative_divisions.dart';

void main() {
  late MainController kad;
  setUp(() {
    kad = kenyaAdministrativeDivisions;
  });
  group('Main Controller', () {
    test('Get all', () {
      final counties = kad.getAll;
      expect(counties.length, equals(47));
      expect(counties, isList);
      final County county = counties[0];
      expect(county.countyCode, 1);
      expect(county.countyName, 'Mombasa');
      expect(county.constituencies, isList);
    });
  });
}
