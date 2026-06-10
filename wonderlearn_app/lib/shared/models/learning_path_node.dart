class LearningPathNode {
  final String id;
  final String childId;
  final String zoneId;
  final String nodeId;
  final String status;
  final int starsEarned;
  final DateTime? completedAt;

  LearningPathNode({
    required this.id,
    required this.childId,
    required this.zoneId,
    required this.nodeId,
    required this.status,
    required this.starsEarned,
    this.completedAt,
  });

  factory LearningPathNode.fromJson(Map<String, dynamic> json) {
    return LearningPathNode(
      id: json['id'],
      childId: json['childId'],
      zoneId: json['zoneId'],
      nodeId: json['nodeId'],
      status: json['status'],
      starsEarned: json['starsEarned'],
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'childId': childId,
      'zoneId': zoneId,
      'nodeId': nodeId,
      'status': status,
      'starsEarned': starsEarned,
      'completedAt': completedAt?.toIso8601String(),
    };
  }

  bool get isCompleted => status == 'completed';
  bool get isCurrent => status == 'current';
  bool get isLocked => status == 'locked';

  String get zoneDisplayName {
    switch (zoneId) {
      case 'bosque_letras':
        return 'Bosque de Letras';
      case 'montana_numeros':
        return 'Montaña de Números';
      case 'lago_emociones':
        return 'Lago de Emociones';
      default:
        return zoneId;
    }
  }

  String get zoneIcon {
    switch (zoneId) {
      case 'bosque_letras':
        return '📚';
      case 'montana_numeros':
        return '🔢';
      case 'lago_emociones':
        return '💚';
      default:
        return '📍';
    }
  }
}
