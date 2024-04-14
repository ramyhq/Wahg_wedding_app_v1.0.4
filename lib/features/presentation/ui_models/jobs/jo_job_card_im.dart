
import 'package:wahg_v1/const/app_assete.dart';

/// This class is used in the [JoJobCardIW] screen.
class JoJobCardIM {
  String? jobTitle;
  String? jobDes;
  String? jobSalary;
  String? jobCategory;
  DateTime? jobPostDate;
  String? id;

  JoJobCardIM({
    this.jobTitle,
    this.jobDes,
    this.jobSalary,
    this.jobCategory,
    this.jobPostDate,
    this.id,
  }) {
    jobTitle = jobTitle ??"Job Title";
    jobDes = jobDes ?? "job des";
    jobSalary = jobSalary ?? "0.0";
    jobCategory = jobCategory ?? "other";
    jobPostDate = jobPostDate ?? DateTime.now();
    id = id ?? "";
  }


}
