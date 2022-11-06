import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fundamental_flutter/model/response_restourant.dart';
import 'package:fundamental_flutter/model/restourant_model.dart';
import 'package:fundamental_flutter/utils/constans.dart';
import 'package:fundamental_flutter/utils/dummy_resto.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late ResponseRestourant restourants;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: Constans.baseUrl));
    dioAdapter = DioAdapter(dio: dio);
    restourants = ResponseRestourant(
        error: false,
        message: "success",
        count: 20,
        restaurants: [
          Restaurants(
              id: 'rqdv5juczeskfw1e867',
              name: 'Melting Pot',
              description:
                  'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.',
              city: 'Medan',
              pictureId: '14',
              rating: 4.2)
        ]);
  });

  test('Check data resturants', () async {
    const path = Constans.restourantsUrl;

    dioAdapter.onGet(
      path,
      (server) => server.reply(
        200,
        result,
        delay: const Duration(seconds: 1),
      ),
    );

    final response = await dio.get(path);
    ResponseRestourant restourant = ResponseRestourant.fromJson(response.data);

    expect(restourant.restaurants![0].name,
        equals(restourants.restaurants![0].name));
  });
}
