// Coded By M.Alfaz

// Follow me on instagram @alfawhocodes

import 'dart:math' as math show pi;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoldCardMain(),
    ),
  );
}

class FoldCardMain extends StatefulWidget {
  FoldCardMain({Key? key}) : super(key: key);

  @override
  State<FoldCardMain> createState() => _FoldCardMainState();
}

class _FoldCardMainState extends State<FoldCardMain> {
  final _foldcardKey1 = GlobalKey<FoldCardState>();
  final _foldcardKey2 = GlobalKey<FoldCardState>();
  final _foldcardKey3 = GlobalKey<FoldCardState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            FoldCard(
              key: _foldcardKey1,
              frontWidget: _buildFrontWidget(_foldcardKey1, " Flutter Course ",
                  Color.fromARGB(255, 70, 132, 255)),
              innerWidget: _buildInnerWidget(
                  _foldcardKey1,
                  "DM \"Flutter\" for mentorship",
                  "Limited only",
                  "assets/images/flutterlogo.png",
                  Color.fromARGB(255, 133, 194, 255),
                  Color(0xff123456)),
              cardSize: Size(MediaQuery.of(context).size.width, 140),
              padding: EdgeInsets.all(15),
              animationDuration: Duration(milliseconds: 500),
              borderRadius: 12,
              onOpen: () => {},
              onClose: () => {},
            ),
            FoldCard(
              key: _foldcardKey2,
              frontWidget: _buildFrontWidget(_foldcardKey2, "Follow now",
                  Color.fromARGB(255, 118, 63, 255)),
              innerWidget: _buildInnerWidget(
                  _foldcardKey2,
                  "AlfaWhoCodes",
                  "On Instagram",
                  "assets/images/alfacodes.png",
                  Color.fromARGB(255, 118, 63, 255),
                  Color.fromARGB(242, 192, 167, 255)),
              cardSize: Size(MediaQuery.of(context).size.width, 125),
              padding: EdgeInsets.all(15),
              animationDuration: Duration(milliseconds: 400),
              borderRadius: 12,
              onOpen: () => {},
              onClose: () => {},
            ),
            FoldCard(
              key: _foldcardKey3,
              frontWidget: _buildFrontWidget(
                _foldcardKey3,
                "Do Share & Comment",
                Color.fromARGB(255, 42, 158, 187),
              ),
              innerWidget: _buildInnerWidget(
                  _foldcardKey3,
                  "",
                  "Save for later",
                  "assets/images/saveicon.png",
                  Color.fromARGB(255, 102, 166, 182),
                  Color.fromARGB(255, 42, 158, 187)),
              cardSize: Size(MediaQuery.of(context).size.width, 140),
              padding: EdgeInsets.all(15),
              animationDuration: Duration(milliseconds: 500),
              borderRadius: 12,
              onOpen: () => {},
              onClose: () => {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFrontWidget(
      GlobalKey<FoldCardState> key, String title, Color colorName) {
    return Container(
      color: colorName,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: GoogleFonts.montserrat(
                color: Color.fromARGB(235, 255, 255, 255),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            right: 8,
            top: 4,
            child: ElevatedButton(
              onPressed: () => key.currentState?.toggleFold(),
              child: Text(
                'Open',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: colorName,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(colorName),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInnerWidget(
      GlobalKey<FoldCardState> key,
      String InnerText,
      String InnerTitleText,
      String InnerImg,
      Color innerColor,
      Color innerColorlight) {
    return Container(
      color: innerColorlight,
      padding: EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              InnerTitleText,
              style: GoogleFonts.montserrat(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Image.asset(InnerImg,
                      height: 100,
                      scale: 2.5,
                      //color: Color.fromARGB(255, 111, 54, 255),
                      opacity: const AlwaysStoppedAnimation<double>(1)),
                ),
                Text(
                  InnerText,
                  style: GoogleFonts.montserrat(
                      color: innerColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: ElevatedButton(
              onPressed: () => key.currentState?.toggleFold(),
              child: Text(
                'Close',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: innerColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 118, 63, 255)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Folding Cell Widget
class FoldCard extends StatefulWidget {
  FoldCard(
      {Key? key,
      required this.frontWidget,
      required this.innerWidget,
      this.cardSize = const Size(100.0, 100.0),
      this.unfoldCell = false,
      this.skipAnimation = false,
      this.padding =
          const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 10),
      this.animationDuration = const Duration(milliseconds: 1000),
      this.borderRadius = 0.0,
      this.onOpen,
      this.onClose})
      : assert(frontWidget != null),
        assert(innerWidget != null),
        assert(cardSize != null),
        assert(unfoldCell != null),
        assert(skipAnimation != null),
        assert(padding != null),
        assert(animationDuration != null),
        assert(borderRadius != null && borderRadius >= 0.0),
        super(key: key);

  final Widget? frontWidget;
  final Widget? innerWidget;
  final Size? cardSize;
  final EdgeInsetsGeometry? padding;
  final Duration? animationDuration;
  final double? borderRadius;
  final VoidCallback? onOpen;
  final bool? unfoldCell;
  final bool? skipAnimation;
  final VoidCallback? onClose;

  @override
  FoldCardState createState() => FoldCardState();
}

class FoldCardState extends State<FoldCard>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (widget.onOpen != null) widget.onOpen!();
      } else if (status == AnimationStatus.dismissed) {
        if (widget.onClose != null) widget.onClose!();
      }
    });

    if (widget.unfoldCell == true) {
      _animationController.value = 1;
      _isExpanded = true;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          final angle = _animationController.value * pi;
          final cellWidth = widget.cardSize?.width;
          final cellHeight = widget.cardSize?.height;

          return Padding(
            padding: widget.padding!,
            child: Container(
              color: Colors.transparent,
              width: cellWidth,
              height: cellHeight! + (cellHeight * _animationController.value),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(widget.borderRadius!),
                        topRight: Radius.circular(widget.borderRadius!)),
                    child: Container(
                      width: cellWidth,
                      height: cellHeight,
                      child: OverflowBox(
                        minHeight: cellHeight,
                        maxHeight: cellHeight * 2,
                        alignment: Alignment.topCenter,
                        child: ClipRect(
                          child: Align(
                            heightFactor: 0.5,
                            alignment: Alignment.topCenter,
                            child: widget.innerWidget,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(angle),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationX(pi),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(widget.borderRadius!),
                            bottomRight: Radius.circular(widget.borderRadius!)),
                        child: Container(
                          width: cellWidth,
                          height: cellHeight,
                          child: OverflowBox(
                            minHeight: cellHeight,
                            maxHeight: cellHeight * 2,
                            alignment: Alignment.topCenter,
                            child: ClipRect(
                              child: Align(
                                heightFactor: 0.5,
                                alignment: Alignment.bottomCenter,
                                child: widget.innerWidget,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(angle),
                    child: Opacity(
                      opacity: angle >= 1.5708 ? 0.0 : 1.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(widget.borderRadius!),
                            topRight: Radius.circular(widget.borderRadius!)),
                        child: Container(
                          width: angle >= 1.5708 ? 0.0 : cellWidth,
                          height: angle >= 1.5708 ? 0.0 : cellHeight,
                          child: widget.frontWidget,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void toggleFold() {
    if (_isExpanded) {
      if (widget.skipAnimation == true) {
        _animationController.value = 0;
      } else {
        _animationController.reverse();
      }
    } else {
      if (widget.skipAnimation == true) {
        _animationController.value = 1;
      } else {
        _animationController.forward();
      }
    }
    _isExpanded = !_isExpanded;
  }
}
