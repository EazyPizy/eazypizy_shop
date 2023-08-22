import 'package:eazypizy_shop/theme/app_colors.dart';
import 'package:eazypizy_shop/widgets/easy_container.dart';
import 'package:flutter/material.dart';

class EazyCount extends StatefulWidget {
  const EazyCount({
    required this.width,
    required this.count,
    super.key,
  });

  final double width;
  final int count;

  @override
  _EazyCountState createState() => _EazyCountState();
}

class _EazyCountState extends State<EazyCount> {
  int get count => widget.count;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: widget.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.blue,
            height: 40,
            width: 30,
            child: InkWell(
              onTap: () async {
                // if (count == 1) {
                //   setState(() {
                //     isTrue = false;
                //   });
                // } else if (count > 1) {
                //   setState(() {
                //     count--;
                //   });
                // }
              },
              child: const Icon(
                Icons.remove,
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            '$count',
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            color: Colors.blue,
            height: 30,
            width: 30,
            child: InkWell(
              onTap: () async {
                // setState(() {
                //   count++;
                // });
              },
              child: const Icon(
                Icons.add,
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomStepper extends StatefulWidget {
  CustomStepper({
    super.key,
    required this.lowerLimit,
    this.upperLimit = 1000,
    required this.stepValue,
    required this.iconSize,
    required this.value,
    required this.onChange,
  });

  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  final double iconSize;
  final void Function(int) onChange;
  int value;

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return EasyContainer(
      height: 30,
      color: EazyColors.white,
      borderColor: EazyColors.primary,
      showBorder: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const Spacer(),
          EasyContainer(
              customBorderRadius: BorderRadius.only(
                topRight: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
              color: EazyColors.primary,
              onTap: () {
                if (widget.value > widget.lowerLimit) {
                  setState(() {
                    widget.value = widget.value == widget.lowerLimit
                        ? widget.lowerLimit
                        : widget.value -= widget.stepValue;
                    widget.onChange(widget.value);
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 3.0, right: 3),
                child: Icon(
                  Icons.remove,
                  color: EazyColors.white,
                ),
              )),
          // RoundedIconButton(
          //   iconColor: widget.value <= widget.lowerLimit
          //       ? EazyColors.white
          //       : EazyColors.white,
          //   fillColor: widget.value <= widget.lowerLimit
          //       ? EazyColors.primary
          //       : EazyColors.primary,
          //   icon: Icons.remove,
          //   iconSize: widget.iconSize,
          //   onPress: () {
          //     if (widget.value > widget.lowerLimit) {
          //       setState(() {
          //         widget.value = widget.value == widget.lowerLimit
          //             ? widget.lowerLimit
          //             : widget.value -= widget.stepValue;
          //         widget.onChange(widget.value);
          //       });
          //     }
          //   },
          // ),
          const Spacer(),
          Text(
            '${widget.value}',
            style: TextStyle(
              fontSize: widget.iconSize * 0.7,
              color: EazyColors.primary,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),

          EasyContainer(
              customBorderRadius: const BorderRadius.only(
                  bottomLeft: Radius.zero, topLeft: Radius.zero),
              color: EazyColors.primary,
              onTap: () {
                setState(() {
                  widget.value = widget.value == widget.upperLimit
                      ? widget.upperLimit
                      : widget.value += widget.stepValue;
                  widget.onChange(widget.value);
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 3.0, right: 3),
                child: Icon(
                  Icons.add,
                  color: EazyColors.white,
                ),
              )),
          // RoundedIconButton(
          //   iconColor: EazyColors.white,
          //   fillColor: EazyColors.primary,
          //   icon: Icons.add,
          //   iconSize: widget.iconSize,
          //   onPress: () async {
          //     setState(() {
          //       widget.value = widget.value == widget.upperLimit
          //           ? widget.upperLimit
          //           : widget.value += widget.stepValue;
          //       widget.onChange(widget.value);
          //     });
          //   },
          // ),
        ],
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    super.key,
    required this.icon,
    required this.onPress,
    required this.iconSize,
    required this.iconColor,
    required this.fillColor,
  });

  final IconData icon;
  final void Function() onPress;
  final double iconSize;
  final Color iconColor;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: iconSize,
      // height: 24,
      // width: 24,
      child: RawMaterialButton(
        constraints: BoxConstraints.tightFor(width: iconSize, height: iconSize),
        elevation: 0,
        onPressed: onPress,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(iconSize * 0.2),
        ),
        fillColor: fillColor,
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize * 0.8,
        ),
      ),
    );
  }
}
