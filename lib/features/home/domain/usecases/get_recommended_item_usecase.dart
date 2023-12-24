import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/core/usecase/use_case.dart';
import 'package:recipe_app/features/home/domain/entites/recommended_entity.dart';
import 'package:recipe_app/features/home/domain/repositories/home_repository.dart';

class GetRecommendedItemUseCase
    implements UseCase<List<RecommendedEntity>, NoParams> {
  final HomeRepository homeRepository;

  GetRecommendedItemUseCase({required this.homeRepository});

  @override
  Future<Either<Failure, List<RecommendedEntity>>> call(NoParams params) {
    return homeRepository.getRecommendation();
  }
}
