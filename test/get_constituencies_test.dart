import 'package:kenya_administrative_divisions/src/models.dart';
import 'package:test/test.dart';
import 'package:kenya_administrative_divisions/kenya_administrative_divisions.dart';

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
  });
}
