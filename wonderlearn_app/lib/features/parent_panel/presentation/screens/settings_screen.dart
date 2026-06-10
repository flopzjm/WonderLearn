import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final String childId;

  const SettingsScreen({super.key, required this.childId});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _timeLimit = 30;
  bool _wonderBooksEnabled = true;
  bool _wonderMathEnabled = true;
  bool _wonderGrowEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        backgroundColor: const Color(0xFF6BCB77),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Time limit
          const Text(
            'Límite de tiempo diario',
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
                  Text(
                    '$_timeLimit minutos',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6BCB77),
                    ),
                  ),
                  Slider(
                    value: _timeLimit.toDouble(),
                    min: 15,
                    max: 120,
                    divisions: 7,
                    activeColor: const Color(0xFF6BCB77),
                    onChanged: (value) {
                      setState(() => _timeLimit = value.round());
                    },
                  ),
                  const Text(
                    'Tu hijo(a) recibirá un aviso cuando queden 5 minutos',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Modules
          const Text(
            'Módulos',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('📚 WonderBooks (Lectura)'),
                  value: _wonderBooksEnabled,
                  activeColor: const Color(0xFFFFD93D),
                  onChanged: (value) {
                    setState(() => _wonderBooksEnabled = value);
                  },
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: const Text('🔢 WonderMath (Matemáticas)'),
                  value: _wonderMathEnabled,
                  activeColor: const Color(0xFF6BCB77),
                  onChanged: (value) {
                    setState(() => _wonderMathEnabled = value);
                  },
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: const Text('💚 WonderGrow (Emociones)'),
                  value: _wonderGrowEnabled,
                  activeColor: const Color(0xFFFF6B6B),
                  onChanged: (value) {
                    setState(() => _wonderGrowEnabled = value);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Reset progress
          const Text(
            'Progreso',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.refresh, color: Colors.orange),
                  title: const Text('Resetear progreso de módulo'),
                  subtitle: const Text('Útil si tu hijo(a) se atascó'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO: Show reset dialog
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Reports
          const Text(
            'Reportes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('📧 Reportes semanales por email'),
                  subtitle: const Text('Cada domingo a las 9 AM'),
                  value: true,
                  activeColor: const Color(0xFF6BCB77),
                  onChanged: (value) {
                    // TODO: Toggle email reports
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Parental PIN
          const Text(
            'Seguridad',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.lock, color: Colors.grey),
                  title: const Text('Cambiar PIN parental'),
                  subtitle: const Text('Protege el acceso al panel de padres'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO: Show PIN change dialog
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Extra time button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Grant 5 extra minutes
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('¡5 minutos extra otorgados!'),
                    backgroundColor: Color(0xFF6BCB77),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFD93D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Otorgar 5 min extra',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A4A4A),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
