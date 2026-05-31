import 'package:kenya_administrative_divisions/src/core/params.dart';
import 'package:kenya_administrative_divisions/src/models.dart';

class GetConstituencies {
  final List<County> data;
  final GetConstituenciesParams? params;
  GetConstituencies({required this.data, this.params});
  List<Constituency> call() {
    try {
      final args = params;
      if (args == null ||
          (args.countyCode == null &&
              args.constituencyName == null &&
              args.countyName == null)) {
        return data.expand((county) => county.constituencies).toList();
      }
      return [];
    } on ArgumentError {
      rethrow;
    } catch (e, st) {
      throw Exception('GetConstituencies failed: $e\n$st');
    }
  }
}
