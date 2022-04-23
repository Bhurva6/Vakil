import 'package:flutter/material.dart';
import 'package:vakil/widget/bottom_bar_column.dart';
import 'package:vakil/widget/info_text.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);
  static const Color gradientStartColor = Color(0xff11998e);
  static const Color gradientEndColor = Color(0xff0575E6);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: gradientStartColor,
            offset: Offset(1.0, 6.0),
            blurRadius: 1.0,
          ),
          BoxShadow(
            color: gradientEndColor,
            offset: Offset(1.0, 6.0),
            blurRadius: 1.0,
          ),
        ],
        gradient: LinearGradient(
            colors: [gradientStartColor, gradientEndColor],
            begin: const FractionalOffset(0.2, 0.2),
            end: const FractionalOffset(1.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      padding: EdgeInsets.all(30),
      //color: Colors.blueGrey[900],
      child: MediaQuery.of(context).size.width < 800
          ? Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: 'ABOUT',
                      s1: 'Contact Us',
                      s2: 'About Us',
                      s3: 'Careers',
                    ),
                    BottomBarColumn(
                      heading: 'HELP',
                      s1: 'Payment',
                      s2: 'Cancellation',
                      s3: 'FAQ',
                    ),
                    BottomBarColumn(
                      heading: 'Social',
                      s1: 'Twitter',
                      s2: 'Facebook',
                      s3: 'YouTube',
                    ),
                    Container(
                      color: Colors.white,
                      width: 2,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoText(
                          type: 'Email',
                          text: 'vakilsearch@gmail.com',
                        ),
                        SizedBox(height: 5),
                        InfoText(
                          type: 'Address',
                          text: '128, Trymore Road, Delft, MN - 56124',
                        )
                      ],
                    ),
                  ],
                ),
              ],
            )
          : Divider(
              color: Colors.white,
            ),
    );
  }
}
