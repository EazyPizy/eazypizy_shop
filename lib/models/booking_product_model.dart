class BookingProductModel {
  BookingProductModel({
    // required this.id,
    this.price,
    this.quantity,
    this.serviceIDs,
    required this.serviceProductName,
    this.subServiceIDs,
    required this.serviceProductId,
    required this.serviceProdImage,
  });
  factory BookingProductModel.fromMap(Map<String, dynamic> map) {
    return BookingProductModel(
      // id: map['id'] as String,
      quantity: map['quantity'] as int?,
      price: map['price'] as double?,
      serviceIDs: map['ServiceIDs'] != null
          ? List<String>.from(map['ServiceIDs'] as Iterable)
          : null,
      serviceProductName: map['ServiceProductName'] as String,
      subServiceIDs: map['SubServiceIDs'] != null
          ? List<String>.from(map['SubServiceIDs'] as Iterable)
          : null,
      serviceProductId: map['ServiceProductID'] as String,
      serviceProdImage: map['serviceProdImage'] as String,
    );
  }
  // String id;
  int? quantity;
  double? price;
  List<String>? serviceIDs;
  List<String>? subServiceIDs;
  String serviceProductName;
  String serviceProductId;
  String serviceProdImage;

  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'quantity': quantity,
      'price': price,
      'ServiceIDs': serviceIDs,
      'ServiceProductName': serviceProductName,
      'SubServiceIDs': subServiceIDs,
      'ServiceProductID': serviceProductId,
      'serviceProdImage': serviceProdImage,
    };
  }

  BookingProductModel copyWith({
    // String? id,
    int? quantity,
    double? price,
    List<String>? serviceIDs,
    String? serviceProductName,
    List<String>? subServiceIDs,
    String? serviceProductId,
    String? serviceProdImage,
  }) {
    return BookingProductModel(
      // id: id ?? this.id,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      serviceIDs: serviceIDs ?? this.serviceIDs,
      serviceProductName: serviceProductName ?? this.serviceProductName,
      subServiceIDs: subServiceIDs ?? this.subServiceIDs,
      serviceProductId: serviceProductId ?? this.serviceProductId,
      serviceProdImage: serviceProdImage ?? this.serviceProdImage,
    );
  }
}
