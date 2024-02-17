class Juz {
  int? juz;
  String? juzStartInfo;
  String? juzEndInfo;
  int? totalVerses;

  Juz({
    this.juz,
    this.juzStartInfo,
    this.juzEndInfo,
    this.totalVerses,
  });

  Juz.fromJson(Map<String, dynamic> json) {
    juz = json['juz'];
    juzStartInfo = json['juzStartInfo'];
    juzEndInfo = json['juzEndInfo'];
    totalVerses = json['totalVerses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['juz'] = juz;
    data['juzStartInfo'] = juzStartInfo;
    data['juzEndInfo'] = juzEndInfo;
    return data;
  }
}
