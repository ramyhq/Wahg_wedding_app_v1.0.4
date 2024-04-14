import 'package:equatable/equatable.dart';

import '../../../../const/app_enums.dart';

class Job extends Equatable {
  final String? jobTitle;
  final String? jobDescription;
  final String? jobSalary;
  final String? jobPhone;
  final String? jobLocation;
  final String? jobCategory;
  final DateTime? createAt;
  final String? jobId;
  final List<String>? jobImages;

  const Job({
    this.jobTitle,
    this.jobDescription,
    this.jobSalary,
    this.jobPhone,
    this.jobLocation,
    this.jobCategory,
    this.createAt,
    this.jobId,
    this.jobImages,
  });

  @override
  List<Object?> get props =>
      [
        jobTitle,
        jobDescription,
        jobSalary,
        jobPhone,
        jobLocation,
        jobCategory,
        createAt,
        jobId,
        jobImages,
      ];

}
