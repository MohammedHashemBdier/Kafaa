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

    return EmployeeModel.listFromJson(response['message']);
  }
}
