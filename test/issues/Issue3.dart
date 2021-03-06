import 'package:rikulo_ui/view.dart';

main() {
  View _left, _right;
  final View mainView = new View()..addToDocument();
  mainView.layout.type = "linear";
  mainView.layout.orient = "vertical";
  
  //hlayout
  View hlayout = new View();
  hlayout.layout.type = "linear";
  hlayout.layout.orient = "horizontal";
  hlayout.profile.width = "100%";
  hlayout.profile.height = "content";
  mainView.addChild(hlayout);
  
  //left text
  TextView left = new TextView("FIRST TEXT");
  hlayout.addChild(left);
  _left = left;
  
  //right text
  TextView right = new TextView("SECOND TEXT");
  right.visible = false;
  hlayout.addChild(right);
  _right = right;
  
  _left.on.click.listen((event) {_left.visible = false; _right.visible = true; mainView.requestLayout();});
  _right.on.click.listen((event) {_left.visible = true; _right.visible = false; mainView.requestLayout();});
  
  mainView.addChild(new TextView.fromHtml('''
<ul><li>Click FIRST TEXT and you shall see it disappears and SECOND TEXT shows up</li>
<li>Click SECOND TEXT and you shall see the reversed response</li></ul>
  '''));
}