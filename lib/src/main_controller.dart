import 'dart:io';
import 'dart:convert';
import 'package:kenya_administrative_divisions/src/actions/get_constituencies.dart';
import 'package:kenya_administrative_divisions/src/actions/get_counties.dart';
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
      constituencyName: constituencyName,
      countyCode: countyCode,
      countyName: countyName
    )).execute();
  }

// // Get ward
//   dynamic getWards([dynamic county, String? constituency]) {
//     List<dynamic> wards = [];

//     // When no input is provided
//     if (county == null && constituency == null) {
//       for (var county in _data) {
//         for (var constituency in county['constituencies']) {
//           wards.addAll(constituency['wards']);
//         }
//       }
//     }
//     // When only county code or name is provided
//     else if (county != null && constituency == null) {
//       if (county is int && county > 0 && county < 48) {
//         for (var constituency in _data[county - 1]['constituencies']) {
//           wards.addAll(constituency['wards']);
//         }
//       } else if (county is String) {
//         for (var countyItem in _data) {
//           if (countyItem['county_name'].toLowerCase() == county.toLowerCase()) {
//             for (var constituency in countyItem['constituencies']) {
//               wards.addAll(constituency['wards']);
//             }
//             break;
//           }
//         }
//       }
//     }
//     // When only the constituency name is provided
//     else if (county == null && constituency != null) {
//       for (var county in _data) {
//         for (var constituencyItem in county['constituencies']) {
//           if (constituencyItem['constituency_name'].toLowerCase() ==
//               constituency.toLowerCase()) {
//             wards = constituencyItem['wards'];
//             break;
//           }
//         }
//       }
//     }
//     // When both the county name/code and the constituency name are provided
//     else if (county != null && constituency != null) {
//       if (county is int && county > 0 && county < 48) {
//         for (var constituencyItem in _data[county - 1]['constituencies']) {
//           if (constituencyItem['constituency_name'].toLowerCase() ==
//               constituency.toLowerCase()) {
//             wards = constituencyItem['wards'];
//             break;
//           }
//         }
//       } else if (county is String) {
//         for (var countyItem in _data) {
//           if (countyItem['county_name'].toLowerCase() == county.toLowerCase()) {
//             for (var constituencyItem in countyItem['constituencies']) {
//               if (constituencyItem['constituency_name'].toLowerCase() ==
//                   constituency.toLowerCase()) {
//                 wards = constituencyItem['wards'];
//                 break;
//               }
//             }
//             break;
//           }
//         }
//       }
//     }

//     return wards.isNotEmpty
//         ? wards
//         : "Error: Invalid parameter provided. Please check your input and try again.";
//   }
}

final kenyaAdministrativeDivisions = MainController();
