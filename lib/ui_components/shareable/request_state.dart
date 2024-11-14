sealed class RequestState {
  const RequestState();
}

class InitialState extends RequestState {
  const InitialState();
}

class LoadingState extends RequestState {
  const LoadingState();
}

class SuccessState<T> extends RequestState {
  final T? data;
  const SuccessState([this.data]);
}

class ErrorState extends RequestState {
  const ErrorState();
}
