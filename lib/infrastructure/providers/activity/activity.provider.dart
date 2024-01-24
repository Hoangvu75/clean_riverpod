import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/usecase/iusecase.dart';
import '../../../domain/entities/models/activity/activity.dart';
import '../../../domain/usecases/get_random_activity.usecase.dart';

part 'activity.provider.g.dart';

@riverpod
Future<Activity> getActivity(GetActivityRef ref) async {
  final getRandomActivityUseCase = GetRandomActivityUsecase();
  return getRandomActivityUseCase.call(NoParams());
}
