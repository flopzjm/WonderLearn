import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/onboarding/presentation/screens/welcome_screen.dart';
import '../features/onboarding/presentation/screens/create_account_screen.dart';
import '../features/onboarding/presentation/screens/child_profile_screen.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/child_home/presentation/screens/child_home_screen.dart';
import '../features/wonder_books/presentation/screens/phonics_lesson_screen.dart';
import '../features/wonder_books/presentation/screens/sight_words_game_screen.dart';
import '../features/wonder_books/presentation/screens/story_reader_screen.dart';
import '../features/wonder_books/presentation/screens/library_screen.dart';
import '../features/wonder_math/presentation/screens/counting_screen.dart';
import '../features/wonder_math/presentation/screens/addition_screen.dart';
import '../features/wonder_math/presentation/screens/shapes_screen.dart';
import '../features/wonder_math/presentation/screens/patterns_screen.dart';
import '../features/wonder_grow/presentation/screens/emotion_lesson_screen.dart';
import '../features/wonder_grow/presentation/screens/empathy_game_screen.dart';
import '../features/wonder_grow/presentation/screens/breathing_screen.dart';
import '../features/learning_map/presentation/screens/learning_map_screen.dart';
import '../features/gamification/presentation/screens/badges_screen.dart';
import '../features/parent_panel/presentation/screens/dashboard_screen.dart';
import '../features/parent_panel/presentation/screens/settings_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/welcome',
    routes: [
      // Onboarding
      GoRoute(
        path: '/welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/create-account',
        builder: (context, state) => const CreateAccountScreen(),
      ),
      GoRoute(
        path: '/child-profile',
        builder: (context, state) => const ChildProfileScreen(),
      ),
      
      // Auth
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      
      // Child Home
      GoRoute(
        path: '/home',
        builder: (context, state) => const ChildHomeScreen(),
      ),
      
      // WonderBooks
      GoRoute(
        path: '/phonics/:letter',
        builder: (context, state) => PhonicsLessonScreen(
          letter: state.pathParameters['letter']!,
        ),
      ),
      GoRoute(
        path: '/sight-words',
        builder: (context, state) => const SightWordsGameScreen(),
      ),
      GoRoute(
        path: '/stories',
        builder: (context, state) => const LibraryScreen(),
      ),
      GoRoute(
        path: '/story/:id',
        builder: (context, state) => StoryReaderScreen(
          storyId: state.pathParameters['id']!,
        ),
      ),
      
      // WonderMath
      GoRoute(
        path: '/counting',
        builder: (context, state) => const CountingScreen(),
      ),
      GoRoute(
        path: '/addition',
        builder: (context, state) => const AdditionScreen(),
      ),
      GoRoute(
        path: '/shapes',
        builder: (context, state) => const ShapesScreen(),
      ),
      GoRoute(
        path: '/patterns',
        builder: (context, state) => const PatternsScreen(),
      ),
      
      // WonderGrow
      GoRoute(
        path: '/emotion/:type',
        builder: (context, state) => EmotionLessonScreen(
          emotionType: state.pathParameters['type']!,
        ),
      ),
      GoRoute(
        path: '/empathy/:game',
        builder: (context, state) => EmpathyGameScreen(
          gameType: state.pathParameters['game']!,
        ),
      ),
      GoRoute(
        path: '/breathing',
        builder: (context, state) => const BreathingScreen(),
      ),
      
      // Learning Map
      GoRoute(
        path: '/map',
        builder: (context, state) => const LearningMapScreen(),
      ),
      
      // Gamification
      GoRoute(
        path: '/badges',
        builder: (context, state) => const BadgesScreen(),
      ),
      
      // Parent Panel
      GoRoute(
        path: '/parent/dashboard/:childId',
        builder: (context, state) => DashboardScreen(
          childId: state.pathParameters['childId']!,
        ),
      ),
      GoRoute(
        path: '/parent/settings/:childId',
        builder: (context, state) => SettingsScreen(
          childId: state.pathParameters['childId']!,
        ),
      ),
    ],
  );
});
