import '../services/hive_service.dart';
import '../services/remote_db_service.dart';
import '../services/connectivity_service.dart';
import '../models/quiz_result_model.dart';

/// Orchestrates local (Hive) ↔ remote (Firestore stub) synchronization.
///
/// Current strategy:
///   - Always write to Hive first (offline-first).
///   - When online and remote is available, push local changes and pull remote.
class SyncService {
  SyncService._();
  static final SyncService instance = SyncService._();

  final _hive = HiveService.instance;
  final RemoteDbService _remote = StubRemoteDbService();
  final _conn = ConnectivityService.instance;

  Future<void> init() async {
    await _remote.init();
  }

  /// Try syncing once if we are online and remote is available.
  Future<void> syncIfOnline() async {
    if (!_conn.isOnline || !_remote.isAvailable) return;
    await _pullFromRemote();
    await _pushToRemote();
  }

  Future<void> _pullFromRemote() async {
    final subjects = await _remote.fetchSubjects();
    for (final s in subjects) {
      await _hive.saveSubject(s);
    }
    final topics = await _remote.fetchTopics();
    for (final t in topics) {
      await _hive.saveTopic(t);
    }
    final formulas = await _remote.fetchFormulas();
    for (final f in formulas) {
      await _hive.saveFormula(f);
    }
    final remoteFavs = await _remote.fetchFavorites();
    if (remoteFavs.isNotEmpty) {
      final localFavs = _hive.getFavoriteIds();
      await _hive.saveFavoriteIds(localFavs.union(remoteFavs));
    }
  }

  Future<void> _pushToRemote() async {
    final favIds = _hive.getFavoriteIds();
    await _remote.pushFavorites(favIds);
  }

  Future<void> saveQuizResult(QuizResultModel result) async {
    await _hive.saveQuizResult(result);
    if (_conn.isOnline && _remote.isAvailable) {
      await _remote.pushQuizResult(result);
    }
  }
}
