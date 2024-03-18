// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PayPackageModel {
  final String? payId;
  final String? payName;

  final String? price;
  final String? img;
  final String? description;

  final int? storageBytes;
  final int? bandwidth;
  final int? devices;


  PayPackageModel({
    this.payId,
    this.payName,
    this.price,
    this.img,
    this.description,
    this.storageBytes,
    this.bandwidth,
    this.devices,
  });

  PayPackageModel copyWith({
    String? payId,
    String? payName,
    String? price,
    String? img,
    String? description,
    int? storageBytes,
    int? bandwidth,
    int? devices,
  }) {
    return PayPackageModel(
      payId: payId ?? this.payId,
      payName: payName ?? this.payName,
      price: price ?? this.price,
      img: img ?? this.img,
      description: description ?? this.description,
      storageBytes: storageBytes ?? this.storageBytes,
      bandwidth: bandwidth ?? this.bandwidth,
      devices: devices ?? this.devices,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'payId': payId,
      'payName': payName,
      'price': price,
      'img': img,
      'description': description,
      'storageBytes': storageBytes,
      'bandwidth': bandwidth,
      'devices': devices,
    };
  }

  factory PayPackageModel.fromMap(Map<String, dynamic> map) {
    return PayPackageModel(
      payId: map['payId'] != null ? map['payId'] as String : null,
      payName: map['payName'] != null ? map['payName'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      img: map['img'] != null ? map['img'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      storageBytes: map['storageBytes'] != null ? map['storageBytes'] as int : null,
      bandwidth: map['bandwidth'] != null ? map['bandwidth'] as int : null,
      devices: map['devices'] != null ? map['devices'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PayPackageModel.fromJson(String source) =>
      PayPackageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PayPackageModel(payId: $payId, payName: $payName, price: $price, img: $img, description: $description, storageBytes: $storageBytes, bandwidth: $bandwidth, devices: $devices)';
  }

  @override
  bool operator ==(covariant PayPackageModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.payId == payId &&
      other.payName == payName &&
      other.price == price &&
      other.img == img &&
      other.description == description &&
      other.storageBytes == storageBytes &&
      other.bandwidth == bandwidth &&
      other.devices == devices;
  }

  @override
  int get hashCode {
    return payId.hashCode ^
      payName.hashCode ^
      price.hashCode ^
      img.hashCode ^
      description.hashCode ^
      storageBytes.hashCode ^
      bandwidth.hashCode ^
      devices.hashCode;
  }
}
