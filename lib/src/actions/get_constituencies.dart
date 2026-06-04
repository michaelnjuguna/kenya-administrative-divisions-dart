import 'package:kenya_administrative_divisions/src/core/interfaces.dart';
import 'package:kenya_administrative_divisions/src/core/params.dart';
import 'package:kenya_administrative_divisions/src/models.dart';

class GetConstituencies implements Action<List<Constituency>> {
  final List<County> data;
  final GetConstituenciesParams? params;
  GetConstituencies({required this.data, this.params});
  @override
  List<Constituency> execute() {
    try {
      final args = params;
      if (args == null ||
          (args.countyCode == null &&
              args.constituencyName == null &&
              args.countyName == null)) {
        return data.expand((county) => county.constituencies).toList();
      }
      if (args.countyCode != null) {
        final code = args.countyCode!;
        if (code < 1 || code > 47) {
          throw ArgumentError('CountyCode must be between 1 and 47');
        }
        return data[code - 1].constituencies;
      }
      if (args.countyName != null) {
        final result = data.firstWhere(
            (d) => d.countyName.toLowerCase() == args.countyName!.toLowerCase(),
            orElse: () =>
                throw ArgumentError('County "${args.countyName}" not found'));

        return result.constituencies;
      }
      if (args.constituencyName != null) {
        final match = data.expand((county) => county.constituencies).where(
            (c) =>
                c.constituencyName.toLowerCase() ==
                args.constituencyName!.toLowerCase());
        if (match.isEmpty) {
          throw ArgumentError(
              'Constituency "${args.constituencyName}" not found ');
        }
        return match.toList();
      }
      return [];
    } on ArgumentError {
      rethrow;
    } catch (e, st) {
      throw Exception('GetConstituencies failed: $e\n$st');
    }
  }
}
