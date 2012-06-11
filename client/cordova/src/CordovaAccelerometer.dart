//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, May 2, 2012  10:09:21 AM
// Author: henrichen

/**
 * Accelerometer implementation for Cordova device.
 */
class CordovaAccelerometer extends AbstractAccelerometer {
  CordovaAccelerometer() {
    _initJSFunctions();
  }
  void getCurrentAcceleration(AccelerometerSuccessCallback onSuccess, AccelerometerErrorCallback onError) {
    jsCall("accelerometer.getCurrentAcceleration", [_wrapFunction(onSuccess), onError]);
  }
  
  AccelerometerSuccessCallback wrapSuccessListener_(AccelerationEventListener listener) {
    return (jsAccel) => listener(new AccelerationEvent(this, new Acceleration.from(toDartMap(jsAccel))));
  }
  
  AccelerometerErrorCallback wrapErrorListener_(AccelerationEventListener listener) {
    return () => listener(new AccelerationEvent(this, null, false));
  }

  _wrapFunction(dartFn) {
    return (jsAccel) => dartFn(new Acceleration.from(toDartMap(jsAccel)));
  }
  
  watchAcceleration(AccelerometerSuccessCallback onSuccess, AccelerometerErrorCallback onError, [Map options]) {
    return jsCall("accelerometer.watchAcceleration", [onSuccess, onError, toJSMap(options)]);
  }
  
  void clearWatch(var watchID) {
    jsCall("accelerometer.clearWatch", [watchID]);
  }
  
  void _initJSFunctions() {
      newJSFunction("accelerometer.getCurrentAcceleration", ["onSuccess", "onError"], ''' 
        var fnSuccess = function(accel) {onSuccess.\$call\$1(accel);},
            fnError = function() {onError.\$call\$0();};
        navigator.accelerometer.getCurrentAcceleration(fnSuccess, fnError);
      ''');
      newJSFunction("accelerometer.watchAcceleration", ["onSuccess", "onError", "opts"], '''
        var fnSuccess = function(accel) {onSuccess.\$call\$1(accel);},
            fnError = function() {onError.\$call\$0();};
        return navigator.accelerometer.watchAcceleration(fnSuccess, fnError, opts);
      ''');
      newJSFunction("accelerometer.clearWatch", ["watchID"], "navigator.accelerometer.clearWatch(watchID);");
  }
}