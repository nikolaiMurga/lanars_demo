import '../dto/user_dto.dart';

class RandomUserResponse {
  final List<UserDto>? results;

  RandomUserResponse({this.results});

  factory RandomUserResponse.fromJson(Map<String, dynamic> json) => RandomUserResponse(
        results: json["results"] == null ? [] : List<UserDto>.from(json["results"]!.map((x) => UserDto.fromJson(x))),
      );
}

