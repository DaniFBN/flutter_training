package com.example.platform_channel_class

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.EventChannel
import androidx.annotation.NonNull


import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import com.example.platform_specific.RandomNumberStreamHandler

class MainActivity: FlutterActivity() {
  private val channel = "method_channel_class";
  private val channel2 = "method_channel_class2";
  private val eventChannel = "event_channel_class";

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine){
    super.configureFlutterEngine(flutterEngine)

    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler { 
      call, result -> 
        if(call.method == "getBattery"){
          val batteryLevel: Int = getBatteryLevel()
          result.success(batteryLevel)
        } else if(call.method == "getHelloMessage"){
          var name: String? = call.argument<String>("name")
          if(name != null){
            result.success("Hello, $name")
          }else{
            result.error("NULL_NAME_ERROR", "Send name", null)
          }
        } else if(call.method == "getList"){
          val list = listOf<Int>(1, 2, 3 , 4, 5)
          result.success(list)
        } else if(call.method == "getMap"){
          val map = mapOf<String, Int>("1" to 1, "2" to 2, "3" to 3)
          result.success(map)
        } else if(call.method == "getJson"){
          val json: String = "[{\"name\": \"Daniel Fernandes\"}, {\"name\": \"FTeam\"}]"
          result.success(json)
        }
    }

    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel2).setMethodCallHandler { 
      call, result -> 
        if(call.method == "getList"){
          val list = listOf<Int>(6, 7, 8, 9, 10)
          result.success(list)
        }
    }

    EventChannel(flutterEngine.dartExecutor.binaryMessenger, eventChannel).setStreamHandler(RandomNumberStreamHandler())
  }

  private fun getBatteryLevel(): Int {
    val batteryLevel: Int
    if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
      val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
      batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    } else {
      val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
      batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
    }

    return batteryLevel
  }
}
