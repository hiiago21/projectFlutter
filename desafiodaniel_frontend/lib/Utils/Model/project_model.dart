import 'package:desafiodaniel_frontend/Utils/Providers/departments_provider.dart';

import '../Providers/projects_provider.dart';

class ProjectModel {
  ProjectsProvider dp = new ProjectsProvider();

  getAll() async {
    return await dp.fetchAllProjects();
  }

  getById(id) async {
    return await dp.fetchProjectById(id);
  }
}
