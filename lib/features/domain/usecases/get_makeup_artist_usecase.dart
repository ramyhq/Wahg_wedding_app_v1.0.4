import 'package:dartz/dartz.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';
import 'package:wahg_v1/features/domain/entities/makeup_artist_entity.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import 'package:wahg_v1/features/domain/respositories/hall_repository.dart';
import 'package:wahg_v1/features/domain/respositories/makeup_artist_repository.dart';
import '../../../../commons/error/failure.dart';
import '../../../../const/app_enums.dart';

class GetMakeupArtistUseCase {
  final MakeupArtistRepository makeupArtistRepository;
  GetMakeupArtistUseCase({required this.makeupArtistRepository});

  Future<Either<Failure, List<MakeupArtist>>> getMakeupArtistList() {
    return makeupArtistRepository.getMakeupArtistList();
  }
}
