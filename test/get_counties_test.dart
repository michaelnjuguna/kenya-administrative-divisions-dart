import 'package:kenya_administrative_divisions/src/models.dart';
import 'package:test/test.dart';
import 'package:kenya_administrative_divisions/kenya_administrative_divisions.dart';

void expectValidCounty(County county,
    {required int expectedCode, required String expectedName}) {
  expect(county, isA<County>());
  expect(county.countyCode, equals(expectedCode));
  expect(county.countyName, equals(expectedName));
}

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
      expectValidCounty(result.single,
          expectedCode: 1, expectedName: 'Mombasa');
    });
    test("Invalid number passed as param", () {
      expect(() => kad.getCounties(countyCode: 0), throwsArgumentError);
      expect(() => kad.getCounties(countyCode: 48), throwsArgumentError);
    });
    test('Valid string passed as param', () {
      final List<County> result = kad.getCounties(countyName: 'Mombasa');
      expect(result.length, equals(1));
      expectValidCounty(result.single,
          expectedCode: 1, expectedName: 'Mombasa');
    });
    test('Invalid string passed as param', () {
      final List<County> result = kad.getCounties(countyName: 'Invalid name');
      expect(result, isList);
      expect(result.length, equals(0));
    });
  });
}
