class UserIdModel {
  final String _name, _value;

  String get name => _name;
  String get value => _value;

  UserIdModel({
    required String name,
    required String value,
  })  : _name = name,
        _value = value;

  UserIdModel.fromJson(Map<String, dynamic> json)
      : _name = json['name'],
        _value = json['value'] ?? '';
}
