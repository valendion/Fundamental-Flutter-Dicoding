import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fundamental_flutter/utils/constans.dart';
import 'package:fundamental_flutter/utils/dummy_resto.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: Constans.baseUrl));
    dioAdapter = DioAdapter(dio: dio);
  });

  test('Check data resturants', () async {
    const path = Constans.restourantsUrl;

    dioAdapter.onGet(
      path,
      (server) => server.reply(
        200,
        result,
        // Reply would wait for one-sec before returning data.
        delay: const Duration(seconds: 1),
      ),
    );

    final response = await dio.get(path);

    expect(response.data, result);
  });
}
