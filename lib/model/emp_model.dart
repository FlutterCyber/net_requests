
class Employee {
  late int id;
  late String emp_name;
  late int emp_salary;
  late int emp_age;
  late String profile_image;

  Employee.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        emp_name = json['emp_name'],
        emp_salary = json['emp_salary'],
        emp_age = json['emp_age'],
        profile_image = json['profile_imege'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'emp_name': emp_name,
        'emp_salary': emp_salary,
        'emp_age': emp_age,
        'profile_image': profile_image,
      };
}
