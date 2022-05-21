import 'package:dartz/dartz.dart';
import 'package:portfolio/app/core/failures.dart';
import 'package:portfolio/app/modules/home/domain/entities/home_entity.dart';
import 'package:portfolio/app/modules/home/domain/repositories/i_home_repository.dart';
import 'package:portfolio/app/modules/home/infra/datasources/i_home_datasource.dart';

class HomeRepository implements IHomeRepository {
  final IHomeDatasource _datasource;

  HomeRepository({
    required IHomeDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<Either<Failure, HomeEntity>> getHome() async {
    try {
      final data = await _datasource.getHome();

      return Right(data);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
