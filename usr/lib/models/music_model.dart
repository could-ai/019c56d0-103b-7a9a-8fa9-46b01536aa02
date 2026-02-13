class Song {
  final String id;
  final String title;
  final String artist;
  final String albumArtUrl;
  final String duration;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.albumArtUrl,
    required this.duration,
  });
}

class Album {
  final String id;
  final String title;
  final String artist;
  final String coverUrl;
  final List<Song> songs;

  Album({
    required this.id,
    required this.title,
    required this.artist,
    required this.coverUrl,
    required this.songs,
  });
}

class MockData {
  static List<Song> get trendingSongs => [
        Song(
          id: '1',
          title: 'Midnight City',
          artist: 'M83',
          albumArtUrl: 'https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?q=80&w=300&auto=format&fit=crop',
          duration: '4:03',
        ),
        Song(
          id: '2',
          title: 'Blinding Lights',
          artist: 'The Weeknd',
          albumArtUrl: 'https://images.unsplash.com/photo-1619983081563-430f63602796?q=80&w=300&auto=format&fit=crop',
          duration: '3:20',
        ),
        Song(
          id: '3',
          title: 'Levitating',
          artist: 'Dua Lipa',
          albumArtUrl: 'https://images.unsplash.com/photo-1493225255756-d9584f8606e9?q=80&w=300&auto=format&fit=crop',
          duration: '3:23',
        ),
        Song(
          id: '4',
          title: 'Save Your Tears',
          artist: 'The Weeknd',
          albumArtUrl: 'https://images.unsplash.com/photo-1621360841013-c768371e93cf?q=80&w=300&auto=format&fit=crop',
          duration: '3:35',
        ),
      ];

  static List<Album> get featuredAlbums => [
        Album(
          id: 'a1',
          title: 'Neon Nights',
          artist: 'Synthwave Collective',
          coverUrl: 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?q=80&w=400&auto=format&fit=crop',
          songs: trendingSongs,
        ),
        Album(
          id: 'a2',
          title: 'Deep Focus',
          artist: 'Ambient Sounds',
          coverUrl: 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?q=80&w=400&auto=format&fit=crop',
          songs: trendingSongs,
        ),
        Album(
          id: 'a3',
          title: 'Workout Hits',
          artist: 'Fitness Pro',
          coverUrl: 'https://images.unsplash.com/photo-1534258936925-c48947387e3b?q=80&w=400&auto=format&fit=crop',
          songs: trendingSongs,
        ),
        Album(
          id: 'a4',
          title: 'Jazz Vibes',
          artist: 'Smooth Trio',
          coverUrl: 'https://images.unsplash.com/photo-1514525253440-b393452e8d26?q=80&w=400&auto=format&fit=crop',
          songs: trendingSongs,
        ),
      ];
}
