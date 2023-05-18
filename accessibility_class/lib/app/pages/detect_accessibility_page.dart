import 'dart:ui';

import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';

class DetectAccessibilityPage extends StatefulWidget {
  const DetectAccessibilityPage({super.key});

  @override
  State<DetectAccessibilityPage> createState() =>
      _DetectAccessibilityPageState();
}

class _DetectAccessibilityPageState extends State<DetectAccessibilityPage> {
  late final PlatformDispatcher dispatcher;
  @override
  void initState() {
    super.initState();

    dispatcher = PlatformDispatcher.instance;
    dispatcher.onAccessibilityFeaturesChanged = onAccessibilityIsChanged;
  }

  void onAccessibilityIsChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final features = dispatcher.accessibilityFeatures;
    final screenReaderIsOn = features.accessibleNavigation;
    final boldTextIsOn = features.boldText;
    final disableAnimations = features.disableAnimations;
    final highContrastIsOn = features.highContrast;
    final invertColorsIsOn = features.invertColors;
    final showLabelsInSwitch = features.onOffSwitchLabels;
    final reduceMotionIsOn = features.reduceMotion;

    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return DefaultScaffold(
      title: widget.runtimeType.toString(),
      body: Column(
        children: [
          _Item(
            value: true,
            on: Text('TextScaleFactor $textScaleFactor'),
            off: const Text('TalkBack is off'),
          ),
          _Item(
            value: screenReaderIsOn,
            on: const Text('TalkBack is on'),
            off: const Text('TalkBack is off'),
          ),
          _Item(
            value: boldTextIsOn,
            on: const Text('BoldText is on'),
            off: const Text('BoldText is off'),
          ),
          _Item(
            value: disableAnimations,
            on: const Text('DisableAnimations is on'),
            off: const Text('DisableAnimations is off'),
          ),
          _Item(
            value: highContrastIsOn,
            on: const Text('HighContrast is on'),
            off: const Text('HighContrast is off'),
          ),
          _Item(
            value: invertColorsIsOn,
            on: const Text('InvertColors is on'),
            off: const Text('InvertColors is off'),
          ),
          _Item(
            value: showLabelsInSwitch,
            on: const Text('ShowLabelsInSwitch is on'),
            off: const Text("ShowLabelsInSwitch is off"),
          ),
          _Item(
            value: reduceMotionIsOn,
            on: const Text('reduceMotion is on'),
            off: const Text('reduceMotion is off'),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.value,
    required this.on,
    required this.off,
  }) : super(key: key);

  final bool value;
  final Widget on;
  final Widget off;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      child: Container(
        width: size.width * 0.7,
        padding: const EdgeInsets.all(8.0),
        child: Center(child: value ? on : off),
      ),
    );
  }
}
