
import 'package:wahg_v1/features/data/models/jobs/job_model.dart';


abstract class JobsFirebaseRemoteDataSource {
  Future<List<JobModel>> getJobsList();

  Future<void> updateAllJobsList({required List<Map<String, dynamic>> data});

}
