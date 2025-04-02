import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resplash/data/models/photo.dart';
import 'package:resplash/data/repositories/collection_repository.dart';

part 'collection_event.dart';
part 'collection_state.dart';
part 'collection_bloc.freezed.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  final CollectionRepository _collectionRepository;
  
  CollectionBloc({required CollectionRepository collectionRepository})
      : _collectionRepository = collectionRepository,
        super(const CollectionState.initial()) {
    on<CollectionFetched>(_onCollectionFetched);
    on<CollectionRefreshed>(_onCollectionRefreshed);
    on<CollectionLoadMore>(_onCollectionLoadMore);
  }

  Future<void> _onCollectionFetched(
    CollectionFetched event,
    Emitter<CollectionState> emit,
  ) async {
    emit(const CollectionState.loading());
    
    try {
      final collections = await _collectionRepository.getCollections(
        page: 1,
        perPage: 10,
      );
      
      emit(CollectionState.loaded(
        collections: collections,
        hasReachedMax: collections.length < 10,
        page: 1,
      ));
    } catch (e) {
      emit(CollectionState.error(message: e.toString()));
    }
  }

  Future<void> _onCollectionRefreshed(
    CollectionRefreshed event,
    Emitter<CollectionState> emit,
  ) async {
    emit(const CollectionState.loading());
    
    try {
      final collections = await _collectionRepository.getCollections(
        page: 1,
        perPage: 10,
      );
      
      emit(CollectionState.loaded(
        collections: collections,
        hasReachedMax: collections.length < 10,
        page: 1,
      ));
    } catch (e) {
      emit(CollectionState.error(message: e.toString()));
    }
  }

  Future<void> _onCollectionLoadMore(
    CollectionLoadMore event,
    Emitter<CollectionState> emit,
  ) async {
    final currentState = state;
    
    if (currentState is! CollectionLoadedState) return;
    if (currentState.isLoading || currentState.hasReachedMax) return;
    
    emit(currentState.copyWith(isLoading: true));
    
    try {
      final nextPage = currentState.page + 1;
      final moreCollections = await _collectionRepository.getCollections(
        page: nextPage,
        perPage: 10,
      );
      
      if (moreCollections.isEmpty) {
        emit(currentState.copyWith(
          isLoading: false,
          hasReachedMax: true,
        ));
      } else {
        emit(CollectionState.loaded(
          collections: [...currentState.collections, ...moreCollections],
          hasReachedMax: moreCollections.length < 10,
          page: nextPage,
          isLoading: false,
        ));
      }
    } catch (e) {
      emit(CollectionState.error(message: e.toString()));
    }
  }
} 