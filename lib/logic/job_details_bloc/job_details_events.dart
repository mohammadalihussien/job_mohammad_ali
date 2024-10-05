abstract class JobDetailsEvents {}

class FetchJobDetails extends JobDetailsEvents {
  String uuid;
  FetchJobDetails({required this.uuid});
}