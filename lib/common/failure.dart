abstract class Failure {
  final String message;

  Failure(this.message);
}

class ResourceFailure extends Failure {
  ResourceFailure(super.message);
}
