import 'package:agent/core/utils/colors.utils.dart';
import 'package:agent/core/utils/sizes.utils.dart';
import 'package:flutter/material.dart';

class ContentWidget extends StatefulWidget {
  const ContentWidget({Key key}) : super(key: key);

  @override
  _ContentWidgetState createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  int selected;
  Color colorTextSelected = Colors.black;
  Color colorTextUnselected = ColorsUtils.white;
  Color colorBgSelected = ColorsUtils.primary;
  Color colorBgUnselected = Colors.grey[700];

  @override
  void initState() {
    super.initState();
    selected = 0;
  }

  bool initIndex(int index) {
    if (index == selected) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Widget buttonAction(String _title, bool left, bool right, int _index) {
      return Expanded(
        child: InkWell(
          child: Container(
            height: SizesUtils.heightMultiplier * 8,
            width: SizesUtils.widthMultiplier * 80 / 2,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(left ? 8.0 : 0),
                topRight: Radius.circular(right ? 8.0 : 0),
              ),
              color: initIndex(_index) ? colorBgSelected : colorBgUnselected,
            ),
            child: Text(
              '$_title',
              style: TextStyle(
                fontSize: SizesUtils.textMultiplier * 2,
                fontWeight: FontWeight.w600,
                color:
                    initIndex(_index) ? colorTextSelected : colorTextUnselected,
              ),
            ),
          ),
          onTap: () {
            setState(() {
              selected = _index;
            });
          },
        ),
      );
    }

    return Container(
      width: SizesUtils.widthMultiplier * 80,
      child: Column(
        children: [
          Container(
            height: SizesUtils.heightMultiplier * 8,
            width: SizesUtils.widthMultiplier * 80,
            child: Row(
              children: [
                buttonAction('Profile', true, false, 0),
                buttonAction('Portofolio', false, true, 1)
              ],
            ),
          ),
          initIndex(0) ? ProfileView() : PortofolioView(),
        ],
      ),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _itemView(String _title, String _value) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '$_title',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.normal,
                  fontSize: SizesUtils.textMultiplier * 2.25,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '$_value',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: SizesUtils.textMultiplier * 2.25,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
        color: ColorsUtils.bg,
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          _itemView('Nama Agent', 'Daeng Gemilang Enterprise'),
          _itemView('Agent ID', 'V0022922'),
          _itemView('Tipe Agent', 'Corporate'),
          _itemView('Cabang', 'Kantor pusat'),
          _itemView('Nomor ID (KTP/SIM)', '1234567890'),
          _itemView('No HP', '0811234567890'),
          _itemView('Email', 'Daeng@yahoo.com'),
          _itemView('Nama Perusahaan', 'Jaya Gemilang Enterprise'),
          _itemView('NPWP', '1234567890'),
          _itemView('No Rek', '1234567890'),
          _itemView('Alamat Lengkap', 'Jl.Jend Sudirman Jakarta Pusat'),
        ],
      ),
    );
  }
}

class PortofolioView extends StatefulWidget {
  const PortofolioView({Key key}) : super(key: key);

  @override
  _PortofolioViewState createState() => _PortofolioViewState();
}

class _PortofolioViewState extends State<PortofolioView> {
  String _viewBy;
  List _listViewBay = ["Motor", "Mobile"];

  @override
  void initState() {
    super.initState();
    _viewBy = _listViewBay[0];
  }

  @override
  Widget build(BuildContext context) {
    Widget _itemCard(
      String _text1,
      String _text2,
      String _text3,
      Color _bgColor,
      Color _textColor,
      Color _textLeftColor,
    ) {
      return Container(
        height: SizesUtils.heightMultiplier * 4,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        width: double.infinity,
        color: _bgColor ?? ColorsUtils.primary,
        child: Row(
          children: [
            Expanded(
                child: Text(
              '$_text1',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: _textLeftColor != null
                    ? _textLeftColor
                    : _textColor ?? ColorsUtils.white,
                fontWeight: FontWeight.normal,
                fontSize: SizesUtils.textMultiplier * 1.50,
              ),
            )),
            Expanded(
                child: Text(
              '$_text2',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: _textColor ?? ColorsUtils.white,
                fontWeight: FontWeight.normal,
                fontSize: SizesUtils.textMultiplier * 1.50,
              ),
            )),
            Expanded(
                child: Text(
              '$_text3',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: _textColor ?? ColorsUtils.white,
                fontWeight: FontWeight.normal,
                fontSize: SizesUtils.textMultiplier * 1.50,
              ),
            ))
          ],
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
        color: ColorsUtils.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'View by:',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.normal,
                      fontSize: SizesUtils.textMultiplier * 2.25,
                    ),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    value: _viewBy,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: SizesUtils.textMultiplier * 2.25,
                    ),
                    items: _listViewBay.map((value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _viewBy =
                            value; //Untuk memberitahu _valGender bahwa isi nya akan diubah sesuai dengan value yang kita pilih
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Saldo per',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.normal,
                      fontSize: SizesUtils.textMultiplier * 1.50,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '02 Mar 2021',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: SizesUtils.textMultiplier * 1.50,
                      ),
                    ),
                    Text(
                      '09:26:06 AM',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: SizesUtils.textMultiplier * 1.50,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Motor',
                      style: TextStyle(
                        color: ColorsUtils.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: SizesUtils.textMultiplier * 2.25,
                      ),
                    ),
                  ),
                ),
                Container(
                  //  height: SizesUtils.heightMultiplier * 8,
                  width: SizesUtils.widthMultiplier * 80,
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    color: ColorsUtils.bg,
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: SizesUtils.heightMultiplier * 2.5,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: SizesUtils.heightMultiplier * 0.5,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'GWP',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.normal,
                                        fontSize:
                                            SizesUtils.textMultiplier * 1.75,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Text(
                                      'Rp 200.000.000',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            SizesUtils.textMultiplier * 1.75,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              _itemCard(
                                '',
                                'Premi',
                                'Komisi',
                                ColorsUtils.primary,
                                ColorsUtils.white,
                                ColorsUtils.white,
                              ),
                              _itemCard(
                                'Lunas',
                                'Rp100.000.000',
                                'Rp10.000.000',
                                ColorsUtils.white,
                                Colors.black,
                                Colors.grey[500],
                              ),
                              _itemCard(
                                'Tertunggak',
                                'Rp100.000.000',
                                'Rp10.000.000',
                                Colors.red[100],
                                Colors.black,
                                Colors.grey[500],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: SizesUtils.heightMultiplier * 2.5,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: SizesUtils.heightMultiplier * 0.5,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'GWP',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.normal,
                                        fontSize:
                                            SizesUtils.textMultiplier * 1.75,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Text(
                                      'Rp 50.000.000',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            SizesUtils.textMultiplier * 1.75,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              _itemCard(
                                'Terbayar',
                                '',
                                'Rp30.000.000',
                                ColorsUtils.white,
                                Colors.black,
                                Colors.grey[500],
                              ),
                              _itemCard(
                                'Dalam Proses',
                                '',
                                'Rp20.000.000',
                                Colors.red[100],
                                Colors.black,
                                Colors.grey[500],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
