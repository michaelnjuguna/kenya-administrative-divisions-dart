class County {
  final int countyCode;
  final String countyName;
  final List<Constituency> constituencies;

  const County(
      {required this.countyCode,
      required this.countyName,
      required this.constituencies});

  factory County.fromJson(Map<String, dynamic> json) {
    return County(
      countyCode: json['county_code'] as int,
      countyName: json['county_name'] as String,
      constituencies: (json['constituencies'] as List<dynamic>)
          .map((e) => Constituency.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Constituency {
  final String constituencyName;
  final List<Ward> wards;

  const Constituency({
    required this.constituencyName,
    required this.wards,
  });
  factory Constituency.fromJson(Map<String, dynamic> json) {
    return Constituency(
      constituencyName: json['constituency_name'] as String,
      wards: (json['wards'] as List<dynamic>)
          .map((w) => Ward(name: w as String))
          .toList(),
    );
  }
}

class Ward {
  final String name;

  const Ward({required this.name});
  factory Ward.fromJson(String name) => Ward(name: name);
}
