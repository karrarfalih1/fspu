class ActivityModel {
  int? activityId;
  String? activityTitle;
  String? activityDisc;
  String? activityCreated;
  String? activityDate;
  String? activityLocation;
  int? activityCode;
  int? activityShere;

  ActivityModel(
      {this.activityId,
      this.activityTitle,
      this.activityDisc,
      this.activityCreated,
      this.activityDate,
      this.activityLocation,
      this.activityCode,
      this.activityShere});

  ActivityModel.fromJson(Map<String, dynamic> json) {
    activityId = json['activity_id'];
    activityTitle = json['activity_title'];
    activityDisc = json['activity_disc'];
    activityCreated = json['activity_created'];
    activityDate = json['activity_date'];
    activityLocation = json['activity_location'];
    activityCode = json['activity_code'];
    activityShere = json['activity_shere'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activity_id'] = activityId;
    data['activity_title'] = activityTitle;
    data['activity_disc'] = activityDisc;
    data['activity_created'] = activityCreated;
    data['activity_date'] = activityDate;
    data['activity_location'] = activityLocation;
    data['activity_code'] = activityCode;
    data['activity_shere'] = activityShere;
    return data;
  }
}