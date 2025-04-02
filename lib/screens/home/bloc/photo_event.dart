part of 'photo_bloc.dart';

@freezed
class PhotoEvent with _$PhotoEvent {
  const factory PhotoEvent.fetched() = PhotoFetched;
  const factory PhotoEvent.refreshed() = PhotoRefreshed;
  const factory PhotoEvent.loadMore() = PhotoLoadMore;
} 