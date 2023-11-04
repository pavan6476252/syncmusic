class ApiErrorHandling<T> {
  final T? data;  
  bool error;
  String errorMsg;

  ApiErrorHandling({required this.data, required this.error, required this.errorMsg});
}
