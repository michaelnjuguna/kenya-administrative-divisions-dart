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
      if (args?.countyCode != null) {
        final code = args!.countyCode!;
        if (code < 1 || code > 47) {
          throw ArgumentError('CountyCode must be between 1 and 47');
        }
        final wards =
            data[code - 1].constituencies.expand((c) => c.wards).toList();
        return wards;
      }
      if (args?.countyName != null) {
        County county = data.firstWhere(
            (c) =>
                c.countyName.toLowerCase() == args?.countyName!.toLowerCase(),
            orElse: () =>
                throw ArgumentError('County "${args?.countyName}" not found'));
        final result = county.constituencies.expand((c) => c.wards).toList();
        return result;
      }
      if (args?.constituencyName != null) {
        final Constituency constituency = data
            .expand((c) => c.constituencies)
            .firstWhere(
                (c) =>
                    c.constituencyName.toLowerCase() ==
                    args?.constituencyName!.toLowerCase(),
                orElse: () => throw ArgumentError(
                    'Constituency "${args?.constituencyName}" not found'));
        return constituency.wards;
      }
      return data
          .expand((county) => county.constituencies
              .expand((constituency) => constituency.wards))
          .toList();
    } on ArgumentError {
      rethrow;
    } catch (e, st) {
      throw Exception('GetWards failed: $e\n$st');
    }
  }
}
