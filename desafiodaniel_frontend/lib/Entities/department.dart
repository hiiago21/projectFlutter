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

  String get description {
    if (_description == null) {
      return "";
    }
    return _description;
  }

  @override
  String toString() {
    return 'Task{_id: $_id, _name: $_name, _description: $_description}';
  }

  Map<String, dynamic> toPostJson() => {
        '"name"': '"' + _name + '"',
        '"description"': '"' + _description + '"',
      };

  // static String getNameByID(int idDep, Department[] deps){
  //   for(int i = 0; i < deps.Length; i++){
  //     if(deps[i].id == idDep){
  //        return deps[i].name;
  //     }
  //   }
  // }
}
