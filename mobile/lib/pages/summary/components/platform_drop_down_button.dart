import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:mobile/pages/summary/controllers/platform_drop_down_button_controller.dart';
import 'package:mobile/styles/custom_sizes.dart';
import 'package:mobile/utils/coryn_size.dart';
import 'package:mobile/styles/custom_text_styles.dart';

class PlatformDropDownButton extends StatelessWidget {
  const PlatformDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlatformDropDownButtonController>(
      builder: (_) => Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: Colors.grey[50],
            ),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                  image: AssetImage(_.platformImagePathList[
                      _.platformList.indexOf(_.platform)]),
                ),
              ),
            ),
          ),
          const SizedBox(width: CorynSize.contextHorizontal),
          DropdownButton2(
            value: _.platform,
            items: _.platformList.map((_value) {
              return DropdownMenuItem(
                  value: _value,
                  child: Text(
                    _value,
                    style: CustomTextStyles.small,
                  ));
            }).toList(),
            onChanged: (value) => _.onchanged(value),
            buttonWidth: CustomScreenSize.platformDropDownButton.w,
          ),
        ],
      ),
    );
  }
}
