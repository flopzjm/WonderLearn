import 'package:flutter/material.dart';

class BadgesScreen extends StatelessWidget {
  const BadgesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final badges = [
      {'name': 'Primera Lección', 'emoji': '🎓', 'description': 'Completa tu primera lección', 'earned': true},
      {'name': '3 Días Seguidos', 'emoji': '🔥', 'description': 'Usa la app 3 días seguidos', 'earned': true},
      {'name': 'Maestro de Fonética', 'emoji': '📚', 'description': 'Domina todas las letras A-E', 'earned': false},
      {'name': 'Mago de Matemáticas', 'emoji': '🧮', 'description': 'Completa 10 lecciones de matemáticas', 'earned': false},
      {'name': 'Campeón SEL', 'emoji': '💚', 'description': 'Completa todas las lecciones de emociones', 'earned': false},
      {'name': 'Lector de Cuentos', 'emoji': '📖', 'description': 'Lee 5 cuentos interactivos', 'earned': true},
      {'name': 'Experto en Patrones', 'emoji': '🔄', 'description': 'Domina los patrones ABAB y AAB', 'earned': false},
      {'name': 'Maestro de la Respiración', 'emoji': '🧘', 'description': 'Completa 5 ejercicios de mindfulness', 'earned': false},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Insignias'),
        backgroundColor: const Color(0xFFFFD93D),
        foregroundColor: const Color(0xFF4A4A4A),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFD93D), Color(0xFFFFF8E1)],
          ),
        ),
        child: Column(
          children: [
            // Stats
            Container(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _StatItem(
                    label: 'Obtenidas',
                    value: '${badges.where((b) => b['earned'] as bool).length}',
                    icon: Icons.emoji_events,
                  ),
                  _StatItem(
                    label: 'Total',
                    value: '${badges.length}',
                    icon: Icons.collections_bookmark,
                  ),
                  _StatItem(
                    label: 'Progreso',
                    value: '${((badges.where((b) => b['earned'] as bool).length / badges.length) * 100).round()}%',
                    icon: Icons.trending_up,
                  ),
                ],
              ),
            ),

            // Badges grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: badges.length,
                itemBuilder: (context, index) {
                  final badge = badges[index];
                  final isEarned = badge['earned'] as bool;

                  return Card(
                    child: Container(
                      decoration: BoxDecoration(
                        color: isEarned ? Colors.white : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Badge icon
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: isEarned
                                  ? const Color(0xFFFFD93D).withOpacity(0.2)
                                  : Colors.grey.shade200,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                badge['emoji'] as String,
                                style: TextStyle(
                                  fontSize: 40,
                                  color: isEarned ? null : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Badge name
                          Text(
                            badge['name'] as String,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: isEarned ? const Color(0xFF4A4A4A) : Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),

                          // Badge description
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              badge['description'] as String,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10,
                                color: isEarned ? Colors.grey : Colors.grey.shade400,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          // Status indicator
                          if (!isEarned)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  'Por obtener',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
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
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFF4A4A4A), size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4A4A4A),
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF4A4A4A),
          ),
        ),
      ],
    );
  }
}
