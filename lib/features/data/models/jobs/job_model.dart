import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wahg_v1/features/domain/entities/jobs/job_entity.dart';

class JobModel extends Job {
  const JobModel({
    required super.jobTitle,
    required super.jobDescription,
    required super.jobSalary,
    required super.jobPhone,
    required super.jobLocation,
    required super.jobCategory,
    required super.createAt,
    required super.jobId,
    required super.jobImages,
  });

  factory JobModel.fromSnapshot(DocumentSnapshot doc) {
    try {
      return JobModel(
        jobTitle: doc.get('jobTitle') as String,
        jobDescription: doc.get('jobDescription') as String,
        jobSalary: doc.get('jobSalary') as String,
        jobPhone: doc.get('jobPhone') as String,
        jobLocation: doc.get('jobLocation') as String,
        jobCategory: doc.get('jobCategory') as String,
        createAt: doc.get('createAt').toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        jobImages: List<String>.from(doc.get('jobImages')),
        jobId: doc.id,
      );
    } catch (e) {
      print('555 Jobs Remote Imp is :$e');

      throw '❌ Error in JobModel.fromSnapshot : $e';
    }
  }

  // Anther Version for Testing
  factory JobModel.fromSnapshot2(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    try {
      var job = JobModel(
        jobTitle: data['jobTitle'],
        jobDescription: data['jobDescription'] ?? "",
        jobSalary: data['jobSalary'] ?? "",
        jobPhone: data['jobPhone'] ?? "",
        jobLocation: data['jobLocation'] ?? "",
        jobCategory: data['jobCategory'] ?? "",
        createAt: data['createAt'].toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        jobImages: doc.get('jobImages') ?? [],
        jobId: data['jobId'] ?? "",
      );
      return job;
    } catch (e) {
      throw '❌ Error in JobModel.fromSnapshot : $e';
    }
  }

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      jobTitle: json['jobTitle'] as String,
      jobDescription: json['jobDescription'] as String,
      jobSalary: json['jobSalary'] as String,
      jobPhone: json['jobPhone'] as String,

      jobLocation: json['jobLocation'] as String,
      jobCategory: json['jobCategory'] as String,
       createAt: json['createAt'] as DateTime,
       jobImages: List<String>.from(json['jobImages']),
      jobId: json['jobId'] as String,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'jobTitle': jobTitle,
      'jobDescription': jobDescription,
      'jobSalary': jobSalary,
      'jobPhone': jobPhone,
      'jobLocation': jobLocation,
      'jobCategory': jobCategory,
       'createAt': createAt,
       'jobImages': jobImages,
      'jobId': jobId,
    };
  }
}
