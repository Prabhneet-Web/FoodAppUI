import 'package:flutter/material.dart';
import 'package:simple_animations/multi_tween/multi_tween.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';

enum AniProps { opacity, translateX }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  // ignore: use_key_in_widget_constructors
  const FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AniProps>()
      ..add(AniProps.opacity, Tween(begin: 0.0, end: 1.0),
          const Duration(milliseconds: 500))
      ..add(AniProps.translateX, Tween(begin: 150.0, end: 0.0),
          const Duration(microseconds: 500), Curves.easeInBack);
    return PlayAnimation<MultiTweenValues<AniProps>>(
        delay: Duration(milliseconds: (500 * delay).round()),
        duration: tween.duration,
        tween: tween,
        child: child,
        builder: (context, child, value) => Opacity(
              opacity: value.get(AniProps.opacity),
              child: Transform.translate(
                  offset: Offset(0, value.get(AniProps.translateX)),
                  child: child),
            ));
  }
}
