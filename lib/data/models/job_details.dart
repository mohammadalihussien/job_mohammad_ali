import 'package:job_offers_mohammad_ali/data/models/company_details.dart';
import 'package:job_offers_mohammad_ali/data/models/job.dart';
import 'package:job_offers_mohammad_ali/data/models/status.dart';
import 'package:job_offers_mohammad_ali/data/models/tags.dart';
import 'type.dart';
import 'filters.dart';
import 'icp_answers.dart';
import 'location.dart';

class JobDetails {
  DataDetails? data;

  JobDetails({this.data});

  JobDetails.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? DataDetails.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataDetails {
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
  CompanyDetails? company;
  IcpAnswers? icpAnswers;
  Tags? tags;
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

  DataDetails(
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
        this.tags,
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

  DataDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdDate = json['created_date'];
    salaryRange = json['salary_range'].cast<int>();

    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    openForDiscussion = json['open_for_discussion'];
    commissionBased = json['commission_based'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    status =
    json['status'] != null ? Status.fromJson(json['status']) : null;
    workplacePreference = json['workplace_preference'] != null
        ? Status.fromJson(json['workplace_preference'])
        : null;
    workplaceType = json['workplace_type'] != null
        ? Status.fromJson(json['workplace_type'])
        : null;
    vertical =
    json['vertical'] != null ? Status.fromJson(json['vertical']) : null;
    isPredefinedListSet = json['is_predefined_list_set'];
    company =
    json['company'] != null ? CompanyDetails.fromJson(json['company']) : null;
    icpAnswers = json['icp_answers'] != null
        ? IcpAnswers.fromJson(json['icp_answers'])
        : null;
    print(json['tags']);
    tags = json['tags'] != null ? Tags.fromJson(json['tags']):null;
    uuid = json['uuid'];
    title = json['title'];
    updatedDate = json['updated_date'];
    filters =
    json['filters'] != null ? Filters.fromJson(json['filters']) : null;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['created_date'] = this.createdDate;
    data['salary_range'] = this.salaryRange;
    if (this.benefits != null) {
      data['benefits'] = this.benefits!.map((v) => v.toJson()).toList();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['open_for_discussion'] = this.openForDiscussion;
    data['commission_based'] = this.commissionBased;
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.workplacePreference != null) {
      data['workplace_preference'] = this.workplacePreference!.toJson();
    }
    if (this.workplaceType != null) {
      data['workplace_type'] = this.workplaceType!.toJson();
    }
    if (this.vertical != null) {
      data['vertical'] = this.vertical!.toJson();
    }
    data['is_predefined_list_set'] = this.isPredefinedListSet;
    data['uuid'] = this.uuid;
    data['title'] = this.title;
    data['updated_date'] = this.updatedDate;
    if (this.filters != null) {
      data['filters'] = this.filters!.toJson();
    }
    data['unique_token'] = this.uniqueToken;
    data['created_source'] = this.createdSource;
    data['is_curation_requested'] = this.isCurationRequested;
    data['curation_requested_date_time'] = this.curationRequestedDateTime;
    data['cancellation_reason'] = this.cancellationReason;
    data['edit_attempts'] = this.editAttempts;
    data['is_default'] = this.isDefault;
    data['order'] = this.order;
    data['job_bucket'] = this.jobBucket;
    if (this.genericCandidateApplications != null) {
      data['generic_candidate_applications'] =
          this.genericCandidateApplications!.map((v) => v!.toJson()).toList();
    }
    return data;
  }
}














