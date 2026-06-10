import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  final FlutterTts _tts = FlutterTts();
  
  Future<void> initialize() async {
    await _tts.setLanguage('es-ES');
    await _tts.setSpeechRate(0.5);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.1);
  }
  
  Future<void> speak(String text, {double? rate, double? pitch}) async {
    if (rate != null) await _tts.setSpeechRate(rate);
    if (pitch != null) await _tts.setPitch(pitch);
    
    await _tts.speak(text);
    
    // Reset to defaults
    await _tts.setSpeechRate(0.5);
    await _tts.setPitch(1.1);
  }
  
  Future<void> speakLetter(String letter) async {
    await _tts.speak('Letra $letter');
  }
  
  Future<void> speakWord(String word) async {
    await _tts.speak(word);
  }
  
  Future<void> speakSlowly(String text) async {
    await _tts.setSpeechRate(0.3);
    await _tts.speak(text);
    await _tts.setSpeechRate(0.5);
  }
  
  Future<void> stop() async {
    await _tts.stop();
  }
}
