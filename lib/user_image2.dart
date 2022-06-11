import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shepherd/editprofile.dart';
import 'authentication.dart';
import 'round_image.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;

class UserImage2 extends StatefulWidget {
  final Function(String imageUrl) onFileChanged;

  UserImage2({
    required this.onFileChanged,
  });

  @override
  State<UserImage2> createState() => _UserImage2State();
}

class _UserImage2State extends State<UserImage2> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  final ImagePicker _picker = ImagePicker();

  String? imageUrl;

  Future<String> _fetch1() async {
    String uid = (_auth.currentUser)!.uid;
    int profileimageflag = 0;

    await firestore
        .collection(uid)
        .doc("profileimageflag")
        .get()
        .then((DocumentSnapshot ds) {
      profileimageflag = int.parse(ds.get('data').toString());
    });

    if (profileimageflag == 1) {
      final ref = FirebaseStorage.instance
          .ref('/images/' + AuthenticationHelper().getUid() + '.jpg');
      var url = await ref.getDownloadURL();
      imageUrl = url as String;
    }
    return 'Call Data';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: _fetch1(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
            if (snapshot.hasData == false) {
              return SizedBox(
                width: 30,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.all(0),
                  ),
                  child: Icon(
                    Icons.mood,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              );
            }
            //error가 발생하게 될 경우 반환하게 되는 부분
            else if (snapshot.hasError) {
              return SizedBox(
                width: 30,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.all(0),
                  ),
                  child: Icon(
                    Icons.mood,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              );
            }
            // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
            else {
              return Column(
                children: <Widget>[
                  if (imageUrl == null)
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditProfile(name: '회원')));
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.all(0),
                        ),
                        child: Icon(
                          Icons.mood,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  if (imageUrl != null)
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditProfile(name: '회원'))),
                      child: AppRoundImage.url(
                        imageUrl!,
                        width: 30,
                        height: 30,
                      ),
                    ),
                ],
              );
            }
          }),
    );
  }

  Future<String> _initializePhoto() async {
    final ref = FirebaseStorage.instance
        .ref()
        .child(AuthenticationHelper().getUid() + '.jpg');
    var url = await ref.getDownloadURL();
    print('(!) $url');
    return url;
  }

  Future _selectPhoto() async {
    await showModalBottomSheet(
        context: context,
        builder: (context) => BottomSheet(
              builder: (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                      leading: Icon(Icons.camera),
                      title: Text('Camera'),
                      onTap: () {
                        Navigator.of(context).pop();
                        _pickImage(ImageSource.camera);
                      }),
                  ListTile(
                      leading: Icon(Icons.filter),
                      title: Text('Pick a file'),
                      onTap: () {
                        Navigator.of(context).pop();
                        _pickImage(ImageSource.gallery);
                      }),
                ],
              ),
              onClosing: () {},
            ));
  }

  Future _pickImage(ImageSource source) async {
    final pickedFile =
        await _picker.pickImage(source: source, imageQuality: 50);
    if (pickedFile == null) {
      return;
    }
    File? file = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
    );
    if (file == null) {
      return;
    }
    file = await compressImage(file.path, 35);

    await _uploadFile(file.path);
  }

  Future<File> compressImage(String path, int quality) async {
    final newPath = p.join((await getTemporaryDirectory()).path,
        '${DateTime.now()}.${p.extension(path)}');
    print("(1) ${DateTime.now()}.${p.extension(path)}");

    final result = await FlutterImageCompress.compressAndGetFile(
      path,
      newPath,
      quality: quality,
    );

    return result!;
  }

  Future _uploadFile(String path) async {
    final ref = storage.FirebaseStorage.instance
        .ref()
        .child('images')
        //.child('${DateTime.now().toIso8601String()+p.basename(path)}');
        .child(AuthenticationHelper().getUid() + '.jpg');

    final result = await ref.putFile(File(path));
    final fileUrl = await result.ref.getDownloadURL();
    print(' (1) $path');
    print(' (2) $fileUrl');

    setState(() {
      imageUrl = fileUrl;
    });

    widget.onFileChanged(fileUrl);
    firestore
        .collection(AuthenticationHelper().getUid())
        .doc("profileimageflag")
        .update({
      "data": 1,
    });
  }
}
