class UserModel {
  String username;
  String hashedPassword;
  String firstName;
  String lastName;
  String gender;
  int age;
  double weight;
  double height;
  String disease;
  String profession;
  String goal;

  UserModel({
    required this.username,
    required this.hashedPassword,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.age,
    required this.weight,
    required this.height,
    required this.disease,
    required this.profession,
    required this.goal,
  });

  // Factory constructor to create a UserModel from a map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      hashedPassword: json['hashedPassword'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      age: json['age'],
      weight: json['weight'],
      height: json['height'],
      disease: json['disease'],
      profession: json['profession'],
      goal: json['goal'],
    );
  }

  // Convert the UserModel to a map
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'hashedPassword': hashedPassword,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'age': age,
      'weight': weight,
      'height': height,
      'disease': disease,
      'profession': profession,
      'goal': goal,
    };
  }
}
