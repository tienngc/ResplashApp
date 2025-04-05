import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resplash/configs/di/service_locator.dart';
import 'package:resplash/data/repositories/photo_repository.dart';
import 'package:resplash/data/unsplash_rest_api.dart';
import 'package:resplash/screens/tabview/photo/widget/photo_item_widget.dart';

import 'bloc/photo_bloc.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeTabView();
  }
}

class _HomeTabView extends StatefulWidget {
  const _HomeTabView();

  @override
  State<_HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<_HomeTabView> {
  final ScrollController _scrollController = ScrollController();
  late PhotoBloc _photoBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _photoBloc = PhotoBloc(photoRepository: PhotoRepositoryImpl(getIt<UnsplashRestApi>()))..add(PhotoEvent.fetched());
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<PhotoBloc>().add(const PhotoEvent.loadMore());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll - 500);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _photoBloc,
      child: BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (photos, hasReachedMax, page, isLoading) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<PhotoBloc>().add(const PhotoEvent.refreshed());
                  return;
                },
                child: ListView.builder(
                  itemCount: photos.length,
                  cacheExtent: 200,
                  itemBuilder: (context, index) {
                    return PhotoItemWidget(photo: photos[index]);
                  },
                ),
              );
            },
            error: (message) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectableText.rich(
                      TextSpan(
                        text: 'Error: $message',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<PhotoBloc>().add(const PhotoEvent.refreshed());
                      },
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
    // return Text("Home");
  }
}
