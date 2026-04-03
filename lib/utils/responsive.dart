import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/main.dart';

enum Breakpoint {
  xs, // 超小屏 (<=480)
  sm, // 小屏   (480-640)
  md, // 中屏   (640-820)
  lg, // 大屏   (820-1024)
  xl, // 超大屏 (1024-1280)
  xxl; // 特大屏 (>1280)

  bool operator <=(Breakpoint other) => index <= other.index;
  bool operator <(Breakpoint other) => index < other.index;
  bool operator >(Breakpoint other) => index > other.index;
  bool operator >=(Breakpoint other) => index >= other.index;
}

const breakpoints = (xs: 480.0, sm: 640.0, md: 820.0, lg: 1024.0, xl: 1280.0);

extension Containerbreakpoints on BoxConstraints {
  bool get isXs => maxWidth <= breakpoints.xs;
  bool get isSm => maxWidth > breakpoints.xs && maxWidth <= breakpoints.sm;
  bool get isMd => maxWidth > breakpoints.sm && maxWidth <= breakpoints.md;
  bool get isLg => maxWidth > breakpoints.md && maxWidth <= breakpoints.lg;
  bool get isXl => maxWidth > breakpoints.lg && maxWidth <= breakpoints.xl;
  bool get is2Xl => maxWidth > breakpoints.xl;

  Breakpoint get breakpoint {
    if (isXs) return Breakpoint.xs;
    if (isSm) return Breakpoint.sm;
    if (isMd) return Breakpoint.md;
    if (isLg) return Breakpoint.lg;
    if (isXl) return Breakpoint.xl;
    return Breakpoint.xxl;
  }

  bool get smAndUp => isSm || isMd || isLg || isXl || is2Xl;
  bool get mdAndUp => isMd || isLg || isXl || is2Xl;
  bool get lgAndUp => isLg || isXl || is2Xl;
  bool get xlAndUp => isXl || is2Xl;

  bool get smAndDown => isXs || isSm;
  bool get mdAndDown => isXs || isSm || isMd;
  bool get lgAndDown => isXs || isSm || isMd || isLg;
  bool get xlAndDown => isXs || isSm || isMd || isLg || isXl;
}

extension Screenbreakpoints on MediaQueryData {
  bool get isXs => size.width <= breakpoints.xs;
  bool get isSm => size.width > breakpoints.xs && size.width <= breakpoints.sm;
  bool get isMd => size.width > breakpoints.sm && size.width <= breakpoints.md;
  bool get isLg => size.width > breakpoints.md && size.width <= breakpoints.lg;
  bool get isXl => size.width > breakpoints.lg && size.width <= breakpoints.xl;
  bool get is2Xl => size.width > breakpoints.xl;

  Breakpoint get breakpoint {
    if (isXs) return Breakpoint.xs;
    if (isSm) return Breakpoint.sm;
    if (isMd) return Breakpoint.md;
    if (isLg) return Breakpoint.lg;
    if (isXl) return Breakpoint.xl;
    return Breakpoint.xxl;
  }

  bool get smAndUp => isSm || isMd || isLg || isXl || is2Xl;
  bool get mdAndUp => isMd || isLg || isXl || is2Xl;
  bool get lgAndUp => isLg || isXl || is2Xl;
  bool get xlAndUp => isXl || is2Xl;

  bool get smAndDown => isXs || isSm;
  bool get mdAndDown => isXs || isSm || isMd;
  bool get lgAndDown => isXs || isSm || isMd || isLg;
  bool get xlAndDown => isXs || isSm || isMd || isLg || isXl;
}

extension Sizebreakpoints on Size {
  bool get isXs => width <= breakpoints.xs;
  bool get isSm => width > breakpoints.xs && width <= breakpoints.sm;
  bool get isMd => width > breakpoints.sm && width <= breakpoints.md;
  bool get isLg => width > breakpoints.md && width <= breakpoints.lg;
  bool get isXl => width > breakpoints.lg && width <= breakpoints.xl;
  bool get is2Xl => width > breakpoints.xl;

  bool get smAndUp => isSm || isMd || isLg || isXl || is2Xl;
  bool get mdAndUp => isMd || isLg || isXl || is2Xl;
  bool get lgAndUp => isLg || isXl || is2Xl;
  bool get xlAndUp => isXl || is2Xl;

  bool get smAndDown => isXs || isSm;
  bool get mdAndDown => isXs || isSm || isMd;
  bool get lgAndDown => isXs || isSm || isMd || isLg;
  bool get xlAndDown => isXs || isSm || isMd || isLg || isXl;

  double get multiplier {
    if (smAndDown) {
      return 0.7;
    } else if (isMd) {
      return 0.8;
    } else if (isLg) {
      return 0.9;
    }
    return 1.0;
  }

  double get multiplier2 {
    if (smAndDown) {
      return 0.8;
    } else if (isMd) {
      return 0.9;
    }
    return 1.0;
  }

  double get multiplier3 {
    if (smAndDown) {
      return 0.9;
    }
    return 1.0;
  }
}

extension Contextbreakpoints on BuildContext {
  Size get size => MediaQuery.of(this).size;
  Future<void> pushWrapper<T extends Object?>(
    String location, {
    Object? extra,
  }) async {
    if (size.lgAndUp) {
      final router = GoRouter.of(this);
      if (router.state.path?.startsWith("/mobile") ?? false) {
        go(location);
        return;
      }
      await push<T>(location, extra: extra);
      return;
    }
    if (location == '/') await push<T>(location, extra: extra);
    if (location.startsWith('/mobile_home')) {
      await push<T>(location, extra: extra);
      return;
    }
    if (publicPaths.any((path) => location.startsWith(path))) {
      await push<T>(location, extra: extra);
      return;
    }
    location = '/mobile$location';
    await push<T>(location, extra: extra);
  }
}
