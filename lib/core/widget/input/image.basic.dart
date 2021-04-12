import 'dart:io';

import 'package:agent/core/utils/sizes.utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class PickerImageBasic extends StatefulWidget {
  final void Function(File value) callback;
  PickerImageBasic({Key key, this.callback}) : super(key: key);

  @override
  _PickerImageBasicState createState() => _PickerImageBasicState();
}

class _PickerImageBasicState extends State<PickerImageBasic> {
  File _image;

  ImagePicker picker = ImagePicker();

  Future<void> takeImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      // toastShow('add image');
      widget.callback(_image);
    } else {
      // toastShow('No image selected.');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Upload Foto',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w600,
              fontSize: SizesUtils.textMultiplier * 2,
            ),
          ),
          IconButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 100,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Choose image '),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FlatButton.icon(
                            onPressed: () {
                              Navigator.of(context).pop();
                              takeImage(ImageSource.camera);
                            },
                            icon: Icon(Icons.camera),
                            label: Text('Camera'),
                          ),
                          FlatButton.icon(
                            onPressed: () {
                              Navigator.of(context).pop();
                              takeImage(ImageSource.gallery);
                            },
                            icon: Icon(Icons.image),
                            label: Text('Gallery'),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            icon: Icon(
              Icons.camera_enhance_rounded,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
