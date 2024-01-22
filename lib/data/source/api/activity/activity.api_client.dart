import '../ibase_api_client.dart';
import 'activity.api.dart';

class ActivityApiClient extends IBaseApiClient {
  late final ActivityApi api;

  ActivityApiClient() {
    api = ActivityApi(dio);
  }
}
