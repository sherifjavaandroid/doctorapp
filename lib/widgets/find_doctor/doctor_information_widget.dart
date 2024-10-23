import '../../utils/basic_screen_imports.dart';

class DoctorInformationWidget extends StatelessWidget {
  const DoctorInformationWidget({
    super.key,
    required this.variable,
    required this.value,
    this.stoke = true,
  });
  final String variable, value;
  final bool stoke;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(Dimensions.heightSize * 0.5),
        Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            Expanded(
              flex: 4,
              child: TitleHeading4Widget(
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                text: variable,
               
                fontWeight: FontWeight.w500,
                color: CustomColor.primaryLightTextColor.withOpacity(0.3),
              ),
            ),horizontalSpace(Dimensions.widthSize),
            Expanded(
              flex: 5,
              child: TitleHeading4Widget(
                textAlign: TextAlign.right,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                text: value,
                fontSize: Dimensions.headingTextSize4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        verticalSpace(Dimensions.heightSize * 0.2),
        Visibility(
            visible: stoke,
            child: Container(
                width: MediaQuery.of(context).size.width,
                color: CustomColor.primaryLightTextColor.withOpacity(0.5),
                child: const DottedDivider()))
      ],
    );
  }
}

class DottedDivider extends StatelessWidget {
  const DottedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(
        color: Colors.grey, // Set the color of the dotted border
        strokeWidth: 1.0, // Set the width of the dotted border
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    const double dashWidth = 3; // Adjust the width of the dashes
    const double dashSpace = 2; // Adjust the space between the dashes
    const double startY = 0;

    double currentX = 0;
    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, startY),
        Offset(currentX + dashWidth, startY),
        paint,
      );
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
