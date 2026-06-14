import 'dart:io';
import 'dart:convert';
import 'package:kenya_administrative_divisions/src/actions/get_constituencies.dart';
import 'package:kenya_administrative_divisions/src/actions/get_counties.dart';
import 'package:kenya_administrative_divisions/src/actions/get_wards.dart';
// import 'package:kenya_administrative_divisions/src/core/params.dart';
import 'package:kenya_administrative_divisions/src/models.dart';
import 'package:path/path.dart' as path;

class MainController {
  late final List<County> _data;

  MainController() {
    final filePath =
        path.join(Directory.current.path, 'lib/src/core/county.json');
    try {
      final file = File(filePath).readAsStringSync();
      final List<dynamic> dataList = json.decode(file);
      _data = dataList.map((e) => County.fromJson(e)).toList();
    } catch (e, st) {
      throw Exception('Error reading JSON file: $e\n$st');
    }
  }

  // Get all
// TODO: Helper methods
  List<County> get getAll {
    return _data;
  }

  List<String> get getCountyNames {
    try {
      return _data.map((county) => county.countyName).toList();
    } catch (e) {
      throw Exception('Error getting county names: $e');
    }
  }

  List<String> getConstituencyNames({int? countyCode, String? countyName}) {
    try {
      if (countyCode != null) {
        final index = countyCode - 1;
        if (index < 0 || index >= _data.length) {
          throw ArgumentError('Invalid county code: $countyCode');
        }

        return _data[index]
            .constituencies
            .map((c) => c.constituencyName)
            .toList();
      }
      if (countyName != null) {
        final county = _data.firstWhere(
          (c) => c.countyName.toLowerCase() == countyName.toLowerCase(),
          orElse: () => throw ArgumentError('County not found: $countyName'),
        );
        return county.constituencies.map((c) => c.constituencyName).toList();
      }
      return _data
          .expand((c) => c.constituencies)
          .map((con) => con.constituencyName)
          .toList();
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw Exception('Error getting constituency names: $e');
    }
  }

  List<County> getCounties({int? countyCode, String? countyName}) {
    return GetCounties(
      data: _data,
      params: (countyCode: countyCode, countyName: countyName),
    ).execute();
  }

  List<Constituency> getConstituencies(
      {int? countyCode, String? countyName, String? constituencyName}) {
    return GetConstituencies(data: _data, params: (
      countyCode: countyCode,
      countyName: countyName,
      constituencyName: constituencyName,
    )).execute();
  }

  List<Ward> getWards(
      {int? countyCode, String? countyName, String? constituencyName}) {
    return GetWards(data: _data, params: (
      countyCode: countyCode,
      countyName: countyName,
      constituencyName: constituencyName
    )).execute();
  }
}

final kenyaAdministrativeDivisions = MainController();
