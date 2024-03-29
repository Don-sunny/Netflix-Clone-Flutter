import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix_project/domain/core/failures/main_failure.dart';
import 'package:netflix_project/domain/downloads/i_downlodas_repo.dart';
import 'package:netflix_project/domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    on<_getDownloadIMage>((event, emit) async {
      if (state.downloads.isNotEmpty) {
        emit(state);
        return;
      }
      emit(
        state.copyWith(
          isLoading: true,
          downloadFailureOrSucessOption: none(),
        ),
      );

      final Either<MainFailure, List<Downloads>> downloadsOption =
          await _downloadsRepo.getDownloadsImage();
      print(downloadsOption.toString());
      emit(
        downloadsOption.fold(
          (failure) => state.copyWith(
            isLoading: false,
            downloadFailureOrSucessOption: Some(
              Left(failure),
            ),
          ),
          (sucess) => state.copyWith(
            isLoading: false,
            downloads: sucess,
            downloadFailureOrSucessOption: Some(
              Right(sucess),
            ),
          ),
        ),
      );
    });
  }
}
