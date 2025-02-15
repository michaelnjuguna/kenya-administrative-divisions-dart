import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart' as path;

class KenyaAdministrativeDivisionsBase {
  late final List<dynamic> _data;

  KenyaAdministrativeDivisionsBase() {
    // Determine the absolute path to the county.json file
    // final scriptPath = Platform.script.toFilePath();
    // final scriptDir = path.dirname(scriptPath);

    // Adjust the path to point to lib/src/county.json
    final filePath = path.join(Directory.current.path, 'lib/src/county.json');

    // print(filePath);
    // print(path.join(Directory.current.path, 'lib'));
    // Read Json file
    try {
      final file = File(filePath);
      final jsonInfo = file.readAsStringSync();
      _data = json.decode(jsonInfo);
    } catch (e) {
      throw Exception('Error reading JSON file: $e');
    }
  }

  // Get all
  List<dynamic> get getAll {
    return _data;
  }

// Get counties
  dynamic getCounties([dynamic input]) {
    List<dynamic> counties = [];
    if (input == null) {
      for (var i = 0; i < 47; i++) {
        counties.add(_data[i]['county_name']);
      }
    } else if (input is int && input > 0 && input < 48) {
      return _data[input - 1];
    } else if (input is String) {
      String lowerCaseInput = input.toLowerCase();
      for (var county in _data) {
        if (county['county_name'].toLowerCase() == lowerCaseInput) {
          return county;
        }
      }
      throw ArgumentError('County not found');
    } else {
      throw ArgumentError('Invalid input type');
    }
    return counties.isNotEmpty
        ? counties
        : "Error: Invalid parameter provided. Please check your input and try again.";
  }

// Get constituencies
  dynamic getConstituencies([dynamic input]) {
    List<dynamic> constituencies = [];
    if (input == null) {
      for (var county in _data) {
        county['constituencies'].forEach((constituency) =>
            {constituencies.add(constituency['constituency_name'])});
      }
    } else if (input is int && input > 0 && input < 48) {
      _data[input - 1]['constituencies'].forEach((constituency) =>
          {constituencies.add(constituency['constituency_name'])});
    } else if (input is String) {
      var lowerCaseInput = input.toLowerCase();
      for (var county in _data) {
        for (var constituency in county['constituencies']) {
          if (constituency['constituency_name'].toLowerCase() ==
              lowerCaseInput) {
            return constituency;
          }
        }
      }
      throw ArgumentError('Constituency not found');
    } else {
      throw ArgumentError('Invalid input type');
    }
    return constituencies.isNotEmpty
        ? constituencies
        : "Error: Invalid parameter provided. Please check your input and try again.";
  }

// Get ward
  dynamic getWards([dynamic county, String? constituency]) {
    List<dynamic> wards = [];

    // When no input is provided
    if (county == null && constituency == null) {
      for (var county in _data) {
        for (var constituency in county['constituencies']) {
          wards.addAll(constituency['wards']);
        }
      }
    }
    // When only county code or name is provided
    else if (county != null && constituency == null) {
      if (county is int && county > 0 && county < 48) {
        for (var constituency in _data[county - 1]['constituencies']) {
          wards.addAll(constituency['wards']);
        }
      } else if (county is String) {
        for (var countyItem in _data) {
          if (countyItem['county_name'].toLowerCase() == county.toLowerCase()) {
            for (var constituency in countyItem['constituencies']) {
              wards.addAll(constituency['wards']);
            }
            break;
          }
        }
      }
    }
    // When only the constituency name is provided
    else if (county == null && constituency != null) {
      for (var county in _data) {
        for (var constituencyItem in county['constituencies']) {
          if (constituencyItem['constituency_name'].toLowerCase() ==
              constituency.toLowerCase()) {
            wards = constituencyItem['wards'];
            break;
          }
        }
      }
    }
    // When both the county name/code and the constituency name are provided
    else if (county != null && constituency != null) {
      if (county is int && county > 0 && county < 48) {
        for (var constituencyItem in _data[county - 1]['constituencies']) {
          if (constituencyItem['constituency_name'].toLowerCase() ==
              constituency.toLowerCase()) {
            wards = constituencyItem['wards'];
            break;
          }
        }
      } else if (county is String) {
        for (var countyItem in _data) {
          if (countyItem['county_name'].toLowerCase() == county.toLowerCase()) {
            for (var constituencyItem in countyItem['constituencies']) {
              if (constituencyItem['constituency_name'].toLowerCase() ==
                  constituency.toLowerCase()) {
                wards = constituencyItem['wards'];
                break;
              }
            }
            break;
          }
        }
      }
    }

    return wards.isNotEmpty
        ? wards
        : "Error: Invalid parameter provided. Please check your input and try again.";
  }
}

// void main() {
//   try {
//     // Create an instance of KenyaAdministrativeDivisionsBase
//     var kenyaAdminDivisions = KenyaAdministrativeDivisionsBase();

//     // Test getAll method
//     print('All Data:');
//     print(kenyaAdminDivisions.getAll);

//     // Test getCounties method with different inputs
//     print('\nAll Counties:');
//     print(kenyaAdminDivisions.getCounties());

//     print('\nCounty by Index (e.g., 1):');
//     print(kenyaAdminDivisions.getCounties(1));

//     print('\nCounty by Name (e.g., "Nairobi"):');
//     print(kenyaAdminDivisions.getCounties('Nairobi'));

//     // Test getConstituencies method with different inputs
//     print('\nAll Constituencies:');
//     print(kenyaAdminDivisions.getConstituencies());

//     print('\nConstituencies by County Index (e.g., 1):');
//     print(kenyaAdminDivisions.getConstituencies(1));

//     print('\nConstituency by Name (e.g., "Starehe"):');
//     print(kenyaAdminDivisions.getConstituencies('Starehe'));

//     // Test getWards method with different inputs
//     print('\nAll Wards:');
//     print(kenyaAdminDivisions.getWards());

//     print('\nWards by County Index (e.g., 1):');
//     print(kenyaAdminDivisions.getWards(1));

//     print('\nWards by County Name (e.g., "Nairobi"):');
//     print(kenyaAdminDivisions.getWards('Nairobi'));

//     print('\nWards by Constituency Name (e.g., "Starehe"):');
//     print(kenyaAdminDivisions.getWards(null, 'Starehe'));

//     print(
//         '\nWards by County Index and Constituency Name (e.g., 1, "Starehe"):');
//     print(kenyaAdminDivisions.getWards(1, 'Starehe'));

//     print(
//         '\nWards by County Name and Constituency Name (e.g., "Nairobi", "Starehe"):');
//     print(kenyaAdminDivisions.getWards('Nairobi', 'Starehe'));
//   } catch (e) {
//     print('Error: $e');
//   }
// }
