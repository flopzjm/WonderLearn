import 'package:just_audio/just_audio.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AudioManager {
  final AudioPlayer _bgMusicPlayer = AudioPlayer();
  final AudioPlayer _sfxPlayer = AudioPlayer();
  final FlutterTts _tts = FlutterTts();
  
  bool _isInitialized = false;
  
  Future<void> initialize() async {
    if (_isInitialized) return;
    
    await _tts.setLanguage('es-ES');
    await _tts.setSpeechRate(0.5);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.1); // Slightly higher for kids
    
    _isInitialized = true;
  }
  
  // Background music
  Future<void> playBackgroundMusic(String assetPath) async {
    try {
      await _bgMusicPlayer.setAsset(assetPath);
      await _bgMusicPlayer.setLoopMode(LoopMode.all);
      await _bgMusicPlayer.setVolume(0.3);
      await _bgMusicPlayer.play();
    } catch (e) {
      print('Error playing background music: $e');
    }
  }
  
  Future<void> stopBackgroundMusic() async {
    await _bgMusicPlayer.stop();
  }
  
  // Sound effects
  Future<void> playCorrectSound() async {
    await _playSfx('assets/audio/sfx/correct.mp3');
  }
  
  Future<void> playIncorrectSound() async {
    await _playSfx('assets/audio/sfx/incorrect.mp3');
  }
  
  Future<void> playStarEarnedSound() async {
    await _playSfx('assets/audio/sfx/star_earned.mp3');
  }
  
  Future<void> playBadgeUnlockedSound() async {
    await _playSfx('assets/audio/sfx/badge_unlocked.mp3');
  }
  
  Future<void> playButtonTapSound() async {
    await _playSfx('assets/audio/sfx/button_tap.mp3');
  }
  
  Future<void> _playSfx(String assetPath) async {
    try {
      await _sfxPlayer.setAsset(assetPath);
      await _sfxPlayer.setVolume(0.8);
      await _sfxPlayer.play();
    } catch (e) {
      print('Error playing SFX: $e');
    }
  }
  
  // TTS (Text-to-Speech)
  Future<void> speak(String text) async {
    await _tts.speak(text);
  }
  
  Future<void> speakLetter(String letter) async {
    await _tts.speak('Letra $letter');
  }
  
  Future<void> speakWord(String word) async {
    await _tts.speak(word);
  }
  
  Future<void> speakStoryPage(String text) async {
    await _tts.setSpeechRate(0.4); // Slower for stories
    await _tts.speak(text);
    await _tts.setSpeechRate(0.5); // Reset to normal
  }
  
  Future<void> stopSpeaking() async {
    await _tts.stop();
  }
  
  // Play audio asset (for pre-recorded audio)
  Future<void> playAudioAsset(String assetPath) async {
    try {
      await _sfxPlayer.setAsset(assetPath);
      await _sfxPlayer.play();
    } catch (e) {
      // Fallback to TTS
      final words = assetPath.split('/').last.replaceAll('.mp3', '').split('_');
      await speak(words.join(' '));
    }
  }
  
  // Cleanup
  Future<void> dispose() async {
    await _bgMusicPlayer.dispose();
    await _sfxPlayer.dispose();
    await _tts.stop();
  }
}
