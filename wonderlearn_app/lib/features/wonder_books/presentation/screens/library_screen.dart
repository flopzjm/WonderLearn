import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = [
      {'id': 'story_01', 'title': 'El gato simpático', 'cover': '🐱', 'difficulty': 1, 'category': 'Animales', 'stars': 0},
      {'id': 'story_02', 'title': 'Mi perro', 'cover': '🐶', 'difficulty': 1, 'category': 'Animales', 'stars': 3},
      {'id': 'story_03', 'title': 'La casa', 'cover': '🏠', 'difficulty': 1, 'category': 'Familia', 'stars': 0},
      {'id': 'story_04', 'title': 'El árbol grande', 'cover': '🌳', 'difficulty': 2, 'category': 'Animales', 'stars': 2},
      {'id': 'story_05', 'title': 'El parque', 'cover': '🎡', 'difficulty': 2, 'category': 'Aventuras', 'stars': 0},
      {'id': 'story_06', 'title': 'Los animales', 'cover': '🐄', 'difficulty': 2, 'category': 'Animales', 'stars': 0},
      {'id': 'story_07', 'title': 'Mi familia', 'cover': '👨‍👩‍👧', 'difficulty': 2, 'category': 'Familia', 'stars': 0},
      {'id': 'story_08', 'title': 'La escuela', 'cover': '🏫', 'difficulty': 3, 'category': 'Aventuras', 'stars': 0, 'locked': true},
      {'id': 'story_09', 'title': 'El viaje', 'cover': '🚗', 'difficulty': 3, 'category': 'Aventuras', 'stars': 0, 'locked': true},
      {'id': 'story_10', 'title': 'La aventura', 'cover': '🗺️', 'difficulty': 3, 'category': 'Emociones', 'stars': 0, 'locked': true},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Biblioteca de Cuentos'),
        backgroundColor: const Color(0xFF6BCB77),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Filters
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _FilterChip(label: 'Todos', selected: true),
                _FilterChip(label: 'Animales', selected: false),
                _FilterChip(label: 'Familia', selected: false),
                _FilterChip(label: 'Aventuras', selected: false),
                _FilterChip(label: 'Emociones', selected: false),
              ],
            ),
          ),

          // Stories grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: stories.length,
              itemBuilder: (context, index) {
                final story = stories[index];
                final isLocked = story['locked'] == true;

                return GestureDetector(
                  onTap: isLocked
                      ? null
                      : () => context.go('/story/${story['id']}'),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Cover
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: isLocked
                                  ? Colors.grey.shade200
                                  : const Color(0xFFFFF8E1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: isLocked
                                  ? const Icon(Icons.lock, size: 40, color: Colors.grey)
                                  : Text(
                                      story['cover'] as String,
                                      style: const TextStyle(fontSize: 48),
                                    ),
                            ),
                          ),
                        ),

                        // Title
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            story['title'] as String,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: isLocked ? Colors.grey : const Color(0xFF4A4A4A),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        // Stars
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(3, (i) {
                              return Icon(
                                i < (story['stars'] as int)
                                    ? Icons.star
                                    : Icons.star_border,
                                color: const Color(0xFFFFD93D),
                                size: 16,
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;

  const _FilterChip({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF6BCB77) : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: selected ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
