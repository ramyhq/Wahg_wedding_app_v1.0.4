import 'package:dartz/dartz.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';
import 'package:wahg_v1/features/domain/entities/makeup_artist_entity.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import 'package:wahg_v1/features/domain/respositories/hall_repository.dart';
import 'package:wahg_v1/features/domain/respositories/makeup_artist_repository.dart';
import '../datasource/remote/firebase_datasource.dart';

class MakeupArtistRepositoryImp implements MakeupArtistRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  MakeupArtistRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<MakeupArtist>>> getMakeupArtistList() async{
    try {
      final list = await remoteDataSource.getMakeupArtistList();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure('[ServerFailure ❌] > MakeupArtistRepositoryImp > in getMakeupArtistList() :$e'));
    }
  }

}
