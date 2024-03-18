// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FolderCustomModel {
  final String? folderName;
  final String? folderId;
  final String? parentId;
  final bool? isDeleted;

  final dynamic? createdAt;
  final dynamic? updatedAt;
  FolderCustomModel({
    this.folderName,
    this.folderId,
    this.parentId,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  FolderCustomModel copyWith({
    String? folderName,
    String? folderId,
    String? parentId,
    bool? isDeleted,
    dynamic? createdAt,
    dynamic? updatedAt,
  }) {
    return FolderCustomModel(
      folderName: folderName ?? this.folderName,
      folderId: folderId ?? this.folderId,
      parentId: parentId ?? this.parentId,
      isDeleted: isDeleted ?? this.isDeleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'folderName': folderName,
      'folderId': folderId,
      'parentId': parentId,
      'isDeleted': isDeleted,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory FolderCustomModel.fromMap(Map<String, dynamic> map) {
    return FolderCustomModel(
      folderName:
          map['folderName'] != null ? map['folderName'] as String : null,
      folderId: map['folderId'] != null ? map['folderId'] as String : null,
      parentId: map['parentId'] != null ? map['parentId'] as String : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
      createdAt: map['createdAt'] != null
          ? map['createdAt'].toDate() as dynamic
          : null,
      updatedAt: map['updatedAt'] != null
          ? map['updatedAt'].toDate() as dynamic
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FolderCustomModel.fromJson(String source) =>
      FolderCustomModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FolderUploadModel(folderName: $folderName, folderId: $folderId, parentId: $parentId, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant FolderCustomModel other) {
    if (identical(this, other)) return true;

    return other.folderName == folderName &&
        other.folderId == folderId &&
        other.parentId == parentId &&
        other.isDeleted == isDeleted &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return folderName.hashCode ^
        folderId.hashCode ^
        parentId.hashCode ^
        isDeleted.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
