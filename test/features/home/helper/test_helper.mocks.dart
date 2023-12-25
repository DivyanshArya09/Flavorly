// Mocks generated by Mockito 5.4.4 from annotations
// in recipe_app/test/features/home/helper/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:recipe_app/core/error/failure.dart' as _i5;
import 'package:recipe_app/features/home/domain/entites/category_recipe_entity.dart'
    as _i6;
import 'package:recipe_app/features/home/domain/entites/Nutrients_recipe_entity.dart'
    as _i8;
import 'package:recipe_app/features/home/domain/entites/recommend_recipe_entity.dart'
    as _i7;
import 'package:recipe_app/features/home/domain/entites/random_recipe_entity.dart'
    as _i7;

import 'package:recipe_app/features/home/domain/repositories/home_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HomeRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeRepository extends _i1.Mock implements _i3.HomeRepository {
  MockHomeRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<
      _i2.Either<_i5.Failure, List<_i6.CategoryEntity>>> getCategoriesOfRecipes(
          String? cuisine) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCategories,
          [cuisine],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.CategoryEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.CategoryEntity>>(
          this,
          Invocation.method(
            #getCategories,
            [cuisine],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.CategoryEntity>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i7.RecommendRecipeEntity>>>
      getRecommendedRecipes(int? id) => (super.noSuchMethod(
            Invocation.method(
              #getRecommendation,
              [],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.Failure,
                        List<_i7.RecommendRecipeEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i7.RecommendRecipeEntity>>(
              this,
              Invocation.method(
                #getRecommendation,
                [],
              ),
            )),
          ) as _i4.Future<
              _i2.Either<_i5.Failure, List<_i7.RecommendRecipeEntity>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i8.NutrientRecipeEntity>>>
      getRecipesByNutrients(String? cuisine) => (super.noSuchMethod(
            Invocation.method(
              #getPopular,
              [cuisine],
            ),
            returnValue: _i4.Future<
                    _i2
                    .Either<_i5.Failure, List<_i8.NutrientRecipeEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i8.NutrientRecipeEntity>>(
              this,
              Invocation.method(
                #getPopular,
                [cuisine],
              ),
            )),
          ) as _i4
              .Future<_i2.Either<_i5.Failure, List<_i8.NutrientRecipeEntity>>>);

  @override
  _i4.Future<
      _i2.Either<_i5.Failure, List<_i7.RandomRecipeEntity>>> getRandomRecipes(
          int? number) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRandom,
          [],
        ),
        returnValue: _i4.Future<
                _i2.Either<_i5.Failure, List<_i7.RandomRecipeEntity>>>.value(
            _FakeEither_0<_i5.Failure, List<_i7.RandomRecipeEntity>>(
          this,
          Invocation.method(
            #getRandom,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i7.RandomRecipeEntity>>>);
}
