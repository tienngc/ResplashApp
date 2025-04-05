part of 'photo_bloc.dart';

@freezed
class PhotoState with _$PhotoState {
  const factory PhotoState.initial() = PhotoInitialState;

  const factory PhotoState.loading() = PhotoLoadingState;

  const factory PhotoState.loaded({
    required List<Photo> photos,
    required bool hasReachedMax,
    required int page,
    @Default(false) bool isLoading,
  }) = PhotoLoadedState;

  const factory PhotoState.error({
    required String message,
  }) = PhotoErrorState;
}
