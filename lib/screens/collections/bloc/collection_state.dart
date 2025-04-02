part of 'collection_bloc.dart';

@freezed
class CollectionState with _$CollectionState {
  const factory CollectionState.initial() = CollectionInitialState;
  
  const factory CollectionState.loading() = CollectionLoadingState;
  
  const factory CollectionState.loaded({
    required List<Collection> collections,
    required bool hasReachedMax,
    required int page,
    @Default(false) bool isLoading,
  }) = CollectionLoadedState;
  
  const factory CollectionState.error({
    required String message,
  }) = CollectionErrorState;
} 