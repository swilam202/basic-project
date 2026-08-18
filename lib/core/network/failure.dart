
class Failure{
  final int? status;
  final String? message;
  Failure(this.status,this.message);

  factory Failure.fromJson(Map<String,dynamic> json){
    return Failure(json['status'], json['message']);
  }
}