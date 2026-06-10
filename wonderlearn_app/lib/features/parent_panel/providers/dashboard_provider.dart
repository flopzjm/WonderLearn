import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../../../core/api/endpoints.dart';

// Dashboard state
class DashboardState {
  final Map<String, dynamic>? dashboardData;
  final bool isLoading;
  final String? error;

  DashboardState({
    this.dashboardData,
    this.isLoading = false,
    this.error,
  });

  DashboardState copyWith({
    Map<String, dynamic>? dashboardData,
    bool? isLoading,
    String? error,
  }) {
    return DashboardState(
      dashboardData: dashboardData ?? this.dashboardData,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

// Dashboard notifier
class DashboardNotifier extends StateNotifier<DashboardState> {
  final ApiEndpoints _api;

  DashboardNotifier(this._api) : super(DashboardState());

  Future<void> loadDashboard(String childId) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _api.getDashboard(childId);
      state = state.copyWith(dashboardData: result, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> updateTimeLimit(String childId, int timeLimit) async {
    try {
      await _api.updateTimeLimit(childId, timeLimit);
      await loadDashboard(childId);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> sendWeeklyReport(String childId) async {
    try {
      await _api.sendWeeklyReport(childId);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

final dashboardProvider = StateNotifierProvider<DashboardNotifier, DashboardState>((ref) {
  final api = ref.watch(apiEndpointsProvider);
  return DashboardNotifier(api);
});
