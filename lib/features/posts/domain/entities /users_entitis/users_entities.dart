import 'package:equatable/equatable.dart';

import '../../../data/model/users_model/users_model.dart';

class UserEntities extends Equatable {
  final String id;
  final String? userName;
  final String? displayName;
  final String? verifiedEmail;
  final String? gender;
  final String? country;
  final int? reviewsCount;
  final FollowCount? followCount;

  const UserEntities({
    required this.id,
    this.userName,
    this.displayName,
    this.verifiedEmail,
    this.gender,
    this.country,
    this.reviewsCount,
    this.followCount,
  });

  @override
  List<Object?> get props => [
        userName,
        displayName,
        verifiedEmail,
        gender,
        country,
        reviewsCount,
        followCount,
        id
      ];
}

class FollowCount {
  final int? followers;
  final int? followings;

  FollowCount({
    this.followers,
    this.followings,
  });
}
extension convertUserEntitiesToApiUserModel on ApiUserModel{
  UserEntities toUserEntities(){
    return UserEntities(
      id: id??'',
      userName: userName,
      displayName: displayName,
      verifiedEmail: verifiedEmail,
      gender: gender,
      country: country,
      reviewsCount: reviewsCount,
      followCount: FollowCount(
      ),
    );
  }
}