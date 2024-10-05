import 'package:job_offers_mohammad_ali/data/models/company_details.dart';
import 'package:job_offers_mohammad_ali/data/models/status.dart';
import 'type.dart';
import 'company.dart';
import 'filters.dart';
import 'icp_answers.dart';
import 'location.dart';

class Job {
  int? id;
  String? createdDate;
  List<int>? salaryRange;
  List? benefits;
  Location? location;
  bool? openForDiscussion;
  bool? commissionBased;
  Type? type;
  Status? status;
  Status? workplacePreference;
  Status? workplaceType;
  Status? vertical;
  bool? isPredefinedListSet;
  Company? company;
  IcpAnswers? icpAnswers;
  String? uuid;
  String? title;
  String? updatedDate;
  Filters? filters;
  String? uniqueToken;
  String? createdSource;
  bool? isCurationRequested;
  String? curationRequestedDateTime;
  String? cancellationReason;
  int? editAttempts;
  bool? isDefault;
  int? order;
  int? jobBucket;
  List? genericCandidateApplications;

  Job(
      {this.id,
        this.createdDate,
        this.salaryRange,
        this.benefits,
        this.location,
        this.openForDiscussion,
        this.commissionBased,
        this.type,
        this.status,
        this.workplacePreference,
        this.workplaceType,
        this.vertical,
        this.isPredefinedListSet,
        this.company,
        this.icpAnswers,
        this.uuid,
        this.title,
        this.updatedDate,
        this.filters,
        this.uniqueToken,
        this.createdSource,
        this.isCurationRequested,
        this.curationRequestedDateTime,
        this.cancellationReason,
        this.editAttempts,
        this.isDefault,
        this.order,
        this.jobBucket,
        this.genericCandidateApplications});

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdDate = json['created_date'];
    salaryRange = json['salary_range'].cast<int>();

    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    openForDiscussion = json['open_for_discussion'];
    commissionBased = json['commission_based'];
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    workplacePreference = json['workplace_preference'] != null
        ? new Status.fromJson(json['workplace_preference'])
        : null;
    workplaceType = json['workplace_type'] != null
        ? new Status.fromJson(json['workplace_type'])
        : null;
    vertical =
    json['vertical'] != null ? new Status.fromJson(json['vertical']) : null;
    isPredefinedListSet = json['is_predefined_list_set'];
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
    icpAnswers = json['icp_answers'] != null
        ? new IcpAnswers.fromJson(json['icp_answers'])
        : null;
    uuid = json['uuid'];
    title = json['title'];
    updatedDate = json['updated_date'];
    filters =
    json['filters'] != null ? new Filters.fromJson(json['filters']) : null;
    uniqueToken = json['unique_token'];
    createdSource = json['created_source'];
    isCurationRequested = json['is_curation_requested'];
    curationRequestedDateTime = json['curation_requested_date_time'];
    cancellationReason = json['cancellation_reason'];
    editAttempts = json['edit_attempts'];
    isDefault = json['is_default'];
    order = json['order'];
    jobBucket = json['job_bucket'];

  }
}