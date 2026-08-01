import 'package:flutter/material.dart';

class CustomBottonWidget extends StatelessWidget {
  String? label;
  bool? loading;

  VoidCallback? onClick;
  CustomBottonWidget({super.key, this.loading, this.label, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: loading == true
            ? Center(child: CircularProgressIndicator(color: Colors.white))
            : Text(
                label ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
    );
  }
}
