import 'package:kenya_administrative_divisions/src/models.dart';
import 'package:test/test.dart';

void expectValidCounty(County county,
    {required int expectedCode, required String expectedName}) {
  expect(county, isA<County>());
  expect(county.countyCode, equals(expectedCode));
  expect(county.countyName, equals(expectedName));
  expect(county.constituencies, isList);
}

void expectValidConstituency(Constituency constituency,
    {required String name}) {
  expect(constituency, isA<Constituency>());
  expect(constituency.constituencyName, name);
}
