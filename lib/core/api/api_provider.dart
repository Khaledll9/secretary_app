import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api_consumer.dart';
import 'dio_consumer.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final apiConsumerProvider = Provider<ApiConsumer>((ref) {
  final dio = ref.watch(dioProvider);
  return DioConsumer(dio: dio);
});
