import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_wiki/theme.dart';

class FilterCheckboxItem extends StatelessWidget {
  final ValueChanged<bool?> onChanged;
  final bool value;
  final String text;

  const FilterCheckboxItem({
    required this.value,
    required this.onChanged,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: AppColors.blue,
              splashRadius: 0,
            ),
            SizedBox(width: 16),
            Text(
              text,
            ),
          ],
        ),
      ),
    );
  }
}
