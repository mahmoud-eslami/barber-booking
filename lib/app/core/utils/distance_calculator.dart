import 'dart:math';

String distanceBetweenTwoPoints(
    {required myLat, required mylon, required lat1, required lon1}) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((myLat - lat1) * p) / 2 +
      c(lat1 * p) * c(myLat * p) * (1 - c((mylon - lon1) * p)) / 2;

  var kmResult = 12742 * asin(sqrt(a));
  var meterResult = 1000 * kmResult;

  // check for distance and return ditance per meter if distance in less than one kilometer
  return (kmResult >= 1)
      ? "${kmResult.toStringAsFixed(2)} Kilometers away"
      : "${meterResult.toStringAsFixed(2)} meters away";
}
