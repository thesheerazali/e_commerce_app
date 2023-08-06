import 'package:flutter/material.dart';

class TabIndicators extends StatelessWidget {
  final int _numTabs;
  final int _activeIdx;
  final Color _activeColor;
  final Color _inactiveColor;
  final Size _size;

  final double _height;

  const TabIndicators(
      {required int numTabs,
      required int activeIdx,
      required Color activeColor,
      required Size size,
      required double height,
      Color inactiveColor = const Color(0x00FFFFFF),
      Key? key})
      : _numTabs = numTabs,
        _activeIdx = activeIdx,
        _activeColor = activeColor,
        _inactiveColor = inactiveColor,
        _size = size,
        _height = height,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final elements = <Widget>[];

    for (var i = 0; i < _numTabs; ++i) {
      elements.add(Expanded(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _size.width * .05,
        ),
        child:
            Container(color: i == _activeIdx ? _activeColor : _inactiveColor),
      )));
    }

    return SizedBox(
      height: _height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _size.width * .03),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: elements,
        ),
      ),
    );
  }
}
