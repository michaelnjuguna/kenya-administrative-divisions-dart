import 'package:kenya_administrative_divisions/kenya_administrative_divisions.dart';
import 'package:test/test.dart';

void main() {
  late MainController kad;
  setUp(() {
    kad = kenyaAdministrativeDivisions;
  });
  group('Get wards', () {
    test('No parameters passed', () {
      final List<Ward> result = kad.getWards();
      expect(result, isNotEmpty);
      expect(result.first, 'Port Reitz');
    });
    test('Invalid param passed as county code', () {
      expect(() => kad.getWards(countyCode: 0), throwsArgumentError);
      expect(() => kad.getWards(countyCode: 48), throwsArgumentError);
    });
    test('Valid param passed as county code', () {
      final List<Ward> result = kad.getWards(countyCode: 1);
      expect(result, isNotEmpty);
      expect(result.first, 'Port Reitz');
    });
    test('Invalid string passed as county name', () {
      expect(
          () => kad.getWards(countyName: 'Invalid name'), throwsArgumentError);
    });
    test('Valid string passed as county name', () {
      final List<Ward> result = kad.getWards(countyName: 'mombasa');
      expect(result, isNotEmpty);
      expect(result.first, 'Port Reitz');
    });
    test('Invalid string passed as constituency name', () {
      expect(() => kad.getWards(constituencyName: 'Invalid name'),
          throwsArgumentError);
    });
    test('Valid string passed as constituency name', () {
      List<Ward> result = kad.getWards(constituencyName: 'CHANGAMWE');
      expect(result.first, 'Port Reitz');
    });
  });
}
