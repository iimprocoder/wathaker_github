import 'data.dart';

class DateTims {
  int? code;
  String? status;
  Data? data;

  DateTims({this.code, this.status, this.data});

  factory DateTims.fromJson(Map<String, dynamic> json) => DateTims(
        code: json['code'] as int?,
        status: json['status'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'data': data?.toJson(),
      };
}
