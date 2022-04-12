enum Status { LOADING, COMPLETED, ERROR }

class AppResponse<T> {
  Status? status;
  T? body;
  String? message;

  AppResponse({this.status, this.body, this.message});

  AppResponse.loading({this.message}) : status = Status.LOADING;

  AppResponse.error(this.message) : status = Status.ERROR;

  AppResponse.completed(this.body, {this.message}) : status = Status.COMPLETED;

  bool get hasError => status == Status.ERROR;
  bool get isLoading => status == Status.LOADING;
  bool get isCompleted => status == Status.COMPLETED;
}
