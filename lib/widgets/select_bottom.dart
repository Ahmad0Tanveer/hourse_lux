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
        SizedBox(height: 16),
        Container(
          width: 48,
          height: 4,
          margin: EdgeInsets.only(left: 16,right: 16),
          color: Colors.grey,
        ),
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
        SizedBox(width: 40),
        Expanded(
            child: ListView(
              children: widget.options.map((e){
                return GestureDetector(
                  onTap: () =>  widget.onTap(e),
                  child: Container(
                    height: 45,
                    child: Row(
                      children: [
                        SizedBox(width: 24),
                        Container(
                          height: 20,
                          width: 20,
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white,width: 1),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                                color: widget.selectedOption==e?Colors.white:Colors.transparent
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          width: Get.width - 60,
                          child: Text(
                              e,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Get.textTheme.labelMedium!.copyWith(fontSize: 18,fontWeight: FontWeight.w700)),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            )
        ),
      ],
    );
  }
}
