import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../../../core/api/endpoints.dart';
import '../../../shared/models/child_profile.dart';

// Children state
class ChildrenState {
  final List<ChildProfile> children;
  final ChildProfile? selectedChild;
  final bool isLoading;
  final String? error;

  ChildrenState({
    this.children = const [],
    this.selectedChild,
    this.isLoading = false,
    this.error,
  });

  ChildrenState copyWith({
    List<ChildProfile>? children,
    ChildProfile? selectedChild,
    bool? isLoading,
    String? error,
    bool clearSelected = false,
  }) {
    return ChildrenState(
      children: children ?? this.children,
      selectedChild: clearSelected ? null : (selectedChild ?? this.selectedChild),
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

// Children notifier
class ChildrenNotifier extends StateNotifier<ChildrenState> {
  final ApiEndpoints _api;

  ChildrenNotifier(this._api) : super(ChildrenState());

  Future<void> loadChildren() async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _api.getChildren();
      final children = result.map((c) => ChildProfile.fromJson(c)).toList();
      state = state.copyWith(children: children, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> createChild({
    required String name,
    required int age,
    String avatarType = 'dragon',
    int dailyTimeLimit = 30,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _api.createChild({
        'name': name,
        'age': age,
        'avatarType': avatarType,
        'dailyTimeLimit': dailyTimeLimit,
      });
      final child = ChildProfile.fromJson(result);
      state = state.copyWith(
        children: [...state.children, child],
        selectedChild: child,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void selectChild(ChildProfile child) {
    state = state.copyWith(selectedChild: child);
  }

  Future<void> updateChild(String id, Map<String, dynamic> data) async {
    try {
      await _api.updateChild(id, data);
      await loadChildren();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

final childrenProvider = StateNotifierProvider<ChildrenNotifier, ChildrenState>((ref) {
  final api = ref.watch(apiEndpointsProvider);
  return ChildrenNotifier(api);
});

final selectedChildProvider = Provider<ChildProfile?>((ref) {
  return ref.watch(childrenProvider).selectedChild;
});
