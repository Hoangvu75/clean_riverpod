import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';

part 'activity.g.dart';

@freezed
class Activity with _$Activity {
  factory Activity({
    required String? activity,
    required String? type,
    required num? participants,
    required num? price,
    required String? link,
    required String? key,
    required num? accessibility,
  }) = _Activity;

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}
