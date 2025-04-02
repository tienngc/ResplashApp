import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resplash/data/models/photo.dart';
import 'package:resplash/data/repositories/photo_repository.dart';

part 'photo_bloc.freezed.dart';
part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoRepository _photoRepository;

  PhotoBloc({required PhotoRepository photoRepository})
      : _photoRepository = photoRepository,
        super(const PhotoState.initial()) {
    on<PhotoFetched>(_onPhotoFetched);
    on<PhotoRefreshed>(_onPhotoRefreshed);
    on<PhotoLoadMore>(_onPhotoLoadMore);
  }

  Future<void> _onPhotoFetched(
    PhotoFetched event,
    Emitter<PhotoState> emit,
  ) async {
    emit(const PhotoState.loading());

    try {
      final photos = await _photoRepository.getPhotos(
        page: 1,
        perPage: 20,
        orderBy: 'latest',
      );

      emit(PhotoState.loaded(
        photos: photos,
        hasReachedMax: photos.length < 20,
        page: 1,
      ));
    } catch (e, stack) {
      print(stack);
      emit(PhotoState.error(message: e.toString()));
    }
  }

  Future<void> _onPhotoRefreshed(
    PhotoRefreshed event,
    Emitter<PhotoState> emit,
  ) async {
    emit(const PhotoState.loading());

    try {
      final photos = await _photoRepository.getPhotos(
        page: 1,
        perPage: 20,
        orderBy: 'latest',
      );

      emit(PhotoState.loaded(
        photos: photos,
        hasReachedMax: photos.length < 20,
        page: 1,
      ));
    } catch (e, stack) {
      print(stack);
      emit(PhotoState.error(message: e.toString()));
    }
  }

  Future<void> _onPhotoLoadMore(
    PhotoLoadMore event,
    Emitter<PhotoState> emit,
  ) async {
    final currentState = state;

    if (currentState is! PhotoLoadedState) return;
    if (currentState.isLoading || currentState.hasReachedMax) return;

    emit(currentState.copyWith(isLoading: true));

    try {
      final nextPage = currentState.page + 1;
      final morePhotos = await _photoRepository.getPhotos(
        page: nextPage,
        perPage: 20,
        orderBy: 'latest',
      );

      if (morePhotos.isEmpty) {
        emit(currentState.copyWith(
          isLoading: false,
          hasReachedMax: true,
        ));
      } else {
        emit(PhotoState.loaded(
          photos: [...currentState.photos, ...morePhotos],
          hasReachedMax: morePhotos.length < 20,
          page: nextPage,
          isLoading: false,
        ));
      }
    } catch (e) {
      emit(PhotoState.error(message: e.toString()));
    }
  }
}
