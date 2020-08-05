class SingleResponse<T> {
  bool status;
  String message;
  T data;

  SingleResponse({this.status, this.message, this.data});

  factory SingleResponse.make(Map<String, dynamic> object) {
    return SingleResponse(
        status: object['status'],
        message: object['message'],
        data: object['data']);
  }
}
