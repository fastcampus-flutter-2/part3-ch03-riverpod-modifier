import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final tmpProvider = StateProvider.family(
  (ref, int arg) => arg + 0,
);

final idStateProvider = StateProvider(
  (ref) => 1,
);

final postFutureProviderFamily = FutureProvider.family((ref, int id) async {
  final response = await http
      .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"));

  if (response.statusCode == 200) {
    return response.body;
  }
});
