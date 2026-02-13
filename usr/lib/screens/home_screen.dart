import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/music_model.dart';
import '../widgets/album_card.dart';
import '../providers/audio_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            floating: true,
            title: const Text(
              'Good Evening',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.settings_outlined),
                onPressed: () {},
              ),
              const SizedBox(width: 16),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Featured Section
                  _buildSectionHeader(context, 'Featured Playlists'),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: MockData.featuredAlbums.length,
                      separatorBuilder: (context, index) => const SizedBox(width: 16),
                      itemBuilder: (context, index) {
                        final album = MockData.featuredAlbums[index];
                        return SizedBox(
                          width: 160,
                          child: AlbumCard(
                            album: album,
                            onTap: () {
                              // Auto play first song for demo
                              if (album.songs.isNotEmpty) {
                                Provider.of<AudioProvider>(context, listen: false)
                                    .playSong(album.songs.first);
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Recently Played / Trending
                  _buildSectionHeader(context, 'Trending Songs'),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: MockData.trendingSongs.length,
                    itemBuilder: (context, index) {
                      final song = MockData.trendingSongs[index];
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            song.albumArtUrl,
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                            errorBuilder: (c, o, s) => Container(color: Colors.grey, width: 48, height: 48),
                          ),
                        ),
                        title: Text(song.title, style: const TextStyle(color: Colors.white)),
                        subtitle: Text(song.artist, style: TextStyle(color: Colors.grey[400])),
                        trailing: Text(song.duration, style: TextStyle(color: Colors.grey[600])),
                        onTap: () {
                          Provider.of<AudioProvider>(context, listen: false).playSong(song);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('See All'),
        ),
      ],
    );
  }
}
