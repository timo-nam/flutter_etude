class UserLocationStreetModel {
  final int _number;
  final String _name;

  int get number => _number;
  String get name => _name;

  UserLocationStreetModel({
    required int number,
    required String name,
  })  : _number = number,
        _name = name;

  UserLocationStreetModel.fromJson(Map<String, dynamic> json)
      : _number = json['number'],
        _name = json['name'];
}
