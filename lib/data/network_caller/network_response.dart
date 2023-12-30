class NetworkResponse {
  final int? statusCode;
  final bool isSuccess;
  String? jsonResponse;
  final String? errorMessage;

  NetworkResponse(
      {this.statusCode = -1,
      required this.isSuccess,
      this.jsonResponse,
      this.errorMessage = "something went wrong!"});
}
