import 'dart:io';

import 'package:agent/core/constant/Consts.dart';
import 'package:agent/core/helper/toast.helper.dart';
import 'package:agent/core/utils/colors.utils.dart';
import 'package:agent/core/utils/sizes.utils.dart';
import 'package:agent/core/widget/basic.appbar.dart';
import 'package:agent/core/widget/input/check.box.basic.dart';
import 'package:agent/core/widget/input/dropdown.basic.dart';
import 'package:agent/core/widget/input/image.basic.dart';
import 'package:agent/core/widget/input/text.field.basic.dart';
import 'package:agent/features/main/model/form.model.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class MotorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorsUtils.white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: BasicAppbar(
          appbarType: AppbarType.BACK_BUTTON,
          title: 'Motor Vehicle',
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: SizesUtils.heightMultiplier * 8,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: SizesUtils.widthMultiplier * 7.5,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("${Constanta.IMAGE_ASSET}/bar-atas.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.50),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Text(
              'Quotation Baru',
              style: TextStyle(
                fontSize: SizesUtils.textMultiplier * 2.8,
                fontWeight: FontWeight.bold,
                color: ColorsUtils.white,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: MotorContent(),
            ),
          ),
          Container(
            color: ColorsUtils.primary,
            width: double.infinity,
            height: SizesUtils.heightMultiplier * 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_circle_up,
                    color: ColorsUtils.white,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Pembayaran',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: SizesUtils.textMultiplier * 1.5,
                      ),
                    ),
                    Text(
                      'Rp300.000,00',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ColorsUtils.white,
                        fontWeight: FontWeight.w600,
                        fontSize: SizesUtils.textMultiplier * 3,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: SizesUtils.heightMultiplier * 4.5,
                  // width: SizesUtils.widthMultiplier * 10,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      primary: Colors.black87, // background
                      onPrimary: Colors.white, // foreground
                      // padding: EdgeInsets.all(2),
                    ),
                    child: Text(
                      'Kirim Quotation',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ColorsUtils.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: SizesUtils.textMultiplier * 1.2,
                      ),
                    ),
                  ),
                ),
                // Text('iconButton'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MotorContent extends StatefulWidget {
  MotorContent({Key key}) : super(key: key);

  @override
  _MotorContentState createState() => _MotorContentState();
}

class _MotorContentState extends State<MotorContent> {
  ExpandableController generalController, vehicleController, personalController;
  List<FormModel> generalForms;
  bool isShow, isCheck;

  Future<bool> validate(List<FormModel> _listFroms, int index) async {
    bool status = true;
    List<FormModel> _newListFroms = _listFroms.map((item) {
      String _value = item.value.toString();
      if (item.validate.contains('required')) {
        if (_value == '' || _value == 'null' || _value == null) {
          status = false;
          item.error = 'Enter ${item.label}';
        }
      }

      return item;
    }).toList();
    if (index == 0) {
      setState(() {
        generalForms = _newListFroms;
      });
    }

    return status;
  }

  @override
  void initState() {
    super.initState();
    initGeneralFrom();
    isCheck = false;
    isShow = false;
    generalController = ExpandableController(initialExpanded: false);
    vehicleController = ExpandableController(initialExpanded: false);
    personalController = ExpandableController(initialExpanded: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizesUtils.heightMultiplier * 2.5,
        horizontal: SizesUtils.widthMultiplier * 2.5,
      ),
      child: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          GestureDetector(
            onTap: () {
              _toggleExpandables(0);
            },
            child: ExpandableNotifierCustom(
              title: 'A. Informasi Umum',
              controller: generalController,
              widget: GeneralForm(
                listForms: generalForms,
                callback: (_controller) {
                  setState(() {
                    generalForms = _controller;
                  });
                },
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _toggleExpandables(1);
            },
            child: ExpandableNotifierCustom(
              title: 'B. Detail Kendaraan',
              controller: vehicleController,
              widget: VehicleForm(),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('GestureDetector');
              _toggleExpandables(2);
            },
            child: ExpandableNotifierCustom(
              title: 'C. Identitas Tertanggung',
              controller: personalController,
              widget: PersonalForm(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _toggleExpandables(int index) async {
    if (isCheck) {
      bool check = await validate(generalForms, 0);
      if (check) {
        setState(() {
          generalController.value = false;
          vehicleController.value = false;
          personalController.value = false;
          isShow = !isShow;
          isCheck = true;
          _getController(index).value = isShow;
        });
      } else {
        toastInfo('check validate');
      }
    } else {
      setState(() {
        generalController.value = false;
        vehicleController.value = false;
        personalController.value = false;
        isShow = !isShow;
        isCheck = true;
        _getController(index).value = isShow;
      });
    }
  }

  initGeneralFrom() {
    generalForms = [];
    generalForms.add(FormModel(
      id: 0,
      key: 'jaminan',
      label: 'Jaminan Dasar',
      type: 'radio',
      error: '',
      validate: ['required'],
      data: [
        Data(key: 'komprehensif', label: "Komprehensif", value: null),
        Data(key: 'tlo', label: "TLO", value: null),
      ],
    ));
    generalForms.add(FormModel(
      id: 1,
      key: 'promo',
      label: 'Promo Diskon',
      type: 'dropdown',
      error: '',
      validate: ['required'],
      data: [
        Data(key: '0%', label: "0", value: null),
        Data(key: '25%', label: "25", value: null),
      ],
    ));
    generalForms.add(FormModel(
      id: 2,
      key: 'tahun_pembuatan',
      label: 'Tahun Pembuatan',
      type: 'dropdown',
      error: '',
      validate: ['required'],
      data: [
        Data(key: '2019', label: "2019", value: null),
        Data(key: '2020', label: "2020", value: null),
      ],
    ));
    generalForms.add(FormModel(
      id: 3,
      key: 'nilai_pertanggungan',
      label: 'Nilai Pertanggunan',
      type: 'rupiah',
      error: '',
      validate: ['required'],
    ));
    generalForms.add(FormModel(
      id: 4,
      key: 'periode_asuransi',
      label: 'Periode Asuransi',
      type: 'title',
    ));
    generalForms.add(FormModel(
      id: 5,
      key: 'tanggal_mulai',
      label: 'Tanggal Mulai',
      type: 'date',
      error: '',
      validate: ['required'],
    ));
    generalForms.add(FormModel(
      id: 6,
      key: 'tanggal_berakhir',
      label: 'Tanggal Berakhir',
      type: 'date',
      error: '',
      validate: ['required'],
    ));
    generalForms.add(FormModel(
      id: 7,
      key: 'lokasi',
      label: 'Lokasi',
      type: 'dropdown',
      error: '',
      validate: ['required'],
      data: [
        Data(key: 'jakarta', label: "Jakarta", value: null),
        Data(key: 'malang', label: "Malang", value: null),
      ],
    ));
    generalForms.add(FormModel(
      id: 8,
      key: 'wilayah',
      label: 'Wilayah',
      type: 'dropdown',
      error: '',
      validate: ['required'],
      data: [
        Data(key: '1', label: "1", value: null),
        Data(key: '2', label: "2", value: null),
      ],
    ));

    generalForms.add(FormModel(
      id: 9,
      key: 'title',
      label: 'Perluasan',
      type: 'title',
    ));

    generalForms.add(FormModel(
      id: 10,
      key: 'isGempa',
      label: 'Gampa bumi, tsunami, dan /atau letusan gunung berapi',
      type: 'checkbox',
    ));
    generalForms.add(FormModel(
      id: 11,
      key: 'isBanjir',
      label: 'Banjur (termasuk angin topan)',
      type: 'checkbox',
    ));
    generalForms.add(FormModel(
      id: 12,
      key: 'isKecelakaanForPenumpang',
      label:
          'Kecelakaan untuk penumpang (limit Rp5.000.000 perorang, maks 3 orang)',
      type: 'checkbox',
    ));
    generalForms.add(FormModel(
      id: 13,
      key: 'isKecelakaanForDriver',
      label: 'Kecelakaan untuk pengemudi (limit Rp5.000.000)',
      type: 'checkbox',
    ));
    generalForms.add(FormModel(
      id: 14,
      key: 'isHuruHara',
      label: 'THuru hara dan lerusuhan',
      type: 'checkbox',
    ));
    generalForms.add(FormModel(
      id: 15,
      key: 'isTanggungJawab',
      label:
          'Tanggung jawan hukum terhadap pihak ketiga (limit Rp25.00.00 per kejadian)',
      type: 'checkbox',
    ));
    generalForms.add(FormModel(
      id: 15,
      key: 'isTerirsme',
      label: 'Terorisme dan sabotase',
      type: 'checkbox',
    ));
  }

  // ignore: missing_return
  ExpandableController _getController(int index) {
    switch (index) {
      case 0:
        return generalController;
      case 1:
        return vehicleController;
      case 2:
        return personalController;
    }
  }
}

class GeneralForm extends StatefulWidget {
  final List<FormModel> listForms;
  final void Function(List<FormModel> listForms) callback;

  const GeneralForm({Key key, this.listForms, this.callback}) : super(key: key);

  @override
  _GeneralFormState createState() => _GeneralFormState();
}

class _GeneralFormState extends State<GeneralForm> {
  List<Widget> buildForms() {
    List<Widget> _buildForms = [];
    widget.listForms.forEach(
      (e) {
        String value = e.value != null ? e.value : '';
        String error = e.error != null ? e.error : '';
        if (e.type == 'checkbox') {
          print('${e.value}');
          bool _value = '${e.value}' == 'true' ? true : false;
          _buildForms.add(CheckBoxBasic(
            title: '${e.label}',
            value: _value,
            callback: (bool _check) => setState(
              () {
                e.value = _check.toString();
              },
            ),
          ));
        }
        if (e.type == 'dropdown') {
          List listKey = e.data.map((e) => e.key).toList();
          _buildForms.add(DropdownBasic(
            title: '${e.label}',
            listData: listKey,
            value: value,
            error: error,
            callback: (_value) {
              setState(() {
                e.value = _value;
              });
            },
          ));
        }
        if (e.type == 'rupiah') {
          _buildForms.add(TextFieldBasic(
            title: '${e.label}',
            hint: '${e.key}',
            error: error,
            type: TextFielcBasicType.NUMBER,
            controller: TextEditingController(text: value),
            callback: (_controller) => setState(() {
              e.value = _controller.text;
            }),
          ));
        }
        if (e.type == 'title') {
          _buildForms.add(Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${e.label}',
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
                fontSize: SizesUtils.textMultiplier * 2,
              ),
            ),
          ));
        }
        if (e.type == 'radio') {
          List listKey = e.data.map((e) => e.key).toList();
          String value = listKey.contains(e.value) ? e.value.toString() : null;
          _buildForms.add(
            Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${e.label}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600,
                        fontSize: SizesUtils.textMultiplier * 2,
                      ),
                    ),
                  ),
                  Row(
                    children: listKey.map(
                      (item) {
                        return Row(
                          children: [
                            Radio<String>(
                              value: item,
                              groupValue: value,
                              onChanged: (String _value) {
                                setState(() {
                                  e.value = _value;
                                });
                              },
                            ),
                            Text(
                              '$item',
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: SizesUtils.textMultiplier * 2,
                              ),
                            ),
                          ],
                        );
                      },
                    ).toList(),
                  ),
                  Text(error)
                ],
              ),
            ),
          );
        }
        if (e.type == 'number') {
          _buildForms.add(TextFieldBasic(
            title: '${e.label}',
            error: error,
            type: TextFielcBasicType.NUMBER,
            controller: TextEditingController(text: e.value),
            callback: (_controller) => setState(() {
              e.value = _controller.text;
            }),
          ));
        }
        if (e.type == 'date') {
          _buildForms.add(TextFieldBasic(
            title: '${e.label}',
            label: e.label,
            error: error,
            type: TextFielcBasicType.DATE,
            controller: TextEditingController(text: '${e.value}'),
            callback: (_controller) => setState(() {
              e.value = _controller.text;
            }),
          ));
        }
        if (e.type == 'image') {
          return PickerImageBasic(
            callback: (_file) => setState(
              () {
                e.value = _file.path;
              },
            ),
          );
        }
      },
    );
    return _buildForms;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsUtils.bg,
      padding: EdgeInsets.symmetric(
        horizontal: SizesUtils.widthMultiplier * 4,
        vertical: SizesUtils.heightMultiplier * 2,
      ),
      child: Column(
        children: buildForms(),

        // children: [
        //   Container(
        //     child: Column(
        //       children: [
        //         Container(
        //           alignment: Alignment.centerLeft,
        //           child: Text(
        //             'Jaminan Dasar',
        //             style: TextStyle(
        //               color: Colors.grey[600],
        //               fontWeight: FontWeight.w600,
        //               fontSize: SizesUtils.textMultiplier * 2,
        //             ),
        //           ),
        //         ),
        //         Row(
        //           children: [
        //             Row(
        //               children: [
        //                 Radio<Jaminan>(
        //                   value: Jaminan.komprehensif,
        //                   groupValue: _jaminan,
        //                   onChanged: (Jaminan value) {
        //                     setState(() {
        //                       _jaminan = value;
        //                     });
        //                   },
        //                 ),
        //                 Text(
        //                   'Komprehensif',
        //                   style: TextStyle(
        //                     color: Colors.black87,
        //                     fontWeight: FontWeight.w600,
        //                     fontSize: SizesUtils.textMultiplier * 2,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             Row(
        //               children: [
        //                 Radio<Jaminan>(
        //                   value: Jaminan.tlo,
        //                   groupValue: _jaminan,
        //                   onChanged: (Jaminan value) {
        //                     setState(() {
        //                       _jaminan = value;
        //                     });
        //                   },
        //                 ),
        //                 Text(
        //                   'TLO',
        //                   style: TextStyle(
        //                     color: Colors.black87,
        //                     fontWeight: FontWeight.w600,
        //                     fontSize: SizesUtils.textMultiplier * 2,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        //   DropdownBasic(
        //     title: 'Promo Diskon',
        //     listData: _listPromo,
        //     value: _promo,
        //     callback: (_value) {
        //       setState(() {
        //         _promo = _value;
        //       });
        //     },
        //   ),
        //   DropdownBasic(
        //     title: 'Tahun Pembuatan',
        //     listData: _listYear,
        //     value: _year,
        //     callback: (_value) {
        //       setState(() {
        //         _year = _value;
        //       });
        //     },
        //   ),
        //   TextFieldBasic(
        //     title: 'Nilai Pertanggungan',
        //     hint: '0',
        //     type: TextFielcBasicType.NUMBER,
        //     controller: _pertanggunganController,
        //     callback: (_controller) => setState(() {
        //       _pertanggunganController = _controller;
        //     }),
        //   ),
        //   TextFieldBasic(
        //     title: 'Periode Asuransi',
        //     label: 'Tanggal mulai',
        //     type: TextFielcBasicType.DATE,
        //     controller: _dateStartController,
        //     callback: (_controller) => setState(() {
        //       _dateStartController = _controller;
        //     }),
        //   ),
        //   TextFieldBasic(
        //     title: 'Periode Asuransi',
        //     label: 'Tanggal berakhir',
        //     type: TextFielcBasicType.DATE,
        //     controller: _dateEndController,
        //     callback: (_controller) => setState(() {
        //       _dateEndController = _controller;
        //     }),
        //   ),
        //   DropdownBasic(
        //     title: 'Lokasi',
        //     listData: _listLocation,
        //     value: _location,
        //     callback: (_value) {
        //       setState(() {
        //         _location = _value;
        //       });
        //     },
        //   ),
        //   DropdownBasic(
        //     title: 'Wilayah',
        //     listData: _listWilayah,
        //     value: _wilayah,
        //     callback: (_value) {
        //       setState(() {
        //         _wilayah = _value;
        //       });
        //     },
        //   ),
        //   Container(
        //     child: Column(
        //       children: [
        //         Container(
        //           alignment: Alignment.centerLeft,
        //           child: Text(
        //             'Perluasan',
        //             style: TextStyle(
        //               color: Colors.grey[600],
        //               fontWeight: FontWeight.w600,
        //               fontSize: SizesUtils.textMultiplier * 2,
        //             ),
        //           ),
        //         ),
        //         CheckBoxBasic(
        //           title: 'Gempa Bumi, tsunami, dan/atau gunung berapi',
        //           value: isComboBox[0],
        //           callback: (bool _check) => setState(
        //             () {
        //               isComboBox[0] = _check;
        //             },
        //           ),
        //         ),
        //         CheckBoxBasic(
        //           title: 'Banjir (termasuk angin topan)',
        //           value: isComboBox[1],
        //           callback: (bool _check) => setState(
        //             () {
        //               isComboBox[1] = _check;
        //             },
        //           ),
        //         ),
        //         CheckBoxBasic(
        //           title: 'Kecelakaan untuk penumpang (limit Rp5.000.000)',
        //           value: isComboBox[2],
        //           callback: (bool _check) => setState(
        //             () {
        //               isComboBox[2] = _check;
        //             },
        //           ),
        //         ),
        //         CheckBoxBasic(
        //           title: 'Huru hara dan kerusuhan',
        //           value: isComboBox[3],
        //           callback: (bool _check) => setState(
        //             () {
        //               isComboBox[3] = _check;
        //             },
        //           ),
        //         ),
        //         CheckBoxBasic(
        //           title:
        //               'Tanggungan jawab hukum terhadap pihak ketiga (limit Rp25.000.000 per kejadian)',
        //           value: isComboBox[4],
        //           callback: (bool _check) => setState(
        //             () {
        //               isComboBox[4] = _check;
        //             },
        //           ),
        //         ),
        //         CheckBoxBasic(
        //           title: 'Terorisme dan aabotase',
        //           value: isComboBox[5],
        //           callback: (bool _check) => setState(
        //             () {
        //               isComboBox[5] = _check;
        //             },
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ],
      ),
    );
  }
}

class VehicleForm extends StatefulWidget {
  const VehicleForm({Key key}) : super(key: key);

  @override
  _VehicleFormState createState() => _VehicleFormState();
}

class _VehicleFormState extends State<VehicleForm> {
  TextEditingController _noPlatController;
  TextEditingController _noRangkaController;
  TextEditingController _noMesinController;
  String _merk;
  List _listMerk = ['BMW', 'HONDA'];
  String _model;
  List _listModel = ['123113', '1232311'];
  File _image;

  void dispose() {
    _image.delete();
    _noPlatController.dispose();
    _noRangkaController.dispose();
    _noMesinController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _noPlatController = TextEditingController();
    _noRangkaController = TextEditingController();
    _noMesinController = TextEditingController();
    _merk = _listMerk[0];
    _model = _listModel[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsUtils.bg,
      padding: EdgeInsets.symmetric(
        horizontal: SizesUtils.widthMultiplier * 4,
        vertical: SizesUtils.heightMultiplier * 2,
      ),
      child: Column(
        children: [
          TextFieldBasic(
            title: 'Nomor Plat',
            hint: 'B 1234 ABC',
            type: TextFielcBasicType.TEXT,
            controller: _noPlatController,
            callback: (_controller) => setState(() {
              _noPlatController = _controller;
            }),
          ),
          DropdownBasic(
            title: 'Merek',
            listData: _listMerk,
            value: _merk,
            callback: (_value) {
              setState(() {
                _merk = _value;
              });
            },
          ),
          DropdownBasic(
            title: 'Model',
            listData: _listModel,
            value: _model,
            callback: (_value) {
              setState(() {
                _model = _value;
              });
            },
          ),
          TextFieldBasic(
            title: 'Nomor Rangka',
            hint: 'MHH3F1905DK93D937148',
            type: TextFielcBasicType.TEXT,
            controller: _noRangkaController,
            callback: (_controller) => setState(() {
              _noRangkaController = _controller;
            }),
          ),
          TextFieldBasic(
            title: 'Nomor Mesin',
            hint: 'B4600432',
            type: TextFielcBasicType.TEXT,
            controller: _noMesinController,
            callback: (_controller) => setState(() {
              _noMesinController = _controller;
            }),
          ),
          PickerImageBasic(
            callback: (file) => setState(() {
              _image = file;
            }),
          ),
        ],
      ),
    );
  }
}

class PersonalForm extends StatefulWidget {
  @override
  _PersonalFormState createState() => _PersonalFormState();
}

enum Gender { male, female }

class _PersonalFormState extends State<PersonalForm> {
  TextEditingController _namaLengkapController;
  TextEditingController _noHPController;
  TextEditingController _alamatController;
  TextEditingController _kodePosController;

  Gender _gender;

  String _jenisID;
  List _listJenisID = ['Passport', 'KTP'];

  String _provinsi;
  List _listProvinsi = ['Jawa Barat', 'Jawa Timur'];

  List<bool> isComboBox;

  void dispose() {
    _namaLengkapController.dispose();
    _noHPController.dispose();
    _alamatController.dispose();
    _kodePosController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _gender = Gender.male;
    _namaLengkapController = TextEditingController();
    _noHPController = TextEditingController();
    _alamatController = TextEditingController();
    _kodePosController = TextEditingController();
    _jenisID = _listJenisID[0];
    _provinsi = _listProvinsi[0];
    isComboBox = [false];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsUtils.bg,
      padding: EdgeInsets.symmetric(
        horizontal: SizesUtils.widthMultiplier * 4,
        vertical: SizesUtils.heightMultiplier * 2,
      ),
      child: Column(
        children: [
          TextFieldBasic(
            title: 'Nama Lengkap :',
            hint: 'B 1234 ABC',
            type: TextFielcBasicType.TEXT,
            controller: _namaLengkapController,
            callback: (_controller) => setState(() {
              _namaLengkapController = _controller;
            }),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Janis Kelamin',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w600,
                      fontSize: SizesUtils.textMultiplier * 2,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Radio<Gender>(
                          value: Gender.male,
                          groupValue: _gender,
                          onChanged: (Gender value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                        Text(
                          'Laki - Laki',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: SizesUtils.textMultiplier * 2,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<Gender>(
                          value: Gender.female,
                          groupValue: _gender,
                          onChanged: (Gender value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                        Text(
                          'Perempuan',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: SizesUtils.textMultiplier * 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          DropdownBasic(
            title: 'Jenis ID',
            listData: _listJenisID,
            value: _jenisID,
            callback: (_value) {
              setState(() {
                _jenisID = _value;
              });
            },
          ),
          TextFieldBasic(
            title: 'Nomor HP',
            hint: '0811234567890',
            type: TextFielcBasicType.NUMBER,
            controller: _noHPController,
            callback: (_controller) => setState(() {
              _noHPController = _controller;
            }),
          ),
          TextFieldBasic(
            title: 'Alamat',
            hint: 'Jl...',
            type: TextFielcBasicType.TEXT,
            controller: _alamatController,
            callback: (_controller) => setState(() {
              _alamatController = _controller;
            }),
          ),
          TextFieldBasic(
            title: 'Kode Pos',
            hint: '034121',
            type: TextFielcBasicType.TEXT,
            controller: _kodePosController,
            callback: (_controller) => setState(() {
              _kodePosController = _controller;
            }),
          ),
          DropdownBasic(
            title: 'Provinsi',
            listData: _listProvinsi,
            value: _provinsi,
            callback: (_value) {
              setState(() {
                _provinsi = _value;
              });
            },
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Alamat korespondensi',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w600,
                      fontSize: SizesUtils.textMultiplier * 2,
                    ),
                  ),
                ),
                CheckBoxBasic(
                  title: 'sama dengan lokasi resiko',
                  value: isComboBox[0],
                  callback: (bool _check) => setState(
                    () {
                      isComboBox[0] = _check;
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExpandableNotifierCustom extends StatelessWidget {
  final Widget widget;
  final String title;
  final ExpandableController controller;
  ExpandableNotifierCustom({this.widget, this.title, this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ExpandableNotifier(
        controller: controller,
        child: ScrollOnExpand(
          child: ExpandablePanel(
            collapsed: Container(),
            theme: ExpandableThemeData(
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              iconColor: ColorsUtils.primary,
              animationDuration: Duration(milliseconds: 500),
              useInkWell: true,
              expandIcon: Icons.add_circle_outline,
              collapseIcon: Icons.remove_circle_outline,
              tapHeaderToExpand: false,
              tapBodyToCollapse: false,
              tapBodyToExpand: false,
            ),
            header: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "$title",
                style: TextStyle(
                  fontSize: SizesUtils.textMultiplier * 2.25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            expanded: widget,
            builder: (_, collapsed, expanded) {
              return Expandable(
                expanded: expanded,
                collapsed: collapsed,
                theme: ExpandableThemeData(
                  crossFadePoint: 0,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
