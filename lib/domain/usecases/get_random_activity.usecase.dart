import '../../app.dart';
import '../../core/usecase/iusecase.dart';
import '../entities/models/activity/activity.dart';
import '../repositories/repositories_export.dart';

class GetRandomActivityUsecase implements IUseCase<Activity, NoParams> {
  final ActivityRepository repository = App.find();

  @override
  Future<Activity> call(NoParams noParams) async {
    return await repository.getRandomActivity();
  }
}
