//class MerchantApiProvider {
//  ///home screen
//  Future<BookingModel> getBookingList({Map<String, dynamic> params}) async {
//    try {
//      var res = await RestAPI()
//          .get("${ServerAddresses.todayBooking}" + '?type=${params['type']}');
//      return bookingModelFromMap(res);
//    } on RestException catch (e) {
//      throw e.message;
//    }
//  }
//
//}