class HTTPException implements Exception {
  String message;
  HTTPException({required this.message});
  @override
  String toString() {
    return message;
  }
}

class EmptyException implements Exception {
  String message;
  EmptyException({required this.message});
  @override
  String toString() {
    return message;
  }
}
