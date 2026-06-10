import 'package:flutter/material.dart';

class StoryReaderScreen extends StatefulWidget {
  final String storyId;

  const StoryReaderScreen({super.key, required this.storyId});

  @override
  State<StoryReaderScreen> createState() => _StoryReaderScreenState();
}

class _StoryReaderScreenState extends State<StoryReaderScreen> {
  int _currentPage = 0;
  bool _isPlaying = false;

  // Mock story data
  final Map<String, dynamic> _story = {
    'title': 'El gato simpático',
    'pages': [
      {
        'text': 'Había una vez un gato muy simpático.',
        'image': '🐱',
        'interactiveElements': ['gato'],
      },
      {
        'text': 'El gato se llamava Milo.',
        'image': '😺',
        'interactiveElements': ['nombre'],
      },
      {
        'text': 'Milo vivía en una casa grande.',
        'image': '🏠',
        'interactiveElements': ['casa'],
      },
      {
        'text': 'A Milo le gustaba jugar con una bola.',
        'image': '⚽',
        'interactiveElements': ['bola'],
      },
      {
        'text': 'Un día, Milo encontró un ratón.',
        'image': '🐭',
        'interactiveElements': ['ratón'],
      },
      {
        'text': '¡Pero eran amigos!',
        'image': '🤝',
        'interactiveElements': ['amigos'],
      },
    ],
    'comprehensionQuestion': '¿Cómo se llamaba el gato?',
    'options': ['Milo', 'Tom', 'Garfield'],
  };

  void _nextPage() {
    if (_currentPage < _story['pages'].length - 1) {
      setState(() => _currentPage++);
    } else {
      _showComprehensionQuestion();
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      setState(() => _currentPage--);
    }
  }

  void _showComprehensionQuestion() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Entendiste la historia?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _story['comprehensionQuestion'],
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ...(_story['options'] as List).map((option) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (option == _story['options'][0]) {
                        _showCorrectAnswer();
                      } else {
                        _showTryAgain();
                      }
                    },
                    child: Text(option),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  void _showCorrectAnswer() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¡Correcto! 🎉'),
        content: const Text('¡Muy bien! Entendiste la historia.'),
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

  void _showTryAgain() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Intenta de nuevo'),
        content: const Text('El gato se llamaba Milo. ¡Inténtalo otra vez!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final page = _story['pages'][_currentPage];

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
                        value: (_currentPage + 1) / _story['pages'].length,
                        backgroundColor: Colors.white.withOpacity(0.5),
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF6BCB77)),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '${_currentPage + 1}/${_story['pages'].length}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A4A4A),
                      ),
                    ),
                  ],
                ),
              ),

              // Story content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      // Illustration
                      Expanded(
                        flex: 3,
                        child: GestureDetector(
                          onTap: () {
                            // TODO: Trigger interactive element animation
                          },
                          child: Container(
                            width: double.infinity,
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
                            child: Center(
                              child: Text(
                                page['image'],
                                style: const TextStyle(fontSize: 120),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Text (karaoke style)
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              page['text'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4A4A4A),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Controls
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Previous button
                    ElevatedButton.icon(
                      onPressed: _currentPage > 0 ? _prevPage : null,
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Anterior'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF4A4A4A),
                      ),
                    ),

                    // Play/Pause audio
                    IconButton(
                      onPressed: () {
                        setState(() => _isPlaying = !_isPlaying);
                        // TODO: Play audio narration
                      },
                      icon: Icon(
                        _isPlaying ? Icons.pause_circle : Icons.play_circle,
                        size: 48,
                        color: const Color(0xFF6BCB77),
                      ),
                    ),

                    // Next button
                    ElevatedButton.icon(
                      onPressed: _nextPage,
                      icon: const Icon(Icons.arrow_forward),
                      label: Text(
                        _currentPage < _story['pages'].length - 1
                            ? 'Siguiente'
                            : 'Terminar',
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6BCB77),
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
