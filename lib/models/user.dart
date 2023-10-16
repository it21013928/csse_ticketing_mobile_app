class UserModel {
  String name;
  String email;
  String password;
  String role;
  String nic;
  String? phone;
  DateTime registeredDate;
  String? accountId;
  String? licenseNo;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.nic,
    required this.registeredDate,
    this.phone,
    this.accountId,
    this.licenseNo,
  });
}