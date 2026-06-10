import 'package:flutter/material.dart';

class CountingScreen extends StatefulWidget {
  const CountingScreen({super.key});

  @override
  State<CountingScreen> createState() => _CountingScreenState();
}

class _CountingScreenState extends State<CountingScreen> {
  int _currentNumber = 1;
  int _count = 0;
  int _targetCount = 5;
  int _score = 0;
  List<String> _objects = ['🍎', '🍊', '🍋', '🍇', '🍓'];
  String? _feedbackMessage;
  bool _showFeedback = false;

  @override
  void initState() {
    super.initState();
    _generateChallenge();
  }

  void _generateChallenge() {
    setState(() {
      _currentNumber = (_count % 10) + 1;
      _targetCount = _currentNumber;
      _count = 0;
    });
  }

  void _tapObject() {
    setState(() {
      _count++;
      
      if (_count == _targetCount) {
        _score++;
        _feedbackMessage = '¡Correcto! Contaste $_targetCount objects';
        _showFeedback = true;
        
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            setState(() {
              _showFeedback = false;
              if (_currentNumber < 10) {
                _generateChallenge();
              } else {
                _showResults();
              }
            });
          }
        });
      } else if (_count > _targetCount) {
        _feedbackMessage = '¡Casi! Solo son $_targetCount';
        _showFeedback = true;
        _count = 0;
        
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            setState(() {
              _showFeedback = false;
            });
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
        title: const Text('¡Excelente! 🎉'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Contaste todos los números del 1 al 10'),
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
                        value: _currentNumber / 10,
                        backgroundColor: Colors.white.withOpacity(0.3),
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFFD93D)),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '$_score/10',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // Number display
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Toca para contar:',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            '$_targetCount',
                            style: const TextStyle(
                              fontSize: 72,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6BCB77),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Contador: $_count',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Objects to tap
              Padding(
                padding: const EdgeInsets.all(24),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: List.generate(_targetCount, (index) {
                    final isTapped = index < _count;
                    return GestureDetector(
                      onTap: isTapped ? null : _tapObject,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: isTapped
                              ? const Color(0xFFFFD93D)
                              : Colors.white,
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
                            _objects[index % _objects.length],
                            style: const TextStyle(fontSize: 36),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              // Feedback
              if (_showFeedback)
                Container(
                  padding: const EdgeInsets.all(16),
                  color: _feedbackMessage!.contains('Correcto')
                      ? const Color(0xFF6BCB77)
                      : const Color(0xFFFF6B6B),
                  child: Text(
                    _feedbackMessage!,
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
