// ignore_for_file: public_member_api_docs, sort_constructors_first
class ApiErrorHandling<T> {
  final T? data;
  bool error;
  String errorMsg;

  ApiErrorHandling(
      {required this.data, required this.error, required this.errorMsg});

  ApiErrorHandling<T> copyWith({
    T? data,
    bool? error,
    String? errorMsg,
  }) {
    return ApiErrorHandling<T>(
      data: data ?? this.data,
      error: error ?? this.error,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
