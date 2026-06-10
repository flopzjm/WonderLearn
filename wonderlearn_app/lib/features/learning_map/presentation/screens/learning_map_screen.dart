import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LearningMapScreen extends StatelessWidget {
  const LearningMapScreen({super.key});

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => context.go('/home'),
                    ),
                    const Text(
                      'Mapa de Aprendizaje',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),

              // Map content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // WonderBooks Zone
                      _ZoneCard(
                        title: 'Bosque de Letras',
                        icon: '📚',
                        color: const Color(0xFFFFD93D),
                        nodes: [
                          _MapNode(
                            label: 'A',
                            status: NodeStatus.completed,
                            onTap: () => context.go('/phonics/A'),
                          ),
                          _MapNode(
                            label: 'B',
                            status: NodeStatus.completed,
                            onTap: () => context.go('/phonics/B'),
                          ),
                          _MapNode(
                            label: 'C',
                            status: NodeStatus.current,
                            onTap: () => context.go('/phonics/C'),
                          ),
                          _MapNode(
                            label: 'D',
                            status: NodeStatus.locked,
                            onTap: () {},
                          ),
                          _MapNode(
                            label: 'E',
                            status: NodeStatus.locked,
                            onTap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // WonderMath Zone
                      _ZoneCard(
                        title: 'Montaña de Números',
                        icon: '🔢',
                        color: const Color(0xFF6BCB77),
                        nodes: [
                          _MapNode(
                            label: '1-5',
                            status: NodeStatus.completed,
                            onTap: () => context.go('/counting'),
                          ),
                          _MapNode(
                            label: '+',
                            status: NodeStatus.current,
                            onTap: () => context.go('/addition'),
                          ),
                          _MapNode(
                            label: '△',
                            status: NodeStatus.locked,
                            onTap: () {},
                          ),
                          _MapNode(
                            label: '...',
                            status: NodeStatus.locked,
                            onTap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // WonderGrow Zone
                      _ZoneCard(
                        title: 'Lago de Emociones',
                        icon: '💚',
                        color: const Color(0xFFFF6B6B),
                        nodes: [
                          _MapNode(
                            label: '😊',
                            status: NodeStatus.completed,
                            onTap: () => context.go('/emotion/happy'),
                          ),
                          _MapNode(
                            label: '😢',
                            status: NodeStatus.current,
                            onTap: () => context.go('/emotion/sad'),
                          ),
                          _MapNode(
                            label: '😤',
                            status: NodeStatus.locked,
                            onTap: () {},
                          ),
                          _MapNode(
                            label: '🧘',
                            status: NodeStatus.locked,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
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

enum NodeStatus { completed, current, locked }

class _ZoneCard extends StatelessWidget {
  final String title;
  final String icon;
  final Color color;
  final List<_MapNode> nodes;

  const _ZoneCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.nodes,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(icon, style: const TextStyle(fontSize: 32)),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A4A4A),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: nodes.map((node) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: node,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MapNode extends StatelessWidget {
  final String label;
  final NodeStatus status;
  final VoidCallback onTap;

  const _MapNode({
    required this.label,
    required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    IconData? icon;

    switch (status) {
      case NodeStatus.completed:
        backgroundColor = const Color(0xFFFFD93D);
        textColor = const Color(0xFF4A4A4A);
        icon = Icons.check;
        break;
      case NodeStatus.current:
        backgroundColor = const Color(0xFF6BCB77);
        textColor = Colors.white;
        icon = Icons.play_arrow;
        break;
      case NodeStatus.locked:
        backgroundColor = Colors.grey.shade300;
        textColor = Colors.grey;
        icon = Icons.lock;
        break;
    }

    return GestureDetector(
      onTap: status != NodeStatus.locked ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          boxShadow: status == NodeStatus.current
              ? [
                  BoxShadow(
                    color: const Color(0xFF6BCB77).withOpacity(0.5),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Center(
          child: status == NodeStatus.current || status == NodeStatus.completed
              ? Icon(icon, color: textColor, size: 28)
              : Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
        ),
      ),
    );
  }
}
