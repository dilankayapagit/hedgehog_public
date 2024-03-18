// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FileCustomModel {
  final String? fileName;
    final String? password;

  final String? fileId;
  //
  final String? cId;

  //
  final String? fileSize;
  final String? fileType;
  final String? fileUrl;
  final String? parentId;
  //
  final bool? isPinned;
  final bool? isDeleted;

//
  final dynamic? file;

//
  final dynamic? createdAt;
  final dynamic? updatedAt;

  FileCustomModel({
    this.fileName,
    this.password,
    this.fileId,
    this.cId,
    this.fileSize,
    this.fileType,
    this.fileUrl,
    this.parentId,
    this.isPinned,
    this.isDeleted,
    this.file,
    this.createdAt,
    this.updatedAt,
  });

  FileCustomModel copyWith({
    String? fileName,
    String? password,
    String? fileId,
    String? cId,
    String? fileSize,
    String? fileType,
    String? fileUrl,
    String? parentId,
    bool? isPinned,
    bool? isDeleted,
    dynamic? file,
    dynamic? createdAt,
    dynamic? updatedAt,
  }) {
    return FileCustomModel(
      fileName: fileName ?? this.fileName,
      password: password ?? this.password,
      fileId: fileId ?? this.fileId,
      cId: cId ?? this.cId,
      fileSize: fileSize ?? this.fileSize,
      fileType: fileType ?? this.fileType,
      fileUrl: fileUrl ?? this.fileUrl,
      parentId: parentId ?? this.parentId,
      isPinned: isPinned ?? this.isPinned,
      isDeleted: isDeleted ?? this.isDeleted,
      file: file ?? this.file,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fileName': fileName,
      'password': password,
      'fileId': fileId,
      'cId': cId,
      'fileSize': fileSize,
      'fileType': fileType,
      'fileUrl': fileUrl,
      'parentId': parentId,
      'isPinned': isPinned,
      'isDeleted': isDeleted,
      'file': file,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory FileCustomModel.fromMap(Map<String, dynamic> map) {
    return FileCustomModel(
      fileName: map['fileName'] != null ? map['fileName'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      fileId: map['fileId'] != null ? map['fileId'] as String : null,
      cId: map['cId'] != null ? map['cId'] as String : null,
      fileSize: map['fileSize'] != null ? map['fileSize'] as String : null,
      fileType: map['fileType'] != null ? map['fileType'] as String : null,
      fileUrl: map['fileUrl'] != null ? map['fileUrl'] as String : null,
      parentId: map['parentId'] != null ? map['parentId'] as String : null,
      isPinned: map['isPinned'] != null ? map['isPinned'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
      file: map['file'] != null ? map['file'] as dynamic : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as dynamic : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as dynamic : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FileCustomModel.fromJson(String source) =>
      FileCustomModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FileCustomModel(fileName: $fileName, password: $password, fileId: $fileId, cId: $cId, fileSize: $fileSize, fileType: $fileType, fileUrl: $fileUrl, parentId: $parentId, isPinned: $isPinned, isDeleted: $isDeleted, file: $file, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant FileCustomModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.fileName == fileName &&
      other.password == password &&
      other.fileId == fileId &&
      other.cId == cId &&
      other.fileSize == fileSize &&
      other.fileType == fileType &&
      other.fileUrl == fileUrl &&
      other.parentId == parentId &&
      other.isPinned == isPinned &&
      other.isDeleted == isDeleted &&
      other.file == file &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return fileName.hashCode ^
      password.hashCode ^
      fileId.hashCode ^
      cId.hashCode ^
      fileSize.hashCode ^
      fileType.hashCode ^
      fileUrl.hashCode ^
      parentId.hashCode ^
      isPinned.hashCode ^
      isDeleted.hashCode ^
      file.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
  }
}


//.toDate()