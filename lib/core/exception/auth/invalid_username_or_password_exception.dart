class InvalidUsernameOrPasswordException implements Exception {
  const InvalidUsernameOrPasswordException();

  @override
  String toString() {
    return "Invalid username or password";
  }
}
