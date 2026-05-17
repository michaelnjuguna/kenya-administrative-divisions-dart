import 'package:kenya_administrative_divisions/src/main_controller.dart';

void main() {
  // Get all
  print('Get all ${kenyaAdministrativeDivisions.getAll}');

  // Counties
  print('counties ${kenyaAdministrativeDivisions.getCounties(3)}');

  // Constituencies
  print(
      'Constituencies ${kenyaAdministrativeDivisions.getConstituencies('Westlands')}');

  // Wards
  print(
      'Wards ${kenyaAdministrativeDivisions.getWards('Nairobi', "Lang'ata")}');
}
