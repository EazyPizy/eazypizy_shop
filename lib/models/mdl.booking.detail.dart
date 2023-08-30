import '../core/typedefs.dart';
import 'booking_product_model.dart';

class BookingDetailModel {
  BookingDetailModel({
    this.canceled_by,
    this.cancel_reason,
    this.service_start_code,
    this.service_end_code,
    this.eazymen_id,
    this.eazymen_name,
    this.eazymen_location,
    this.eazymen_fcm_token,
    this.payment_tax,
    this.payment_items_total,
    this.payment_discount,
    this.payment_total,
    this.customer_id,
    this.customer_name,
    this.customer_address,
    this.customer_phone,
    this.customer_fcm_token,
    this.booking_date,
    this.booking_scheduled_date,
    this.booking_scheduled_time,
    this.booking_id,
    this.booking_status,
    required this.products,
  });
  factory BookingDetailModel.fromMap(DynamicMap doc, String booking_id) =>
      BookingDetailModel(
        eazymen_id: doc['eazymen_id'] as String?,
        eazymen_name: doc['eazymen_name'] as String?,
        eazymen_location: doc['eazymen_location'] as String?,
        eazymen_fcm_token: doc['eazymen_fcm_token'] as String?,
        payment_tax: doc['payment_tax'].toDouble() as double?,
        payment_items_total: doc['payment_items_total'].toDouble() as double?,
        payment_discount: doc['payment_discount'] as int?,
        payment_total: doc['payment_total'].toDouble() as double?,
        customer_id: doc['customer_id'] as String?,
        customer_name: doc['customer_name'] as String?,
        customer_address: doc['customer_address'] == null
            ? null
            : AddressModel.fromMap(doc['customer_address'] as DynamicMap),
        customer_phone: doc['customer_phone'] as String?,
        customer_fcm_token: doc['customer_fcm_token'] as String?,
        booking_date: doc['booking_date'] as String?,
        booking_scheduled_date: doc['booking_scheduled_date'] as String?,
        booking_scheduled_time: doc['booking_scheduled_time'] as String?,
        booking_id: booking_id,
        booking_status: doc['booking_status'] as int?,
        cancel_reason: doc['cancel_reason'] as String?,
        canceled_by: doc['canceled_by'] as int?,
        service_end_code: doc['service_end_code'] as int?,
        service_start_code: doc['service_start_code'] as int?,
        products: doc['products']
            .map<BookingProductModel>(
              (e) => BookingProductModel.fromMap(e as DynamicMap),
            )
            .toList() as List<BookingProductModel>,
      );
  final String? eazymen_id;
  final String? eazymen_name;
  final String? eazymen_location;
  final String? eazymen_fcm_token;
  final double? payment_tax;
  final double? payment_items_total;
  final int? payment_discount;
  final double? payment_total;
  final String? customer_id;
  final String? customer_name;
  final String? customer_phone;
  final String? customer_fcm_token;
  final AddressModel? customer_address;
  final String? booking_date;
  // final String? booking_time;
  final String? booking_scheduled_date;
  final String? booking_scheduled_time;
  final String? booking_id;
  final int? booking_status;
  final int? canceled_by;
  final String? cancel_reason;
  final int? service_start_code;
  final int? service_end_code;
  final List<BookingProductModel> products;

  DynamicMap toMap() => {
        'products': products.map((e) => e.toMap()).toList(),
        'eazymen_id': eazymen_id,
        'eazymen_name': eazymen_name,
        'eazymen_location': eazymen_location,
        'eazymen_fcm_token': eazymen_fcm_token,
        'payment_tax': payment_tax,
        'payment_items_total': payment_items_total,
        'payment_discount': payment_discount,
        'payment_total': payment_total,
        'customer_id': customer_id,
        'customer_name': customer_name,
        'customer_phone': customer_phone,
        'customer_fcm_token': customer_fcm_token,
        'customer_address': customer_address,
        'booking_date': booking_date,
        'booking_scheduled_date': booking_scheduled_date,
        'booking_scheduled_time': booking_scheduled_time,
        'booking_status': booking_status,
        'canceled_by': canceled_by,
        'cancel_reason': cancel_reason,
        'service_start_code': service_start_code,
        'service_end_code': service_end_code,
      };
}

class AddressModel {
  AddressModel({
    required this.houseNumber,
    required this.localArea,
    required this.city,
    required this.state,
    required this.pincode,
    this.landMark,
  });
  AddressModel.fromMap(Map<String, dynamic> map)
      : houseNumber = map['houseNumber'] as String,
        localArea = map['localArea'] as String,
        city = map['city'] as String,
        state = map['state'] as String,
        pincode = map['pincode'] as String,
        landMark = map['landMark'] as String?;
  final String houseNumber;
  final String localArea;
  final String city;
  final String state;
  final String pincode;
  final String? landMark;

  Map<String, dynamic> toMap() {
    return {
      'houseNumber': houseNumber,
      'localArea': localArea,
      'city': city,
      'state': state,
      'pincode': pincode,
      'landMark': landMark,
    };
  }

  AddressModel copyWith({
    String? houseNumber,
    String? localArea,
    String? city,
    String? state,
    String? pincode,
    String? landMark,
  }) =>
      AddressModel(
        houseNumber: houseNumber ?? this.houseNumber,
        localArea: localArea ?? this.localArea,
        city: city ?? this.city,
        state: state ?? this.state,
        pincode: pincode ?? this.pincode,
        landMark: landMark ?? this.landMark,
      );

  @override
  String toString() {
    return '$houseNumber, $localArea - $pincode, $city';
  }
}
