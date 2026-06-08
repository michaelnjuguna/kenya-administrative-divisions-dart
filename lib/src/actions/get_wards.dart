import 'package:kenya_administrative_divisions/src/core/interfaces.dart';
import 'package:kenya_administrative_divisions/src/core/params.dart';
import 'package:kenya_administrative_divisions/src/models.dart';

class GetWards implements Action {
  final List<County> data;
  final GetWardsParams? params;
  GetWards({required this.data, this.params});
  @override
  List<Ward> execute() {
    try {
      final args = params;
      if (args == null ||
          (args.countyCode == null &&
              args.constituencyName == null &&
              args.countyName == null)) {
        return data
            .expand((county) => county.constituencies
                .expand((constituency) => constituency.wards))
            .toList();
      }
      if (args.countyCode != null) {
        final code = args.countyCode!;
        if (code < 1 || code > 47) {
          throw ArgumentError('CountyCode must be between 1 and 47');
        }
        final wards =
            data[code - 1].constituencies.expand((c) => c.wards).toList();
        return wards;
      }
      return [];
    } on ArgumentError {
      rethrow;
    } catch (e, st) {
      throw Exception('GetWards failed: $e\n$st');
    }
  }
}
