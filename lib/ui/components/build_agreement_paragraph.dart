import 'package:flutter/material.dart';

class BuildAgreementParagraph extends StatefulWidget {
  const BuildAgreementParagraph({required this.paragraphContent, super.key,this.paragraphTitle});
  final String? paragraphTitle;
  final String paragraphContent;

  @override
  State<BuildAgreementParagraph> createState() =>
      _BuildAgreementParagraphState();
}

class _BuildAgreementParagraphState extends State<BuildAgreementParagraph> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.paragraphTitle!,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),),
          Text(widget.paragraphContent,style: const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),)
        ,],
      ),
    );
  }
}
