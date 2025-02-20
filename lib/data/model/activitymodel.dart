class ActivityModel {
  int? activityId;
  String? activityTitle;
  String? activityDisc;
  String? activityCreated;
  String? activityDate;
  String? activityLocation;
  int? activityCode;
  int? activityUsersId;
  int? activityActiv;
  String? activityLangtude;
  String? activityLatitude;
  String? activityGrob;
  int? participate;

  ActivityModel(
      {this.activityId,
      this.activityTitle,
      this.activityDisc,
      this.activityCreated,
      this.activityDate,
      this.activityLocation,
      this.activityCode,
      this.activityUsersId,
      this.activityActiv,
      this.activityLangtude,
      this.activityLatitude,
      this.activityGrob,
      this.participate});

  ActivityModel.fromJson(Map<String, dynamic> json) {
    activityId = json['activity_id'];
    activityTitle = json['activity_title'];
    activityDisc = json['activity_disc'];
    activityCreated = json['activity_created'];
    activityDate = json['activity_date'];
    activityLocation = json['activity_location'];
    activityCode = json['activity_code'];
    activityUsersId = json['activity_users_id'];
    activityActiv = json['activity_activ'];
    activityLangtude = json['activity_langtude'];
    activityLatitude = json['activity_latitude'];
    activityGrob = json['activity_grob'];
    participate = json['participate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activity_id'] = this.activityId;
    data['activity_title'] = this.activityTitle;
    data['activity_disc'] = this.activityDisc;
    data['activity_created'] = this.activityCreated;
    data['activity_date'] = this.activityDate;
    data['activity_location'] = this.activityLocation;
    data['activity_code'] = this.activityCode;
    data['activity_users_id'] = this.activityUsersId;
    data['activity_activ'] = this.activityActiv;
    data['activity_langtude'] = this.activityLangtude;
    data['activity_latitude'] = this.activityLatitude;
    data['activity_grob'] = this.activityGrob;
    data['participate'] = this.participate;
    return data;
  }
}