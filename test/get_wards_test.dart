import 'package:kenya_administrative_divisions/kenya_administrative_divisions.dart';
import 'package:kenya_administrative_divisions/src/models.dart';
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
  });
}
