class SettingsModel {
  int id;
  String name;
  String settingOne;
  String settingTwo;
  String settingThree;
  String settingFour;

  SettingsModel(int id, String name,String settingOne, String settingTwo, String settingThree, String settingFour) {
    this.id = id;
    this.name = name;
    this.settingOne = settingOne;
    this.settingTwo = settingTwo;
    this.settingThree = settingThree;
    this.settingFour = settingFour;
  }

  SettingsModel.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        settingOne = json['settingOne'],
        settingTwo = json['settingTwo'],
        settingThree = json['settingThree'],
        settingFour = json['settingFour'];

  Map toJson() {
    return {'id': id, 'name': name, 'settingOne': settingOne,'settingTwo': settingTwo,'settingThree': settingThree,'settingFour': settingFour};
  }
}