enum UserRole {
  chairperson,
  studentAffairs,
  accountsOfficer,
  staffHead,
  itHead,
}

class User {
  final String id;
  final String name;
  final String email;
  final String designation;
  final String profilePictureUrl;
  final UserRole role;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.designation,
    required this.profilePictureUrl,
    required this.role,
  });
}
