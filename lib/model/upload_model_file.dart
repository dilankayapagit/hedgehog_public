class UploadModelFile {
  final HashModel? hash;
  final int? size;

  UploadModelFile({
    this.hash,
    this.size,
  });

  UploadModelFile copyWith({
    HashModel? hash,
    int? size,
  }) {
    return UploadModelFile(
      hash: hash ?? this.hash,
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hash': hash?.toMap(),
      'size': size,
    };
  }

  factory UploadModelFile.fromMap(Map<String, dynamic> map) {
    return UploadModelFile(
      hash: map['hash'] != null ? HashModel.fromMap(map['hash']) : null,
      size: map['size'] != null ? map['size'] : 0,
    );
  }
}

class HashModel {
  final String? path;
  final Map<String, String>? cid;

  HashModel({
    this.path,
    this.cid,
  });

  HashModel copyWith({
    String? path,
    Map<String, String>? cid,
  }) {
    return HashModel(
      path: path ?? this.path,
      cid: cid ?? this.cid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'path': path,
      'cid': cid,
    };
  }

  factory HashModel.fromMap(Map<String, dynamic> map) {
    return HashModel(
      path: map['path'],
      cid: map['cid'] != null ? Map<String, String>.from(map['cid']) : null,
    );
  }
}
