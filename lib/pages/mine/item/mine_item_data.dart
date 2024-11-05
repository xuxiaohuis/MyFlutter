
class MineItemData{
  String? _icon;
  String? _title;

  MineItemData(this._icon, this._title);

  String? get icon => _icon;

  set icon(String? value) {
    _icon = value;
  }

  String? get title => _title;

  set title(String? value) {
    _title = value;
  }
}