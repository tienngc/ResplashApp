part of 'collection_bloc.dart';

@freezed
class CollectionEvent with _$CollectionEvent {
  const factory CollectionEvent.fetched() = CollectionFetched;
  const factory CollectionEvent.refreshed() = CollectionRefreshed;
  const factory CollectionEvent.loadMore() = CollectionLoadMore;
} 