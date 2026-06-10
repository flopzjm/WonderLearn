import 'package:flutter/material.dart';

class EmotionLessonScreen extends StatefulWidget {
  final String emotionType;

  const EmotionLessonScreen({super.key, required this.emotionType});

  @override
  State<EmotionLessonScreen> createState() => _EmotionLessonScreenState();
}

class _EmotionLessonScreenState extends State<EmotionLessonScreen> {
  int _currentStep = 0;
  int _score = 0;
  bool _showFeedback = false;
  String _feedbackMessage = '';

  final Map<String, Map<String, dynamic>> _emotions = {
    'happy': {
      'name': 'Feliz',
      'emoji': '😊',
      'color': Color(0xFFFFD93D),
      'scenarios': [
        {'text': 'Cuando recibes un regalo', 'correct': true},
        {'text': 'Cuando te hacen un cumplido', 'correct': true},
        {'text': 'Cuando pierdes un juego', 'correct': false},
      ],
    },
    'sad': {
      'name': 'Triste',
      'emoji': '😢',
      'color': Color(0xFF6BCB77),
      'scenarios': [
        {'text': 'Cuando pierdes algo importante', 'correct': true},
        {'text': 'Cuando un amigo se va', 'correct': true},
        {'text': 'Cuando ganas un juego', 'correct': false},
      ],
    },
    'angry': {
      'name': 'Enfadado',
      'emoji': '😤',
      'color': Color(0xFFFF6B6B),
      'scenarios': [
        {'text': 'Cuando algo no es justo', 'correct': true},
        {'text': 'Cuando alguien te molesta', 'correct': true},
        {'text': 'Cuando te dan un dulce', 'correct': false},
      ],
    },
  };

  @override
  Widget build(BuildContext context) {
    final emotion = _emotions[widget.emotionType] ?? _emotions['happy']!;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [emotion['color'] as Color, Color(0xFFFFF8E1)],
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
                        value: (_currentStep + 1) / 3,
                        backgroundColor: Colors.white.withOpacity(0.3),
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFFD93D)),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '$_score/3',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // Emotion display
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        emotion['emoji'] as String,
                        style: const TextStyle(fontSize: 120),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Emoción: ${emotion['name']}',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Scenario question
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Text(
                      '¿Cuándo te sientes así?',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF4A4A4A),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...(emotion['scenarios'] as List).map((scenario) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _showFeedback
                                ? null
                                : () {
                                    setState(() {
                                      _showFeedback = true;
                                      _feedbackMessage = scenario['correct']
                                          ? '¡Correcto! 🎉'
                                          : '¡Intenta de nuevo!';
                                      if (scenario['correct']) _score++;
                                    });

                                    Future.delayed(const Duration(seconds: 1), () {
                                      if (mounted) {
                                        setState(() {
                                          _showFeedback = false;
                                          if (_currentStep < 2) {
                                            _currentStep++;
                                          } else {
                                            _showResults();
                                          }
                                        });
                                      }
                                    });
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF4A4A4A),
                              padding: const EdgeInsets.all(16),
                            ),
                            child: Text(
                              scenario['text'],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),

              // Feedback
              if (_showFeedback)
                Container(
                  padding: const EdgeInsets.all(16),
                  color: _feedbackMessage.contains('Correcto')
                      ? const Color(0xFF6BCB77)
                      : const Color(0xFFFF6B6B),
                  child: Text(
                    _feedbackMessage,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showResults() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¡Lección completada! 💚'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Puntuación: $_score/3'),
            const SizedBox(height: 8),
            Text('Estrellas: ${"⭐" * (_score >= 3 ? 3 : _score >= 2 ? 2 : 1)}'),
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
}
