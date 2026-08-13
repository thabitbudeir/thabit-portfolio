import 'dart:convert';
import 'package:http/http.dart' as http;


class VisitorCounterService {
  VisitorCounterService._();

  static const String _endpoint =
      'https://portfolio-visitor-counter.thabitbudeir0.workers.dev/visit';

  static Future<int?> fetchCount() async {
    try {
      final response = await http
          .get(Uri.parse(_endpoint))
          .timeout(const Duration(seconds: 8));
      if (response.statusCode != 200) return null;
      final body = jsonDecode(response.body);
      if (body is! Map<String, dynamic>) return null;
      final data = body['data'];
      if (data is! Map<String, dynamic>) return null;
      final count = data['up_count'];
      if (count is! num) return null;
      return count.toInt();
    } catch (_) {
      return null;
    }
  }
}
