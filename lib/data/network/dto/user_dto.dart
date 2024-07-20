class UserDto {
  final Name? name;
  final String? email;
  final Picture? picture;

  UserDto({this.name, this.email, this.picture});

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
    name: json["name"] == null ? null : Name.fromJson(json["name"]),
    email: json["email"],
    picture: json["picture"] == null ? null : Picture.fromJson(json["picture"]),
  );
}

class Name {
  final String? first;
  final String? last;

  Name({this.first, this.last});

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    first: json["first"],
    last: json["last"],
  );
}

class Picture {
  final String? large;
  final String? medium;
  final String? thumbnail;

  Picture({this.large, this.medium, this.thumbnail});

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
    large: json["large"],
    medium: json["medium"],
    thumbnail: json["thumbnail"],
  );
}