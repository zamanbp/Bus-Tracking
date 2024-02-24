
import 'package:flutter/material.dart';

class MilestoneProgress extends StatelessWidget {
  final double height;
  final double maxIconSize;
  final int totalMilestones;
  final int completedMilestone;
  final IconData completedIconData;
  final IconData nonCompletedIconData;
  final Color completedIconColor;
  final Color incompleteIconColor;
  final List<String> milestoneLabels; // Added list of labels

  MilestoneProgress({
    required this.height,
    this.maxIconSize = 24,
    required this.totalMilestones,
    required this.completedMilestone,
    this.completedIconData = Icons.directions_bus,
    this.nonCompletedIconData = Icons.adjust,
    this.completedIconColor = Colors.green,
    this.incompleteIconColor = Colors.grey,
    required this.milestoneLabels, // Added list of labels
  })  : assert(height != null),
        assert(totalMilestones != null),
        assert(completedMilestone != null),
        assert(totalMilestones != null),
        assert(milestoneLabels.length ==
            totalMilestones); // Validate label list length

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: getTitleWithMilestone(
        height,
        totalMilestones,
        completedMilestone,
        completedIconData,
        nonCompletedIconData,
        completedIconColor,
        incompleteIconColor,
        maxIconSize,
        milestoneLabels,
      ),
    );
  }
}

List<Widget> getTitleWithMilestone(
  double width,
  int totalPoints,
  int checkedPoints,
  IconData completedIconData,
  IconData nonCompletedIconData,
  Color completedIconColor,
  Color incompleteIconColor,
  double mxIconSize,
  List<String> milestoneLabels,
) {
  List<Widget> list = [];
  double iconSizeTemp = width / (1.5 * totalPoints);
  double lineSizeTemp = width / (3 * totalPoints);
  double maxIconSize = mxIconSize;
  double maxLineSize = mxIconSize / 2;

  // checks and adjusts icon size acc to max width
  double iconSize = iconSizeTemp > maxIconSize ? maxIconSize : iconSizeTemp;
  double lineSize = lineSizeTemp > maxLineSize ? maxLineSize : lineSizeTemp;

  for (int i = 0; i < (2 * totalPoints) - 1; i++) {
    if (i % 2 == 0) {
      list.add(
        Row(
          children: [
            Icon(
              i <= (2 * checkedPoints) - 1
                  ? completedIconData
                  : nonCompletedIconData,
              size: iconSize,
              color: i <= (2 * checkedPoints) - 1
                  ? completedIconColor
                  : incompleteIconColor,
            ),
            Text(
              milestoneLabels[
                  i ~/ 2], // Use integer division to get the correct label
              style: TextStyle(fontSize: 12), // Adjust font size as needed
            ),
          ],
        ),
      );
    } else {
      // Vertical line (SizedBox with height)
      list.add(
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 11.5),
            child: SizedBox(
              height:
                  lineSize, // Set the height to control the length of the line
              width: 1, // Set a small width for the vertical line
              child: Container(
                color: i < (2 * checkedPoints) - 1
                    ? completedIconColor
                    : incompleteIconColor,
              ),
            ),
          ),
        ),
      );
    }
  }
  return list;
}