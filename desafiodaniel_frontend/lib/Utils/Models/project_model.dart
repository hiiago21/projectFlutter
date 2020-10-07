import 'package:flutter/material.dart';
import '../../Entities/project.dart';
import '../Providers/projects_provider.dart';

class ProjectModel extends ChangeNotifier {
  ProjectsProvider _provider = ProjectsProvider();

  Project project;
  List<Project> projects;

  ProjectModel.withProvider(this._provider);

  ProjectModel();

  void update(String id) async {
    projects = await _provider.fetchAllProjects();

    notifyListeners();
  }
}
