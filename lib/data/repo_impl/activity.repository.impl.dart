import '../../domain/entities/models/activity/activity.dart';
import '../../domain/repositories/activity.repository.dart';
import '../source/api/activity/activity.api_client.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  ActivityRepositoryImpl({required this.apiClient});
  final ActivityApiClient apiClient;

  @override
  Future<Activity> getRandomActivity() async {
    final activity = await apiClient.api.getRandomActivity();
    return activity;
  }
}
