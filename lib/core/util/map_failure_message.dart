import '../error/failure.dart';

String mapFailureToMessage(Failure failure){
  const String serverFailureMessage = 'Server failure';
  const String cacheFailureMessage = 'Cache failure';
  switch(failure.runtimeType){
    case ServerFailure _ :
      return serverFailureMessage ;
    case CacheFailure _ :
      return cacheFailureMessage;
    default:
      return 'Unexpected error';
  }
}