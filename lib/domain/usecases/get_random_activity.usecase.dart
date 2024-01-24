import '../../app.dart';
import '../../core/usecase/iusecase.dart';
import '../entities/models/activity/activity.dart';
import '../repositories/repositories_export.dart';

class GetRandomActivityUsecase extends IUsecase<Activity> {
  final ActivityRepository repository = App.find();

  @override
  Future<Activity> asyncCall() async {
    return await repository.getRandomActivity();
  }
}
