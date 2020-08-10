import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'course_detail.g.dart';

@HiveType(typeId: 0)
class CourseDetail extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String courseName;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final int rating;

  @HiveField(4)
  final String tutor;

  @HiveField(5)
  final String category;

  CourseDetail({
    this.id,
    this.courseName,
    this.description,
    this.rating,
    this.tutor,
    this.category,
  });

  @override
  // TODO: implement props
  List<Object> get props => [];
}
