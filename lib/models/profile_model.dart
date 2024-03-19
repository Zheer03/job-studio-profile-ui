import 'package:job_studio_profile_ui/models/user_model.dart';

class ProfileModel {
  final UserModel user;
  final String? tagline;
  final int? yearsOfExperience;
  final String? jobCategory;
  final String? gender;
  final String? location;
  final String? bio;
  final DateTime? birthday;
  final String? cvFilePath;

  ProfileModel({
    required this.user,
    this.tagline,
    this.yearsOfExperience,
    this.jobCategory,
    this.gender,
    this.location,
    this.bio,
    this.birthday,
    this.cvFilePath,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> data) => ProfileModel(
        user: UserModel.fromJson(data['user']),
        tagline: data['tagline'],
        yearsOfExperience: data['years_of_experience'],
        jobCategory: data['job_category'],
        gender: data['gender'],
        location: data['location'],
        bio: data['bio'],
        birthday: DateTime.tryParse(data['birthday']),
        cvFilePath: data['cv_file_path'],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "tagline": tagline,
        "years_of_experience": yearsOfExperience,
        "job_category": jobCategory,
        "gender": gender,
        "location": location,
        "bio": bio,
        "birthday": birthday?.toIso8601String(),
        "cv_file_path": cvFilePath,
      };
}
