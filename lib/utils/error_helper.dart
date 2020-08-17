class ErrorHelper {
  static console({
    String errorHeader,
    String errorCode,
    String errorDetail,
    String errorMessage,
  }) {
    print('== $errorHeader ==');
    if (errorCode != null) print('ERROR CODE :: $errorCode');
    if (errorDetail != null) print('ERROR DETAIL :: $errorDetail');
    if (errorMessage != null) print('ERROR MESSAGE :: $errorMessage');
  }
}
