import 'package:test/test.dart';
import 'package:kenya_administrative_divisions/kenya_administrative_divisions.dart';

import 'test_utils.dart';

void main() {
  late MainController kad;
  setUp(() {
    kad = kenyaAdministrativeDivisions;
  });
  group('Get constituencies', () {
    test('No parameter passed', () {
      final List<Constituency> result = kad.getConstituencies();
      expect(result, isNotEmpty);
    });
    test('Invalid county code passed as param', () {
      expect(() => kad.getConstituencies(countyCode: 0), throwsArgumentError);
      expect(() => kad.getConstituencies(countyCode: 48), throwsArgumentError);
    });
    test('Valid county code passed as param', () {
      final List<Constituency> result = kad.getConstituencies(countyCode: 1);
      expect(result.length, equals(6));
      expectValidConstituency(result.first, name: 'Changamwe');
      expect(result.first.constituencyName, 'Changamwe');
    });
    test('Invalid string passed as county name', () {
      expect(() => kad.getConstituencies(countyName: 'Invalid name'),
          throwsArgumentError);
    });
    test('Valid county name passed', () {
      final List<Constituency> result =
          kad.getConstituencies(countyName: 'mombasa');
      expect(result.length, equals(6));
      expectValidConstituency(result.first, name: 'Changamwe');
    });
    test('Invalid constituency name passed ', () {
      expect(() => kad.getConstituencies(constituencyName: 'Invalid name'),
          throwsArgumentError);
    });
    test('Valid constituency name passed', () {
      final List<Constituency> result =
          kad.getConstituencies(constituencyName: 'Changamwe');
      expect(result.length, equals(1));
      expectValidConstituency(result.single, name: 'Changamwe');
    });
  });
}
