import 'package:shop9ja/configWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AutoComplete extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_AutocompleteState();
}

class _AutocompleteState extends State<AutoComplete> {
  final FocusNode _focusNode = FocusNode();
  final LayerLink _link = LayerLink();
  OverlayEntry? _overlayEntry;

  OverlayEntry _overlayEntry_() {
    final RenderBox box = context.findRenderObject() as RenderBox;
    Offset offset = box.localToGlobal(Offset.zero);
    Size size = box.size;
    return OverlayEntry(builder: (context)=> Positioned(
      width: size.width,
      child: CompositedTransformFollower(
        link: this._link,
        showWhenUnlinked: false,
        offset: Offset(0.0, size.height + 1.0),
        child: Material(
            elevation: 4.0, child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: <ListTile>[
              ListTile(title: text('Peter')),
              ListTile(title: text('oPeter'))
            ],
          )
        ),
      )
    ));
  }

  @override
  void initState() {
    this._focusNode.addListener(() {
      if(this._focusNode.hasFocus){
        this._overlayEntry = this._overlayEntry_();
        Overlay.of(context)!.insert(_overlayEntry!);
      }
      else this._overlayEntry!.remove();

    });
  }
  @override
  Widget build(context) {
    return CompositedTransformTarget(
      link: this._link,
      child: TextField(
        focusNode: this._focusNode,
        decoration: InputDecoration(
          border: outlineBorder,
          labelText: 'hFirstname',
          focusedBorder: outlineBorder,
          labelStyle: TextStyle(color: Colors.blue),
          contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
          suffixIcon: Icon(FontAwesomeIcons.userAlt, size: 18, color: Colors.blue),
        ),
      ),
    );
  }

  OutlineInputBorder get outlineBorder => OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.zero),
      borderSide: BorderSide(color: Colors.grey.shade400)
  );

}