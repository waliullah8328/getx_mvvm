

class  AppExceptions implements Exception{

  final _message;
  final _prefix;

  AppExceptions([this._message,this._prefix]);

  String toString(){
    return "$_prefix$_message";
  }



}

class InternetExceptions extends AppExceptions{
  InternetExceptions([String? message]):super(message,"No Internet");

}

class RequestTimeOutExceptions extends AppExceptions{
  RequestTimeOutExceptions([String? message]):super(message,"No Internet");

}

class ServerExceptions extends AppExceptions{
  ServerExceptions([String? message]):super(message,"Internet server error");

}

class InvalidUrlExceptions extends AppExceptions{
  InvalidUrlExceptions([String? message]):super(message,"Invalid Url");

}

class FetchDataExceptions extends AppExceptions{
  FetchDataExceptions([String? message]):super(message,);

}