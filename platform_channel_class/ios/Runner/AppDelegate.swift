import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel1 = FlutterMethodChannel(name: "method_channel_class",
                                                  binaryMessenger: controller.binaryMessenger)
    
    channel1.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
      // This method is invoked on the UI thread.
      if call.method == "getBattery" {
        self?.receiveBatteryLevel(result: result)
      } else if call.method == "getHelloMessage" {
        let args = call.arguments as! [String: String] // Dictionary/Map
        let name = args["name"] as! String
        result("Hello, \(name)")
      } else if call.method == "getList" {
        let values: [Int] = [1, 2, 3, 4, 5]
        result(values)
      } else if call.method == "getMap" {
        let values: [String: Int] = ["1":1, "2":2, "3": 3]
        result(values)
      } else if call.method == "getJson" {
        let json: String = "[{\"name\": \"Daniel Fernandes\"}, {\"name\": \"FTeam\"}]"
        result(json)
      } else{
        result(FlutterMethodNotImplemented)
        return
      }     
    })
      
    let channel2 = FlutterMethodChannel(name: "method_channel_class2",
                                                  binaryMessenger: controller.binaryMessenger)
    
    channel2.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
        if call.method == "getList" {
          let values: [Int] = [6, 7, 8, 9, 10]
          result(values)
        } else {
          result(FlutterMethodNotImplemented)
          return
        }      
    })

    let eventChannel = FlutterEventChannel(name: "event_channel_class",
                                                  binaryMessenger: controller.binaryMessenger)
    eventChannel.setStreamHandler(RandomNumberStreamHandler())
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func receiveBatteryLevel(result: FlutterResult) {
    let device = UIDevice.current
    device.isBatteryMonitoringEnabled = true
    if device.batteryState == UIDevice.BatteryState.unknown {
      // result(FlutterError(code: "UNAVAILABLE",
      //                     message: "Battery level not available.",
      //                     details: nil))
      result(Int(101))
    } else {
      result(Int(device.batteryLevel * 100))
    }
  }
}

class RandomNumberStreamHandler: NSObject, FlutterStreamHandler {
  private var eventSink: FlutterEventSink?
  private var timer: Timer?

  public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
    self.eventSink = events
    
    sendRandomNumberEvent()
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(sendRandomNumberEvent), userInfo: nil, repeats: true)
    
    return nil
  }  
    
  @objc private func sendRandomNumberEvent() {
    guard let eventSink = eventSink else {
      return
    }

    eventSink(Int.random(in: 1..<100))
  }

  public func onCancel(withArguments arguments: Any?) -> FlutterError? {
    timer?.invalidate()
    eventSink = nil
    return nil
  }
}  


