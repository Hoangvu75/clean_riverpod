import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../domain/entities/models/activity/activity.dart';

part 'activity.api.g.dart';

@RestApi()
abstract class ActivityApi {
  factory ActivityApi(Dio dio) = _ActivityApi;

  @GET("/api/activity")
  Future<Activity> getRandomActivity();
}
