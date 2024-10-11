import 'package:kenya_administrative_divisions/kenya_administrative_divisions.dart';

void main() {
  var kenyaAdmin = KenyaAdministrativeDivisionsBase();

  // Get all
  print('Get all ${kenyaAdmin.getAll}');

  // Counties
  print('counties ${kenyaAdmin.getCounties(3)}');

  // Constituencies
  print('Constituencies ${kenyaAdmin.getConstituencies('Westlands')}');

  // Wards
  print('Wards ${kenyaAdmin.getWards('Nairobi', "Lang'ata")}');
}
