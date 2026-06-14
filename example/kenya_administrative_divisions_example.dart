import 'package:kenya_administrative_divisions/kenya_administrative_divisions.dart';

void main() {
  final kad = kenyaAdministrativeDivisions;
  // Get All the data
  final List<County> counties = kad.getAll;

// Get county names
  final List<String> countyNames = kad.getCountyNames;
// Get constituency names
  final List<String> constituencyNames = kad.getConstituencyNames();
  final List<String> constituencyNamesByCountyName =
      kad.getConstituencyNames(countyName: 'Mombasa');
  final List<String> constituencyNamesByCountyCode =
      kad.getConstituencyNames(countyCode: 1);
  final List<County> allCounties = kad.getCounties();
  final List<County> county = kad.getCounties(countyCode: 1);
  final List<County> mombasa = kad.getCounties(countyName: 'Mombasa');
  final List<Constituency> constituencies = kad.getConstituencies();
  final List<Constituency> mombasaConstituencies =
      kad.getConstituencies(countyCode: 1);
  final List<Constituency> mombasaConstituenciesByCountyName =
      kad.getConstituencies(countyName: 'mombasa');
  final List<Ward> wards = kad.getWards();
  final List<Ward> mombasaWards = kad.getWards(countyCode: 1);
  final List<Ward> mombasaWardsByCountyName =
      kad.getWards(countyName: 'mombasa');
  List<Ward> changamweWards = kad.getWards(constituencyName: 'changamwe');
}
