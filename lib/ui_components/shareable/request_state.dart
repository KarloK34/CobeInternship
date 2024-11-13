sealed class RequestState {
  const RequestState();
}

class InitialState extends RequestState {
  const InitialState();
}

class LoadingState extends RequestState {
  const LoadingState();
}

class SuccessState extends RequestState {
  const SuccessState();
}

class ErrorState extends RequestState {
  const ErrorState();
}
