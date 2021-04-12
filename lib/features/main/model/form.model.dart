class FormModel {
  int id;
  String key;
  String label;
  String value;
  String error;
  String type;
  List<String> validate;
  List<Data> data;

  FormModel(
      {this.id,
      this.key,
      this.label,
      this.value,
      this.error,
      this.type,
      this.validate,
      this.data});

  FormModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    label = json['label'];
    value = json['value'];
    error = json['error'];
    type = json['type'];
    validate = json['validate'].cast<String>();
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['label'] = this.label;
    data['value'] = this.value;
    data['error'] = this.error;
    data['type'] = this.type;
    data['validate'] = this.validate;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String key;
  String label;
  String value;

  Data({this.key, this.label, this.value});

  Data.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    label = json['label'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['label'] = this.label;
    data['value'] = this.value;
    return data;
  }
}
