import 'package:flutter/material.dart';

class AdditionScreen extends StatefulWidget {
  const AdditionScreen({super.key});

  @override
  State<AdditionScreen> createState() => _AdditionScreenState();
}

class _AdditionScreenState extends State<AdditionScreen> {
  int _num1 = 0;
  int _num2 = 0;
  int _correctAnswer = 0;
  int _userAnswer = 0;
  int _score = 0;
  int _questionCount = 0;
  String _feedbackMessage = '';
  bool _showFeedback = false;

  @override
  void initState() {
    super.initState();
    _generateQuestion();
  }

  void _generateQuestion() {
    setState(() {
      _num1 = (DateTime.now().millisecondsSinceEpoch % 5) + 1;
      _num2 = (DateTime.now().millisecondsSinceEpoch % (6 - _num1)) + 1;
      _correctAnswer = _num1 + _num2;
      _userAnswer = 0;
    });
  }

  void _checkAnswer(int answer) {
    setState(() {
      _userAnswer = answer;
      _showFeedback = true;

      if (answer == _correctAnswer) {
        _score++;
        _feedbackMessage = '¡Correcto! $_num1 + $_num2 = $_correctAnswer';
      } else {
        _feedbackMessage = '¡Casi! La respuesta es $_correctAnswer';
      }
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _showFeedback = false;
          _questionCount++;
          if (_questionCount < 10) {
            _generateQuestion();
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
        title: const Text('¡Sumas completadas! 🧮'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Puntuación: $_score/10'),
            const SizedBox(height: 8),
            Text('Estrellas: ${"⭐" * (_score >= 8 ? 3 : _score >= 5 ? 2 : 1)}'),
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
            colors: [Color(0xFFFFD93D), Color(0xFFFFF8E1)],
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
                      icon: const Icon(Icons.close, color: Color(0xFF4A4A4A)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: _questionCount / 10,
                        backgroundColor: Colors.white.withOpacity(0.5),
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF6BCB77)),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '$_score/10',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A4A4A),
                      ),
                    ),
                  ],
                ),
              ),

              // Question
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¿Cuánto es?',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF4A4A4A),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // First number with objects
                          Column(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Text(
                                    '$_num1',
                                    style: const TextStyle(
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF6BCB77),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '🍎' * _num1,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              '+',
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4A4A4A),
                              ),
                            ),
                          ),
                          // Second number with objects
                          Column(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Text(
                                    '$_num2',
                                    style: const TextStyle(
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFFF6B6B),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '🍊' * _num2,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ],
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _AnswerButton(
                          answer: _correctAnswer - 1,
                          onTap: (a) => _checkAnswer(a),
                          correctAnswer: _correctAnswer,
                          showFeedback: _showFeedback,
                        ),
                        _AnswerButton(
                          answer: _correctAnswer,
                          onTap: (a) => _checkAnswer(a),
                          correctAnswer: _correctAnswer,
                          showFeedback: _showFeedback,
                          isCorrect: true,
                        ),
                        _AnswerButton(
                          answer: _correctAnswer + 1,
                          onTap: (a) => _checkAnswer(a),
                          correctAnswer: _correctAnswer,
                          showFeedback: _showFeedback,
                        ),
                      ],
                    ),
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
}

class _AnswerButton extends StatelessWidget {
  final int answer;
  final Function(int) onTap;
  final int correctAnswer;
  final bool showFeedback;
  final bool isCorrect;

  const _AnswerButton({
    required this.answer,
    required this.onTap,
    required this.correctAnswer,
    required this.showFeedback,
    this.isCorrect = false,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    
    if (showFeedback) {
      if (isCorrect) {
        bgColor = const Color(0xFF6BCB77);
      } else {
        bgColor = Colors.white;
      }
    } else {
      bgColor = Colors.white;
    }

    return GestureDetector(
      onTap: showFeedback ? null : () => onTap(answer),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
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
            '$answer',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: showFeedback && isCorrect
                  ? Colors.white
                  : const Color(0xFF4A4A4A),
            ),
          ),
        ),
      ),
    );
  }
}
