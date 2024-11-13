sealed class RequestCreationState {
  const RequestCreationState();
}

class InitialState extends RequestCreationState {
  const InitialState();
}

class LoadingState extends RequestCreationState {
  const LoadingState();
}

class SuccessState extends RequestCreationState {
  const SuccessState();
}

class ErrorState extends RequestCreationState {
  const ErrorState();
}
