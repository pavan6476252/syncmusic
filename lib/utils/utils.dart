String formatSecondsToMinutesAndSeconds(int seconds) {
  int minutes = seconds ~/ 60;  // Divide by 60 to get minutes.
  int remainingSeconds = seconds % 60;  // Use modulo 60 to get the remaining seconds.

  String formattedTime = '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';  // Format as "minutes:seconds".

  return formattedTime;
}
