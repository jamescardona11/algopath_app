enum DeviceScreenType {
  mobile,
  tablet,
  desktop,
}

/// Returns the [DeviceScreenType] based on the screen dimensions
DeviceScreenType getDeviceScreenType(double height, double width) {
  // Use the shorter side as reference for device type
  final shortestSide = width < height ? width : height;
  
  // Standard breakpoints
  const mobileBreakpoint = 600;
  const tabletBreakpoint = 900;

  if (shortestSide < mobileBreakpoint) {
    return DeviceScreenType.mobile;
  }
  
  if (shortestSide < tabletBreakpoint) {
    return DeviceScreenType.tablet;
  }
  
  return DeviceScreenType.desktop;
}
