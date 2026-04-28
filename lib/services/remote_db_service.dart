import '../models/formula_model.dart';
import '../models/subject_model.dart';
import '../models/topic_model.dart';
import '../models/quiz_result_model.dart';

abstract class RemoteDbService {
  Future<void> init();
  bool get isAvailable;

  Future<List<SubjectModel>> fetchSubjects();
  Future<List<TopicModel>> fetchTopics();
  Future<List<FormulaModel>> fetchFormulas();
  Future<void> pushFavorites(Set<String> ids);
  Future<Set<String>> fetchFavorites();
  Future<void> pushQuizResult(QuizResultModel result);
}

/// No-op implementation — used on Windows/web and when Firebase is unavailable.
class StubRemoteDbService implements RemoteDbService {
  @override
  Future<void> init() async {}

  @override
  bool get isAvailable => false;

  @override
  Future<List<SubjectModel>> fetchSubjects() async => [];

  @override
  Future<List<TopicModel>> fetchTopics() async => [];

  @override
  Future<List<FormulaModel>> fetchFormulas() async => [];

  @override
  Future<void> pushFavorites(Set<String> ids) async {}

  @override
  Future<Set<String>> fetchFavorites() async => {};

  @override
  Future<void> pushQuizResult(QuizResultModel result) async {}
}

/// Alias so sync_service.dart can always reference FirestoreRemoteDbService
/// on non-mobile platforms — it just resolves to the stub.
class FirestoreRemoteDbService extends StubRemoteDbService {}
