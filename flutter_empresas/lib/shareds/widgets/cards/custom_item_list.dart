import 'package:flutter/material.dart';
import 'package:flutter_empresas/shareds/util/assets_path.dart';
import 'package:flutter_empresas/shareds/util/device_info.dart';

class CustomItemList extends StatefulWidget {
  const CustomItemList(
    {
      Key? key,
      this.marginSymetricHoriz = 16.0,
      this.height,
      this.title,
      this.imageUrl,
      required this.colorWidget,
      required this.onPressed})
      : super(key : key);
      final double? marginSymetricHoriz;
      final double? height;
      final String? title;
      final Function onPressed;
      final String? imageUrl;
      final Color colorWidget;

  @override
  _CustomItemListState createState() => _CustomItemListState();
}

class _CustomItemListState extends State<CustomItemList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.marginSymetricHoriz as double),
      child: Container(
        decoration: BoxDecoration(
          color: widget.colorWidget,
          border: Border.all(
            color: widget.colorWidget
          ),
          borderRadius: BorderRadius.circular(4.0)
        ),
        height: widget.height,
        width: double.infinity,
        child: GestureDetector(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Device.height * 0.10,
                width: Device.width * 0.5, 
                child: widget.imageUrl == null
                        ? Image.asset(AssetsPath.icon_company)
                        : Image.network(widget.imageUrl.toString())
              ),

              Text(widget.title.toString(), style: TextStyle(color: Colors.white, fontFamily: 'Quicksand', fontSize: 18.0, fontWeight: FontWeight.bold))
            ],
          ),
          onTap: () {
            widget.onPressed();
          },
        ),
      ),
    );
  }
}