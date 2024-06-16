import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itunes/src/viewmodel/itunes_viewmodel.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext contex) {
    final result = ref.watch(iTunesViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('iTunes Songs'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (value) {
                ref
                    .read(iTunesViewModelProvider.notifier)
                    .fetchItunesData(entity: value);
              },
              decoration: InputDecoration(
                labelText: 'Search Entity',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // Text(result.length.toString()),
          Expanded(
              child: result.when(
            data: (response) => ListView.builder(
              itemCount: response.length,
              itemBuilder: (context, index) {
                final data = response[index];
                return ListTile(
                  leading: Image.network(data.artworkUrl60!),
                  title: Text(data.trackName ?? '00000'),
                  subtitle: Text(data.artistName ?? 'dede'),
                );
              },
            ),
            error: (error, stack) => Center(child: Text('Error: $error')),
            loading: () => Center(child: CircularProgressIndicator()),
          ))
        ],
      ),
    );
  }
}
