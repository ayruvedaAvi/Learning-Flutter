import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  final List<String> imageNames;

  const ImageSlider({Key? key, required this.imageNames}) : super(key: key);

  @override
  State<ImageSlider> createState() {
    return _ImageSliderState();
  }
}

class _ImageSliderState extends State<ImageSlider> {
  var imageNumber = 0;

  void slider(String action) {
    setState(() {
      if (action == 'p') {
        // Previous image
        imageNumber = (imageNumber - 1) % widget.imageNames.length;
        if (imageNumber < 0) {
          imageNumber = widget.imageNames.length - 1;
        }
      } else {
        // Next image
        imageNumber = (imageNumber + 1) % widget.imageNames.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/${widget.imageNames[imageNumber]}',
          width: 300,
          height: 300,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => slider('p'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Prev'),
            ),
            TextButton(
              onPressed: () => slider('n'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Next'),
            ),
          ],
        )
      ],
    );
  }
}
