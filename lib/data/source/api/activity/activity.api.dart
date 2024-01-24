import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/constants_export.dart';
import '../../../../domain/entities/models/activity/activity.dart';

part 'activity.api.g.dart';

@RestApi()
abstract class ActivityApi {
  factory ActivityApi(Dio dio) = _ActivityApi;

  @GET(ApiUrlConstants.ACTIVITY_ENDPOINT)
  Future<Activity> getRandomActivity();
}
