import '../../data/source/api/activity/activity.api_client.dart';
import '../entities/models/activity/activity.dart';
import '../repositories/activity.repository.dart';

class GetRandomActivityUsecase {
  Future<Activity> call() async {
    final repository = ActivityRepository(apiClient: ActivityApiClient());
    return await repository.getRandomActivity();
  }
}
