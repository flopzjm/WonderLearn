import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatelessWidget {
  final String childId;

  const DashboardScreen({super.key, required this.childId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Padres'),
        backgroundColor: const Color(0xFF6BCB77),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Navigate to settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Child info
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFD93D),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text('🐲', style: TextStyle(fontSize: 32)),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lucas',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '5 años • Nivel 3',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Today's stats
            const Text(
              'Hoy',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _StatCard(
                  title: 'Tiempo',
                  value: '18 min',
                  icon: Icons.timer,
                  color: const Color(0xFF6BCB77),
                ),
                const SizedBox(width: 8),
                _StatCard(
                  title: 'Lecciones',
                  value: '3',
                  icon: Icons.book,
                  color: const Color(0xFFFFD93D),
                ),
                const SizedBox(width: 8),
                _StatCard(
                  title: 'Restante',
                  value: '12 min',
                  icon: Icons.hourglass_empty,
                  color: const Color(0xFFFF6B6B),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Weekly chart
            const Text(
              'Esta semana',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: 200,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: 60,
                      barTouchData: BarTouchData(enabled: false),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              const days = ['L', 'M', 'X', 'J', 'V', 'S', 'D'];
                              return Text(
                                days[value.toInt()],
                                style: const TextStyle(fontSize: 12),
                              );
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            getTitlesWidget: (value, meta) {
                              return Text('${value.toInt()}m');
                            },
                          ),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      gridData: const FlGridData(show: false),
                      barGroups: [
                        BarChartGroupData(x: 0, barRods: [
                          BarChartRodData(toY: 25, color: const Color(0xFF6BCB77)),
                        ]),
                        BarChartGroupData(x: 1, barRods: [
                          BarChartRodData(toY: 30, color: const Color(0xFF6BCB77)),
                        ]),
                        BarChartGroupData(x: 2, barRods: [
                          BarChartRodData(toY: 15, color: const Color(0xFF6BCB77)),
                        ]),
                        BarChartGroupData(x: 3, barRods: [
                          BarChartRodData(toY: 40, color: const Color(0xFF6BCB77)),
                        ]),
                        BarChartGroupData(x: 4, barRods: [
                          BarChartRodData(toY: 35, color: const Color(0xFF6BCB77)),
                        ]),
                        BarChartGroupData(x: 5, barRods: [
                          BarChartRodData(toY: 20, color: const Color(0xFF6BCB77)),
                        ]),
                        BarChartGroupData(x: 6, barRods: [
                          BarChartRodData(toY: 18, color: const Color(0xFF6BCB77)),
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Skills radar
            const Text(
              'Habilidades',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _SkillRow(label: 'Lectura', value: 75, color: const Color(0xFFFFD93D)),
                    const SizedBox(height: 12),
                    _SkillRow(label: 'Matemáticas', value: 60, color: const Color(0xFF6BCB77)),
                    const SizedBox(height: 12),
                    _SkillRow(label: 'Emociones', value: 80, color: const Color(0xFFFF6B6B)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Recent lessons
            const Text(
              'Lecciones recientes',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _LessonTile(
              title: 'Fonética: Letra C',
              module: 'Lectura',
              stars: 3,
              time: 'Hace 2 horas',
            ),
            _LessonTile(
              title: 'Sumas 1-3',
              module: 'Matemáticas',
              stars: 2,
              time: 'Ayer',
            ),
            _LessonTile(
              title: 'Emociones: Triste',
              module: 'Emociones',
              stars: 3,
              time: 'Hace 2 días',
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillRow extends StatelessWidget {
  final String label;
  final double value;
  final Color color;

  const _SkillRow({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(label),
        ),
        Expanded(
          child: LinearProgressIndicator(
            value: value / 100,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
        const SizedBox(width: 8),
        Text('${value.toInt()}%'),
      ],
    );
  }
}

class _LessonTile extends StatelessWidget {
  final String title;
  final String module;
  final int stars;
  final String time;

  const _LessonTile({
    required this.title,
    required this.module,
    required this.stars,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF6BCB77).withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Icon(Icons.book, color: Color(0xFF6BCB77)),
          ),
        ),
        title: Text(title),
        subtitle: Text(module),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(3, (index) {
                return Icon(
                  index < stars ? Icons.star : Icons.star_border,
                  color: const Color(0xFFFFD93D),
                  size: 16,
                );
              }),
            ),
            Text(
              time,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
