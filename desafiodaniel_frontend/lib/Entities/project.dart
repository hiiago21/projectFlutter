class Project {
  int _idProject;
  String _name;
  int _idDep;
  String _description;
  String _startDate;
  String _finalDate;

  Project(this._idProject, this._name, this._idDep, this._description,
      this._startDate, this._finalDate);

  Project.fromJson(Map<String, dynamic> parsedJson)
      : this(
            parsedJson['idProject'],
            parsedJson['name'],
            parsedJson['idDep'],
            parsedJson['description'],
            parsedJson['startDate'],
            parsedJson['finalDate']);

  int get idProject => _idProject;
  String get name => _name;
  int get idDep => _idDep;
  String get description => _description;
  String get startDate => _startDate;
  String get finalDate => _finalDate;

  @override
  String toString() {
    return 'Project{_idProject: $_idProject, _name: $_name, _idDep: $_idDep' +
        '_description: $_description, _startDate: $_startDate, _finalDate: $_finalDate}';
  }
}
