class Data {
  List<WealthSummary>? result;

  Data({this.result});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['wealthSummary'] != null) {
      result = [];
      json['wealthSummary'].forEach((v) {
        result?.add(WealthSummary.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['wealthSummary'] = result?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WealthSummary {
  int? id;
  double? cdi;
  double? gain;
  double? profitability;
  double? total;

  WealthSummary({this.id, this.cdi, this.gain, this.profitability, this.total});

  WealthSummary.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cdi = json['cdi'] is int ? json['cdi'].toDouble() : json['cdi'];
    gain = json['gain'] is int ? json['gain'].toDouble() : json['gain'];
    profitability = json['profitability'] is int
        ? json['profitability'].toDouble()
        : json['profitability'];
    total = json['total'] is int ? json['total'].toDouble() : json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cdi'] = cdi;
    data['gain'] = gain;
    data['profitability'] = profitability;
    data['total'] = total;
    return data;
  }
}
