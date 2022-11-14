import 'package:api_consumption/network/network_enums.dart';

typedef NetWorkCallBack<R> = R Function(dynamic);
typedef NetworkOnFailureCallBackWithMessage<R> = R Function(
  NetworkResponseErrorType, String?
);
