class BaseResponse<T> {
  final T? data;
  final String? successMessage;
  final String? code;
  final int? statusCode;
  final bool? isSuccess;
  final String? errorMessage;
  final String? detailedErrorMessage;
  final int? totalCount;

  BaseResponse({
    this.data,
    this.successMessage,
    this.code,
    this.statusCode,
    this.isSuccess,
    this.errorMessage,
    this.detailedErrorMessage,
    this.totalCount,
  });

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, {
        T Function(dynamic json)? fromJsonT,
      }) {

    final responseData = json["response"];

    T? parsedData;
    if (fromJsonT != null && responseData != null) {
      parsedData = fromJsonT(responseData);
    }

    return BaseResponse(
      data: parsedData,
      successMessage: json["message"]?.toString(),
      code: json["code"]?.toString(),
      statusCode: json["statusCode"],
      isSuccess: json["isSuccess"],
      errorMessage: json["errorMessage"],
      detailedErrorMessage: json["detailedErrorMessage"],
      totalCount: json["totalCount"],
    );
  }
}


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

/*
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
*/