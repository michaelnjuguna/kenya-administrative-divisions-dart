import 'package:kenya_administrative_divisions/src/models.dart';
import 'package:kenya_administrative_divisions/src/core/params.dart';

class GetCounties {
  final List<County> data;
  final GetCountiesParams? params;
  GetCounties({required this.data, this.params});
  List<County> call() {
    try {
      final args = params;
      if (args == null) {
        return data;
      }
      if (args.countyCode != null) {}
    } catch (e) {
      throw Exception('GetCounties failed: $e');
    }
    return [];
  }
}
