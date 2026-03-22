class ApiEndpoints {
  static const String baseUrl = 'https://api.example.com';
  
  // Authentication endpoints
  static const String login = '$baseUrl/auth/login';
  static const String signup = '$baseUrl/auth/signup';
  static const String logout = '$baseUrl/auth/logout';
  static const String sendOtp = '$baseUrl/auth/send-otp';
  static const String verifyOtp = '$baseUrl/auth/verify-otp';
  static const String checkAuth = '$baseUrl/auth/check';
  
  // Profile endpoints
  static const String getProfile = '$baseUrl/profile';
  static const String updateProfile = '$baseUrl/profile';
  static const String changePassword = '$baseUrl/profile/change-password';
}
