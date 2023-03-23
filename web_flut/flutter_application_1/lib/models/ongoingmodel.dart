class Ongoing {
  String? animeName;
  String? condition;
  String? imageSrc;
  int? latestEpisode;
  String? link;
  String? summary;
  String? views;

  Ongoing(
      {this.animeName,
      this.condition,
      this.imageSrc,
      this.latestEpisode,
      this.link,
      this.summary,
      this.views});

  Ongoing.fromJson(Map<dynamic, dynamic> json) {
    animeName = json['Anime Name'];
    condition = json['Condition'];
    imageSrc = json['Image_src'];
    latestEpisode = json['Latest_Episode'];
    link = json['Link'];
    summary = json['Summary'];
    views = json['Views'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Anime Name'] = animeName;
    data['Condition'] = condition;
    data['Image_src'] = imageSrc;
    data['Latest_Episode'] = latestEpisode;
    data['Link'] = link;
    data['Summary'] = summary;
    data['Views'] = views;
    return data;
  }
}
