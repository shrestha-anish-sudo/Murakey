import 'package:murarkey/Data/Response/Status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? messages;
  ApiResponse(this.status, this.data, this.messages);
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.Completed() : status = Status.COMPLETED;
  ApiResponse.Error() : status = Status.ERROR;
  String toString() {
    return "Status : $status \n  Message : $messages \n Data : $data";
  }
}
