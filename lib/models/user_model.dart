class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? imageUrl;
  String? numDist;
  String? nomDist;
  String? codePin;
  String? responsableId;
  bool? enabled;
  bool? isNotLocked;
  bool? isUsingMfa;
  DateTime? createdAt;
  String? roleName;
  String? permissions;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.imageUrl,
    this.numDist,
    this.nomDist,
    this.codePin,
    this.responsableId,
    this.enabled,
    this.isNotLocked,
    this.isUsingMfa,
    this.createdAt,
    this.roleName,
    this.permissions,
  });

  // We use form json for form data // pour un formulaire de souscription par exemple
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      imageUrl: json['imageUrl'] as String?,
      numDist: json['numDist'] as String?,
      nomDist: json['nomDist'] as String?,
      codePin: json['codePin'] as String?,
      responsableId: json['responsableId'] as String?,
      enabled: json['enabled'] as bool?,
      isNotLocked: json['isNotLocked'] as bool?,
      isUsingMfa: json['isUsingMfa'] as bool?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      roleName: json['roleName'] as String?,
      permissions: json['permissions'] as String?,
    );
  }

  // we use it to display data // pour afficher les informations de l'utilisateur
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'imageUrl': imageUrl,
      'numDist': numDist,
      'nomDist': nomDist,
      'codePin': codePin,
      'responsableId': responsableId,
      'enabled': enabled,
      'isNotLocked': isNotLocked,
      'isUsingMfa': isUsingMfa,
      'createdAt': createdAt?.toIso8601String(),
      'roleName': roleName,
      'permissions': permissions,
    };
  }
}
