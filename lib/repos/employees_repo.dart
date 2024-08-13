import 'package:kafaa_app/models/employee_model.dart';
import 'package:kafaa_app/utils/dio_client.dart';

class EmployeesRepo {
  EmployeesRepo({required this.client});

  final DioClient client;

  Future<List<EmployeeModel>> getEmployees({
    required String password,
    String? search = '',
  }) async {
    Map<String, dynamic> response = await client.get(
      'employee/name?name=${search ?? ''}',
      password: password,
    );

    return EmployeeModel.listFromJson(response['data']);
  }

  Future<bool> addEmployee({
    required String password,
    required EmployeeModel employee,
  }) async {
    Map<String, dynamic> response = await client.post(
      'employee/create',
      password: password,
      data: employee.toJson(),
    );

    return response['status'];
  }

  Future<bool> editEmployee({
    required String password,
    required EmployeeModel employee,
  }) async {
    Map<String, dynamic> response = await client.post(
      'employee/update',
      password: password,
      data: employee.toJson(),
    );

    return response['status'];
  }

  Future<bool> deleteEmployee({
    required String password,
    required EmployeeModel employee,
  }) async {
    Map<String, dynamic> response = await client.delete(
      'employee/delete?id=${employee.id}',
      password: password,
    );

    return response['status'];
  }
}
