// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserCustomModel {
  final String? uerId;
  final int? storageUsedBytes;
  final String? payPackageId;
  final dynamic? payPackage;
  final dynamic? createdAt;
  final dynamic? updatedAt;

  UserCustomModel({
    this.uerId,
    this.storageUsedBytes,
    this.payPackageId,
    this.payPackage,
    this.createdAt,
    this.updatedAt,
  });

  UserCustomModel copyWith({
    String? uerId,
    int? storageUsedBytes,
    String? payPackageId,
    dynamic? payPackage,
    dynamic? createdAt,
    dynamic? updatedAt,
  }) {
    return UserCustomModel(
      uerId: uerId ?? this.uerId,
      storageUsedBytes: storageUsedBytes ?? this.storageUsedBytes,
      payPackageId: payPackageId ?? this.payPackageId,
      payPackage: payPackage ?? this.payPackage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uerId': uerId,
      'storageUsedBytes': storageUsedBytes,
      'payPackageId': payPackageId,
      'payPackage': payPackage,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory UserCustomModel.fromMap(Map<String, dynamic> map) {
    return UserCustomModel(
      uerId: map['uerId'] != null ? map['uerId'] as String : null,
      storageUsedBytes: map['storageUsedBytes'] != null ? map['storageUsedBytes'] as int : null,
      payPackageId: map['payPackageId'] != null ? map['payPackageId'] as String : null,
      payPackage: map['payPackage'] != null ? map['payPackage'] as dynamic : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as dynamic : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as dynamic : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserCustomModel.fromJson(String source) =>
      UserCustomModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserCustomModel(uerId: $uerId, storageUsedBytes: $storageUsedBytes, payPackageId: $payPackageId, payPackage: $payPackage, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant UserCustomModel other) {
    if (identical(this, other)) return true;

    return other.uerId == uerId &&
        other.storageUsedBytes == storageUsedBytes &&
        other.payPackageId == payPackageId &&
        other.payPackage == payPackage &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return uerId.hashCode ^
        storageUsedBytes.hashCode ^
        payPackageId.hashCode ^
        payPackage.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}






//.toDate()