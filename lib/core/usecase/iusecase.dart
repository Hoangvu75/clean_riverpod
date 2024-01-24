abstract class IUsecase<Type> {
  Future<Type> asyncCall() => throw UnimplementedError();

  Type call() => throw UnimplementedError();
}

abstract class IUsecaseWithParams<Type, Params> {
  Future<Type> asyncCall(Params params) => throw UnimplementedError();

  Type call(Params params) => throw UnimplementedError();
}
