import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:resplash/data/repositories/collection_repository.dart';
import 'package:resplash/screens/collections/bloc/collection_bloc.dart';
import 'package:resplash/screens/collections/collection_card.dart';

class CollectionsTab extends StatelessWidget {
  const CollectionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CollectionBloc(
        collectionRepository: GetIt.instance<CollectionRepository>(),
      )..add(const CollectionEvent.fetched()),
      child: const _CollectionsTabView(),
    );
  }
}

class _CollectionsTabView extends StatefulWidget {
  const _CollectionsTabView();

  @override
  State<_CollectionsTabView> createState() => _CollectionsTabViewState();
}

class _CollectionsTabViewState extends State<_CollectionsTabView> {
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
      context.read<CollectionBloc>().add(const CollectionEvent.loadMore());
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
    return BlocBuilder<CollectionBloc, CollectionState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (collections, hasReachedMax, page, isLoading) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<CollectionBloc>().add(const CollectionEvent.refreshed());
                return;
              },
              child: collections.isEmpty && !isLoading
                  ? const Center(child: Text('No collections found'))
                  : ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(16),
                      itemCount: collections.length + (isLoading ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == collections.length) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        
                        final collection = collections[index];
                        return CollectionCard(collection: collection);
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
                      context.read<CollectionBloc>().add(const CollectionEvent.refreshed());
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