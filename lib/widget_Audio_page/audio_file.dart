// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters, unused_field, prefer_final_fields, unnecessary_this
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer advancedPlayer;
  const AudioFile(
      {Key? key, required this.advancedPlayer, required this.audioPath})
      : super(key: key);

  final String audioPath;

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  // مدة الملف الصوتي
  Duration _duration = Duration();
  // الموضع الحالي للتشغيل في الملف الصوتي
  Duration _position = Duration();
  bool isPalying = false;
  bool isPaused = false;
  bool isRepeat = false;
  Color color = Colors.black;

  List<IconData> _Icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];

  @override
  void initState() {
    super.initState();

    //* الاستماع لتغيير مدة الملف الصوتي
    this.widget.advancedPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });

    // * الاستماع لتغيير الموضع الحالي للتشغيل
    this.widget.advancedPlayer.onPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });

    this.widget.advancedPlayer.setSourceUrl(widget.audioPath);

    // ~ مستمع لتتبع انتهاء تشغيل الملف الصوتي
    // ~ يتم استدعاء هذا المستمع عندما يصل الملف الصوتي إلى نهايته.
    this.widget.advancedPlayer.onPlayerComplete.listen((even) {
      setState(() {
        //* إعادة تعيين الموضع إلى بداية الملف الصوتي
        _position = Duration(seconds: 0);

        //* التحقق من حالة التكرار
        if (isRepeat == true) {
          // إذا كانت التكرار مفعلًا، الاستمرار في التشغيل
          isPalying = true;
        } else if (isRepeat == false) {
          //* إذا كانت التكرار معطلًا، إيقاف التشغيل
          isPalying = false;
        }
      });
    });
  }

  @override
  void dispose() {
    this.widget.advancedPlayer.stop();
    super.dispose();
  }

  Widget btnStart() {
    return IconButton(
      onPressed: () {
        if (isPalying == false) {
          //~ إذا كان الصوت مشغلاً، قم بإيقافه مؤقتًا
          this.widget.advancedPlayer.play(UrlSource(this.widget.audioPath));
          setState(() {
            isPalying = true;
          });
        } else if (isPalying == true) {
          //~ إذا كان الصوت مشغلاً، قم بإيقافه مؤقتًا
          this.widget.advancedPlayer.pause();
          setState(() {
            isPalying = false;
          });
        }
      },
      icon: Icon(
        isPalying == false ? _Icons[0] : _Icons[1],
        size: 50,
        color: Colors.blue,
      ),
      padding: const EdgeInsets.only(bottom: 10),
    );
  }

  Widget slider() {
    return Slider(
        activeColor: Colors.red,
        inactiveColor: Colors.grey,
        value: _position.inSeconds.toDouble(),
        min: 0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            changeToSecond(value.toInt());
            value = value;
          });
        });
  }

  void changeToSecond(int second) {
    //~ إنشاء مدة جديدة بالقيمة الجديدة (عدد الثواني)
    Duration newDuration = Duration(seconds: second);
    //~ تغيير موضع التشغيل في المشغل إلى القيمة الجديدة
    this.widget.advancedPlayer.seek(newDuration);
  }

  Widget btnFast() {
    return IconButton(
      icon: const ImageIcon(
        AssetImage('img/forward.png'),
        color: Colors.black,
        size: 15,
      ),
      onPressed: () {
        //~ تعيين معدل التشغيل إلى 1.5 مرة
        this.widget.advancedPlayer.setPlaybackRate(1.5);
      },
    );
  }

  Widget btnSlow() {
    return IconButton(
      icon: const ImageIcon(
        AssetImage('img/backword.png'),
        color: Colors.black,
        size: 15,
      ),
      onPressed: () {
        //~ تعيين معدل التشغيل إلى 0.5 مرة
        this.widget.advancedPlayer.setPlaybackRate(0.5);
      },
    );
  }

  Widget btnLoop() {
    return IconButton(
      icon: ImageIcon(
        const AssetImage('img/loop.png'),
        size: 15,
        color: isRepeat
            ? Colors.red
            : Colors.black, // تغيير لون الزر اعتمادًا على حالة الحلقة (التكرار)
      ),
      onPressed: () {
        setState(() {
          isRepeat = !isRepeat; // تبديل حالة الحلقة (التكرار)
        });
      },
    );
  }

  Widget btnRepeat() {
    return IconButton(
      icon: ImageIcon(
        AssetImage('img/repeat.png'),
        size: 15,
        color: color,
      ),
      onPressed: () {
        if (isRepeat == false) {
          //~ إذا كان التكرار معطل، قم بتعيين وضع التقرار إلى الحلقة
          this.widget.advancedPlayer.setReleaseMode(ReleaseMode.loop);
          setState(() {
            isRepeat = true;
            color = Colors.blue;
          });
        } else if (isRepeat == true) {
          //~ إذا كان التكرار مفعل، قم بتعيين وضع التقرار إلى الإفراج
          this.widget.advancedPlayer.setReleaseMode(ReleaseMode.release);
          setState(() {
            isRepeat = false;
            color = Colors.black;
          });
        }
      },
    );
  }

  // تجميع أزرار التحكم في صف واحد
  Widget loadAsset() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btnRepeat(),
          btnSlow(),
          btnStart(),
          btnFast(),
          btnLoop(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //* عرض الموضع الحالي للتشغيل
                Text(
                  _position.toString().split('.')[0],
                  style: TextStyle(fontSize: 16),
                ),
                //* عرض المدة الكلية للملف الصوتي
                Text(
                  _duration.toString().split('.')[0],
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
          slider(),
          loadAsset()
        ],
      ),
    );
  }
}
