// import 'package: mockito/anota';

import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:recipe_app/features/home/domain/repositories/home_repository.dart';

@GenerateMocks([
  HomeRepository,
], customMocks: [
  MockSpec<Dio>(as: #MockDio),
])
void main() {}
