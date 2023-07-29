class AppConstants {
  static const String appName = 'TB Detector';
  static const String baseUrl =
      'https://handleimageanalysis-k7hemmjl6a-uc.a.run.app';
  static const String fireBaseProject = '/tbdetector-65a03';
  static const String region = '/us-central1';
  static const String imageAnalysisEndpoint =
      '$fireBaseProject$region/handleImageAnalysis';

  static getImageAnalysisEndpoint() {
    return '$baseUrl$imageAnalysisEndpoint';
  }
}
