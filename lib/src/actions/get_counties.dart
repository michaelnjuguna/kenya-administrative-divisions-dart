import 'package:kenya_administrative_divisions/src/models.dart';
import 'package:kenya_administrative_divisions/src/core/params.dart';

class GetCounties {
  final List<County> data;
  final GetCountiesParams? params;
  GetCounties({required this.data, this.params});
  List<County> execute() {
    try {
      final args = params;
      if (args == null ||
          (args.countyCode == null && args.countyName == null)) {
        return data;
      }
      if (args.countyCode != null) {
        final code = args.countyCode!;
        if (code < 1 || code > 47) {
          throw ArgumentError('CountyCode must be between 1 and 47');
        }
        return [data[code - 1]];
      }
      if (args.countyName != null) {
        final county = data.where((c) =>
            c.countyName.toLowerCase() == args.countyName!.toLowerCase());

        return county.toList();
      }

      return [];
    } on ArgumentError {
      rethrow;
    } catch (e, st) {
      throw Exception('GetCounties failed: $e\n$st');
    }
  }
}
