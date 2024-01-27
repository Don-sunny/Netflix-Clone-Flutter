import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_project/domain/core/failures/main_failure.dart';
import 'package:netflix_project/domain/downloads/i_downlodas_repo.dart';
import 'package:netflix_project/domain/downloads/models/downloads.dart';
import 'package:netflix_project/domain/search/i_search_repository.dart';
import 'package:netflix_project/domain/search/model/search_response/search_response.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsRepo;

  final SearchService _searchService;

  SearchBloc(this._downloadsRepo, this._searchService)
      : super(SearchState.initial()) {
    /*
  idle state
  */
    on<Initialize>((event, emit) async {
      // get trending
      if (state.idleList.isNotEmpty) {
        emit(state);
        return;
      }
      final _result = await _downloadsRepo.getDownloadsImage();
      emit(const SearchState(
        searchResultList: [],
        idleList: [],
        isLoading: true,
        isError: false,
      ));
      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
              searchResultList: [],
              idleList: [],
              isLoading: false,
              isError: true);
        },
        (List<Downloads> list) {
          return SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false,
          );
        },
      );

      emit(_state);
      //show to ui
    });

    /*
   search result state
  */

    on<SearchMovie>((event, emit) async {
      emit(SearchState(
        searchResultList: [],
        idleList: state.idleList,
        isLoading: true,
        isError: false,
      ));
      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      print(_result);
      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
              searchResultList: [],
              idleList: [],
              isLoading: false,
              isError: true);
        },
        (SearchResponse r) {
          print("idel list state ${state.idleList}");
          return SearchState(
            searchResultList: r.results,
            idleList: state.idleList,
            isLoading: false,
            isError: false,
          );
        },
      );
      print(_result);
      emit(_state);

      // show to ui
    });
  }
}
