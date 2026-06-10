import 'package:flutter/material.dart';

class ShapesScreen extends StatefulWidget {
  const ShapesScreen({super.key});

  @override
  State<ShapesScreen> createState() => _ShapesScreenState();
}

class _ShapesScreenState extends State<ShapesScreen> {
  int _currentShapeIndex = 0;
  int _score = 0;
  bool _showFeedback = false;
  String _feedbackMessage = '';

  final List<Map<String, dynamic>> _shapes = [
    {'name': 'Círculo', 'icon': Icons.circle, 'color': Color(0xFF6BCB77), 'emoji': '⭕'},
    {'name': 'Cuadrado', 'icon': Icons.square, 'color': Color(0xFFFFD93D), 'emoji': '🟦'},
    {'name': 'Triángulo', 'icon': Icons.change_history, 'color': Color(0xFFFF6B6B), 'emoji': '🔺'},
    {'name': 'Rectángulo', 'icon': Icons.rectangle, 'color': Color(0xFF9CA3AF), 'emoji': '▬'},
  ];

  List<String> _options = [];
  String? _selectedShape;
  bool _isCorrect = false;

  @override
  void initState() {
    super.initState();
    _generateOptions();
  }

  void _generateOptions() {
    final currentShape = _shapes[_currentShapeIndex];
    final otherShapes = _shapes.where((s) => s['name'] != currentShape['name']).toList()..shuffle();
    _options = [currentShape['name'] as String, ...otherShapes.take(2).map((s) => s['name'] as String)]..shuffle();
  }

  void _checkAnswer(String selected) {
    final currentShape = _shapes[_currentShapeIndex];
    setState(() {
      _selectedShape = selected;
      _isCorrect = selected == currentShape['name'];
      _showFeedback = true;
      if (_isCorrect) _score++;
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _showFeedback = false;
          _selectedShape = null;
          if (_currentShapeIndex < _shapes.length - 1) {
            _currentShapeIndex++;
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
        title: const Text('¡Formas completadas! 🔷'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Puntuación: $_score/${_shapes.length}'),
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

  @override
  Widget build(BuildContext context) {
    final currentShape = _shapes[_currentShapeIndex];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [currentShape['color'] as Color, Color(0xFFFFF8E1)],
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
                        value: (_currentShapeIndex + 1) / _shapes.length,
                        backgroundColor: Colors.white.withOpacity(0.3),
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFFD93D)),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '$_score/${_shapes.length}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // Shape display
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¿Qué forma es?',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            currentShape['icon'] as IconData,
                            size: 100,
                            color: currentShape['color'] as Color,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _options.map((option) {
                    final isSelected = _selectedShape == option;
                    final isCorrectOption = option == currentShape['name'];
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
                              fontSize: 14,
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

              // Feedback
              if (_showFeedback)
                Container(
                  padding: const EdgeInsets.all(16),
                  color: _isCorrect ? const Color(0xFF6BCB77) : const Color(0xFFFF6B6B),
                  child: Text(
                    _isCorrect ? '¡Correcto! 🎉' : '¡Intenta de nuevo!',
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
