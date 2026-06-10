import 'package:flutter/material.dart';

class SightWordsGameScreen extends StatefulWidget {
  const SightWordsGameScreen({super.key});

  @override
  State<SightWordsGameScreen> createState() => _SightWordsGameScreenState();
}

class _SightWordsGameScreenState extends State<SightWordsGameScreen> {
  final List<String> _words = [
    'the', 'be', 'to', 'of', 'and', 'a', 'in', 'that', 'have', 'I',
    'it', 'for', 'not', 'on', 'with', 'he', 'as', 'you', 'do', 'at',
    'this', 'but', 'his', 'by', 'from', 'they', 'we', 'say', 'her', 'she',
    'or', 'an', 'will', 'my', 'one', 'all', 'would', 'there', 'their', 'what',
    'so', 'up', 'out', 'if', 'about', 'who', 'get', 'which', 'go', 'me',
  ];

  int _currentWordIndex = 0;
  int _score = 0;
  List<String> _options = [];
  String? _selectedWord;
  bool _isCorrect = false;
  bool _showFeedback = false;

  @override
  void initState() {
    super.initState();
    _generateOptions();
  }

  void _generateOptions() {
    final currentWord = _words[_currentWordIndex];
    final otherWords = _words.where((w) => w != currentWord).toList()..shuffle();
    _options = [currentWord, ...otherWords.take(2)]..shuffle();
  }

  void _checkAnswer(String selected) {
    setState(() {
      _selectedWord = selected;
      _isCorrect = selected == _words[_currentWordIndex];
      _showFeedback = true;
      if (_isCorrect) _score++;
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _showFeedback = false;
          _selectedWord = null;
          if (_currentWordIndex < _words.length - 1) {
            _currentWordIndex++;
            _generateOptions();
          } else {
            _showResults();
          }
        });
      }
    });
  }

  void _showResults() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¡Juego completado!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Puntuación: $_score/${_words.length}'),
            const SizedBox(height: 8),
            Text('Estrellas: ${"⭐" * (_score >= 45 ? 3 : _score >= 30 ? 2 : 1)}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Volver al mapa'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6BCB77), Color(0xFFFFF8E1)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: (_currentWordIndex + 1) / _words.length,
                        backgroundColor: Colors.white.withOpacity(0.3),
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFFD93D)),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '$_score/${_words.length}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // Current word
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¿Cuál es la palabra?',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Text(
                          _words[_currentWordIndex],
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4A4A4A),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Options
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _options.map((option) {
                    final isSelected = _selectedWord == option;
                    final isCorrectOption = option == _words[_currentWordIndex];
                    Color bgColor;
                    
                    if (_showFeedback) {
                      if (isCorrectOption) {
                        bgColor = const Color(0xFF6BCB77);
                      } else if (isSelected && !_isCorrect) {
                        bgColor = const Color(0xFFFF6B6B);
                      } else {
                        bgColor = Colors.white;
                      }
                    } else {
                      bgColor = Colors.white;
                    }

                    return GestureDetector(
                      onTap: _showFeedback ? null : () => _checkAnswer(option),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 100,
                        height: 60,
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: _showFeedback && (isCorrectOption || isSelected)
                                  ? Colors.white
                                  : const Color(0xFF4A4A4A),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
