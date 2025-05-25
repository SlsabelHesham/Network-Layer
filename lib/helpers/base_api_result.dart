import 'base_error.dart';

//TODO:: @Rami
/// Why we do not pass this to the ViewModel ?
/// as we saw before the developer can check the status of the request using this and type something like
/// if(status == 200) pass the logic and present the UI
/// Also he can pass a lot of things usings that class from the Data layer to the VM and Views
/// so the best option is to return an obvious Model/Entity start from the Repo
/// and in case of error Throw an Custom Error depends on what we need to know
/// so in that case we have separation of concern that the function returns a straight forward Model/Entity
/// and throws and error so the developer has no option to check any of error status in case of response is passed
class BaseApiResult<T> {
  int? status;
  T? data;
  final BaseApiError? error;
  final String? successMessage;
  String? sessionKey;

  bool get isSuccess => data != null;
  bool get hasError => error != null;

  BaseApiResult({
    this.data,
    this.status,
    this.error,
    this.successMessage,
    this.sessionKey,
  });
}