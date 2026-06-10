import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'config/env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize environment
  EnvConfig.init(Environment.staging);
  
  runApp(
    const ProviderScope(
      child: WonderLearnApp(),
    ),
  );
}
