import 'package:kenya_administrative_divisions/kenya_administrative_divisions.dart';
import 'package:test/test.dart';

void main() {
  // group('A group of tests', () {
  //   final awesome = Awesome();

  //   setUp(() {
  //     // Additional setup goes here.
  //   });

  //   test('First Test', () {
  //     expect(awesome.isAwesome, isTrue);
  //   });
  // });

  late KenyaAdministrativeDivisionsBase adminDivisions;

  setUp(() {
    // Initialize the KenyaAdministrativeDivisionsBase instance before each test
    adminDivisions = KenyaAdministrativeDivisionsBase();
  });

  group('KenyaAdministrativeDivisionsBase Tests', () {
    test('Test getAll returns all counties', () {
      List<dynamic> allCounties = adminDivisions.getAll;
      expect(allCounties.length, equals(47));
    });

    test('Test getCounties with no input returns list of county names', () {
      List<dynamic> countyNames = adminDivisions.getCounties();
      expect(countyNames.length, equals(47));
      expect(countyNames[0], equals('Mombasa'));
    });

    test('Test getCounties with valid index returns correct county', () {
      var county = adminDivisions.getCounties(1);
      expect(county, isA<Map<String, dynamic>>());
      expect(county['county_name'], equals('Mombasa'));
    });

    test('Test getCounties with invalid index throws exception', () {
      expect(
          () => adminDivisions.getCounties(0), throwsA(isA<ArgumentError>()));
      expect(
          () => adminDivisions.getCounties(48), throwsA(isA<ArgumentError>()));
    });

    test('Test getCounties with valid name returns correct county', () {
      var county =
          adminDivisions.getCounties('mombasa'); // Replace with actual name
      expect(county, isA<Map<String, dynamic>>());
      expect(county['county_name'], equals('Mombasa'));
    });

    test('Test getCounties with invalid name throws exception', () {
      expect(() => adminDivisions.getCounties('Thika'),
          throwsA(isA<ArgumentError>()));
    });

    test('Test getConstituencies with no input returns all constituencies', () {
      List<dynamic> allConstituencies = adminDivisions.getConstituencies();
      // Replace 47 with the actual number of constituencies if known
      expect(allConstituencies.length, greaterThan(0));
    });

    test(
        'Test getConstituencies with valid county index returns constituencies',
        () {
      var constituencies = adminDivisions.getConstituencies(1);
      expect(constituencies, isA<List<dynamic>>());
      // Check if the first constituency name matches expected value
      expect(constituencies[0], equals('Changamwe')); // Replace accordingly
    });

    test('Test getConstituencies with invalid county index throws exception',
        () {
      expect(() => adminDivisions.getConstituencies(0),
          throwsA(isA<ArgumentError>()));
      expect(() => adminDivisions.getConstituencies(48),
          throwsA(isA<ArgumentError>()));
    });

    test('Test getWards with county name and constituency name returns wards',
        () {
      var wards = adminDivisions.getWards('Mombasa', 'Changamwe');
      expect(wards, isA<List<dynamic>>());
      // Check if the first ward name matches expected value
      expect(wards[0], equals('Port Reitz')); // Replace accordingly
    });

    test('Test getWards with invalid constituency name throws exception', () {
      var wards = adminDivisions.getWards('CountyName1', 'InvalidConstituency');
      expect(
          wards,
          equals(
              "Error: Invalid parameter provided. Please check your input and try again."));
    });
  });
}
