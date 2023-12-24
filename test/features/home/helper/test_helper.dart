// import 'package: mockito/anota';

import 'package:mockito/annotations.dart';
import 'package:recipe_app/features/home/domain/repositories/home_repository.dart';

@GenerateMocks(
  [
    HomeRepository,
  ],
)
void main() {}
