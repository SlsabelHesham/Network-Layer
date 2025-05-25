/*class BaseResponse<T> {
  final T? data;
  final String? successMessage;
  final String? code;

  BaseResponse({this.data, this.successMessage, this.code});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      data: (json["data"] as Map<String, dynamic>) as T,//.parse<T>(),
      successMessage: json["message"],
      code: json["code"],
    );
  }
}*/


class BaseResponse<T> {
  final T? data;
  final String? successMessage;
  final String? code;

  BaseResponse({
    this.data,
    this.successMessage,
    this.code,
  });

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, {
        T Function(dynamic json)? fromJsonT,
      }) {
    return BaseResponse(
      data: fromJsonT != null && json["data"] != null ? fromJsonT(json["data"]) : null,
      successMessage: json["message"]?.toString(),
      code: json["code"]?.toString(),
    );
  }
}
