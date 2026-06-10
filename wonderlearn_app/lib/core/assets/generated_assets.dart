import 'package:flutter/material.dart';

class LetterAsset extends StatelessWidget {
  final String letter;
  final double size;
  final Color? color;

  const LetterAsset({
    super.key,
    required this.letter,
    this.size = 100,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color ?? _getLetterColor(letter),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          letter.toUpperCase(),
          style: TextStyle(
            fontSize: size * 0.6,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Color _getLetterColor(String letter) {
    final colors = [
      const Color(0xFFFF6B6B),
      const Color(0xFF6BCB77),
      const Color(0xFFFFD93D),
      const Color(0xFF9CA3AF),
      const Color(0xFF60A5FA),
    ];
    return colors[letter.codeUnitAt(0) % colors.length];
  }
}

class NumberAsset extends StatelessWidget {
  final int number;
  final double size;
  final Color? color;

  const NumberAsset({
    super.key,
    required this.number,
    this.size = 100,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color ?? _getNumberColor(number),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          '$number',
          style: TextStyle(
            fontSize: size * 0.5,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Color _getNumberColor(int number) {
    final colors = [
      const Color(0xFF6BCB77),
      const Color(0xFFFFD93D),
      const Color(0xFFFF6B6B),
      const Color(0xFF60A5FA),
      const Color(0xFF9CA3AF),
    ];
    return colors[number % colors.length];
  }
}

class ShapeAsset extends StatelessWidget {
  final String shape;
  final double size;
  final Color? color;

  const ShapeAsset({
    super.key,
    required this.shape,
    this.size = 100,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color ?? _getShapeColor(shape),
        shape: _getShapeBoxShape(shape),
      ),
      child: Center(
        child: Text(
          _getShapeEmoji(shape),
          style: TextStyle(fontSize: size * 0.4),
        ),
      ),
    );
  }

  ShapeBorder _getShapeBoxShape(String shape) {
    switch (shape.toLowerCase()) {
      case 'circle':
        return const CircleBorder();
      case 'square':
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
      case 'triangle':
        return const CircleBorder();
      case 'rectangle':
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
      default:
        return const CircleBorder();
    }
  }

  String _getShapeEmoji(String shape) {
    switch (shape.toLowerCase()) {
      case 'circle':
        return '⭕';
      case 'square':
        return '🟦';
      case 'triangle':
        return '🔺';
      case 'rectangle':
        return '▬';
      default:
        return '❓';
    }
  }

  Color _getShapeColor(String shape) {
    switch (shape.toLowerCase()) {
      case 'circle':
        return const Color(0xFF6BCB77);
      case 'square':
        return const Color(0xFFFFD93D);
      case 'triangle':
        return const Color(0xFFFF6B6B);
      case 'rectangle':
        return const Color(0xFF9CA3AF);
      default:
        return const Color(0xFF60A5FA);
    }
  }
}

class EmotionAsset extends StatelessWidget {
  final String emotion;
  final double size;

  const EmotionAsset({
    super.key,
    required this.emotion,
    this.size = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: _getEmotionColor(emotion),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          _getEmotionEmoji(emotion),
          style: TextStyle(fontSize: size * 0.5),
        ),
      ),
    );
  }

  String _getEmotionEmoji(String emotion) {
    switch (emotion.toLowerCase()) {
      case 'happy':
        return '😊';
      case 'sad':
        return '😢';
      case 'angry':
        return '😤';
      case 'scared':
        return '😨';
      case 'calm':
        return '😌';
      default:
        return '😐';
    }
  }

  Color _getEmotionColor(String emotion) {
    switch (emotion.toLowerCase()) {
      case 'happy':
        return const Color(0xFFFFD93D);
      case 'sad':
        return const Color(0xFF60A5FA);
      case 'angry':
        return const Color(0xFFFF6B6B);
      case 'scared':
        return const Color(0xFF9CA3AF);
      case 'calm':
        return const Color(0xFF6BCB77);
      default:
        return const Color(0xFF9CA3AF);
    }
  }
}

class AvatarAsset extends StatelessWidget {
  final String avatarType;
  final double size;

  const AvatarAsset({
    super.key,
    required this.avatarType,
    this.size = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: _getAvatarColor(avatarType),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          _getAvatarEmoji(avatarType),
          style: TextStyle(fontSize: size * 0.5),
        ),
      ),
    );
  }

  String _getAvatarEmoji(String type) {
    switch (type.toLowerCase()) {
      case 'dragon':
        return '🐲';
      case 'cat':
        return '🐱';
      case 'robot':
        return '🤖';
      default:
        return '🐲';
    }
  }

  Color _getAvatarColor(String type) {
    switch (type.toLowerCase()) {
      case 'dragon':
        return const Color(0xFF6BCB77);
      case 'cat':
        return const Color(0xFFFFD93D);
      case 'robot':
        return const Color(0xFF9CA3AF);
      default:
        return const Color(0xFF6BCB77);
    }
  }
}
