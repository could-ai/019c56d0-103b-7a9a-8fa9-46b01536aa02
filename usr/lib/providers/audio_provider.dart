import 'package:flutter/material.dart';
import '../models/music_model.dart';

class AudioProvider extends ChangeNotifier {
  Song? _currentSong;
  bool _isPlaying = false;
  double _progress = 0.0; // 0.0 to 1.0

  Song? get currentSong => _currentSong;
  bool get isPlaying => _isPlaying;
  double get progress => _progress;

  void playSong(Song song) {
    _currentSong = song;
    _isPlaying = true;
    notifyListeners();
    // In a real app, we would start the audio player here
  }

  void togglePlayPause() {
    if (_currentSong != null) {
      _isPlaying = !_isPlaying;
      notifyListeners();
    }
  }

  void nextSong() {
    // Mock next song logic
    // In real app, check playlist index
    notifyListeners();
  }

  void previousSong() {
    // Mock prev song logic
    notifyListeners();
  }
  
  void seek(double value) {
    _progress = value;
    notifyListeners();
  }
}
