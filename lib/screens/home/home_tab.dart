import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:resplash/data/repositories/photo_repository.dart';
import 'package:resplash/screens/home/bloc/photo_bloc.dart';
import 'package:resplash/widgets/photo_grid.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotoBloc(
        photoRepository: GetIt.instance<PhotoRepository>(),
      )..add(const PhotoEvent.fetched()),
      child: const _HomeTabView(),
    );
  }
}

class _HomeTabView extends StatefulWidget {
  const _HomeTabView();

  @override
  State<_HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<_HomeTabView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
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
    return BlocBuilder<PhotoBloc, PhotoState>(
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
              child: PhotoGrid(
                photos: photos,
                scrollController: _scrollController,
                isLoading: isLoading,
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
    );
  }
} 