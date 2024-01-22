import '../../data/repo_impl/activity.repository.impl.dart';
import '../../data/source/api/activity/activity.api_client.dart';
import '../entities/models/activity/activity.dart';

abstract class ActivityRepository {
  factory ActivityRepository({
    required ActivityApiClient apiClient,
  }) = ActivityRepositoryImpl;

  Future<Activity> getRandomActivity();
}
