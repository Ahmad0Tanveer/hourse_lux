import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SelectBottomSheet extends StatefulWidget {
  final List<String> options;
  final String title;
  final String selectedOption;
  final Function(String) onTap;
  const SelectBottomSheet({super.key,required this.options,required this.title,required this.selectedOption,required this.onTap});
  @override
  State<SelectBottomSheet> createState() => _SelectBottomSheetState();
}

class _SelectBottomSheetState extends State<SelectBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 50,
            alignment: Alignment.center,
            child: Text(widget.title,style: Get.textTheme.labelMedium,)),
        Container(
          width: Get.width,
          height: 1,
          margin: EdgeInsets.only(left: 16,right: 16),
          color: Colors.grey,
        ),
        SizedBox(width: 30),
        Expanded(
            child: ListView(
              children: widget.options.map((e){
                return GestureDetector(
                  onTap: () =>  widget.onTap(e),
                  child: Container(
                    height: 30,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Checkbox(
                            shape: CircleBorder(),
                            value: e == widget.selectedOption,
                            onChanged: (_) =>  widget.onTap(e)
                        ),
                        SizedBox(width:4),
                        Text(e,style: Get.textTheme.labelMedium!.copyWith(fontSize: 18,fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                );
              }).toList(),
            )
        )
      ],
    );
  }
}
