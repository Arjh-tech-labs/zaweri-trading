import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/medeiaqury/medeiaqury.dart';
import '../notifire_clor.dart';
class CustomStockList extends StatefulWidget {
  String? time;
  String? orderType;
  String? name;
  String? qty;
  String? productType;
  String? price;

  CustomStockList(this.time,this.orderType,this.name,this.qty,this.productType,this.price);

  @override
  State<CustomStockList> createState() => _CustomStockListState();
}

class _CustomStockListState extends State<CustomStockList> {

  late ColorNotifier notifier;
  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifier.setIsDark = false;
    } else {
      notifier.setIsDark = previusstate;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdarkmodepreviousstate();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 5.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.time!,
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Gilroy-Regular',
                    color: notifier.getgrey),
              ),
              SizedBox(height: 5,),
              Text(
                widget.name!,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Gilroy_Bold',
                    color: Colors.black87),
              ),
              SizedBox(height: 5,),
              Text(
                widget.orderType!,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Gilroy-Regular',
                    color: notifier.getgrey),
              ),
            ],
          ),
          // SizedBox(width: width,),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(

                widget.productType!.toUpperCase(),
                style: TextStyle(
                  color: widget.productType=="sell"?Colors.redAccent:Colors.lightGreen,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 5,),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.circle,
                    color: widget.productType=="sell"?Colors.redAccent:Colors.lightGreen,
                    size: 12,
                  ),
                  Text(
                    " "+widget.qty!,
                    style: TextStyle(
                        color: Colors.black87, fontSize: 14, fontFamily: 'Gilroy_Bold',),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Text(
                    widget.price!,
                    style: TextStyle(
                      color: notifier.getgrey, fontSize: 14,),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: notifier.getgrey,
                    size: 12,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
