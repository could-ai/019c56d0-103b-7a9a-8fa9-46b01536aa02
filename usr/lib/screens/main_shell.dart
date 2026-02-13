import 'package:flutter/material.dart';
import '../widgets/player_bar.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'library_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const LibraryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Use LayoutBuilder to determine if we should show bottom nav or side nav
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth > 800;

        return Scaffold(
          backgroundColor: const Color(0xFF121212),
          body: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    if (isWideScreen)
                      _buildSideNav(),
                    Expanded(
                      child: _screens[_selectedIndex],
                    ),
                  ],
                ),
              ),
              // Persistent Player Bar
              const PlayerBar(),
              // Bottom Nav for mobile only
              if (!isWideScreen)
                BottomNavigationBar(
                  currentIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                  backgroundColor: const Color(0xFF121212),
                  selectedItemColor: Colors.greenAccent,
                  unselectedItemColor: Colors.grey,
                  type: BottomNavigationBarType.fixed,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_filled),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.library_music),
                      label: 'Library',
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSideNav() {
    return Container(
      width: 250,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: const [
                Icon(Icons.music_note, color: Colors.white, size: 32),
                SizedBox(width: 8),
                Text(
                  'MusicStream',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          _buildSideNavItem(0, Icons.home_filled, 'Home'),
          _buildSideNavItem(1, Icons.search, 'Search'),
          _buildSideNavItem(2, Icons.library_music, 'Your Library'),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'PLAYLISTS',
              style: TextStyle(color: Colors.grey, fontSize: 12, letterSpacing: 1.5),
            ),
          ),
          _buildPlaylistItem('Liked Songs'),
          _buildPlaylistItem('Daily Mix 1'),
          _buildPlaylistItem('Discover Weekly'),
        ],
      ),
    );
  }

  Widget _buildSideNavItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.grey,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () => setState(() => _selectedIndex = index),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
    );
  }

  Widget _buildPlaylistItem(String title) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.grey),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      dense: true,
      onTap: () {},
    );
  }
}
