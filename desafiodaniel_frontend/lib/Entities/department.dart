class Department {
  int _id;
  String _name;
  String _description;

  Department(this._id, this._name, this._description);

  Department.fromJson(Map<dynamic, dynamic> parsedJson)
      : this(
            parsedJson['idDep'], parsedJson['name'], parsedJson['description']);

  int get idDep => _id;
  String get name => _name;
  String get description => _description;

  @override
  String toString() {
    return 'Task{_id: $_id, _name: $_name, _description: $_description}';
  }
}
