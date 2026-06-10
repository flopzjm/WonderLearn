import 'package:flutter/material.dart';

class EmpathyGameScreen extends StatefulWidget {
  final String gameType;

  const EmpathyGameScreen({super.key, required this.gameType});

  @override
  State<EmpathyGameScreen> createState() => _EmpathyGameScreenState();
}

class _EmpathyGameScreenState extends State<EmpathyGameScreen> {
  int _currentQuestion = 0;
  int _score = 0;
  bool _showFeedback = false;
  String _feedbackMessage = '';

  final List<Map<String, dynamic>> _questions = [
    {
      'situation': 'Tu amigo está triste porque perdió su juguete favorito.',
      'character': '😢',
      'options': [
        {'text': 'Ignorarlo', 'correct': false},
        {'text': 'Preguntarle si está bien y ofrecer ayuda', 'correct': true},
        {'text': 'Reírse de él', 'correct': false},
      ],
    },
    {
      'situation': 'Tu amiga está feliz porque aprobó un examen.',
      'character': '😊',
      'options': [
        {'text': 'Decirle "¡Felicitaciones!"', 'correct': true},
        {'text': 'Sentir celos', 'correct': false},
        {'text': 'Ignorar su logro', 'correct': false},
      ],
    },
    {
      'situation': 'Tu amigo tiene miedo de los truenos.',
      'character': '😨',
      'options': [
        {'text': 'Burlarse de su miedo', 'correct': false},
        {'text': 'Decirle que no es para tanto', 'correct': false},
        {'text': 'Sentarse con él y tranquilizarlo', 'correct': true},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF9CA3AF), Color(0xFFFFF8E1)],
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
                        value: (_currentQuestion + 1) / _questions.length,
                        backgroundColor: Colors.white.withOpacity(0.3),
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFFD93D)),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '$_score/${_questions.length}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // Situation
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _questions[_currentQuestion]['character'],
                        style: const TextStyle(fontSize: 100),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 32),
                        padding: const EdgeInsets.all(24),
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
                          _questions[_currentQuestion]['situation'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF4A4A4A),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Answer options
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Text(
                      '¿Qué harías?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A4A4A),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...(_questions[_currentQuestion]['options'] as List).map((option) {
                      final isCorrect = option['correct'];
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
                                      _feedbackMessage = isCorrect
                                          ? '¡Buena elección! 🌟'
                                          : 'En esta situación, hay una mejor opción...';
                                      if (isCorrect) _score++;
                                    });

                                    Future.delayed(const Duration(seconds: 2), () {
                                      if (mounted) {
                                        setState(() {
                                          _showFeedback = false;
                                          if (_currentQuestion < _questions.length - 1) {
                                            _currentQuestion++;
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
                              option['text'],
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
                  color: _feedbackMessage.contains('Buena')
                      ? const Color(0xFF6BCB77)
                      : const Color(0xFFFFD93D),
                  child: Text(
                    _feedbackMessage,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A4A4A),
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
        title: const Text('¡Juego completado! 🤝'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Puntuación: $_score/${_questions.length}'),
            const SizedBox(height: 8),
            Text('Estrellas: ${"⭐" * (_score >= 3 ? 3 : _score >= 2 ? 2 : 1)}'),
            const SizedBox(height: 8),
            const Text('¡Eres muy empático!'),
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
