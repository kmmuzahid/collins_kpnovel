class ProfileState {
  final bool isLoading;
  final Map<String, dynamic>? profileData;

  const ProfileState({this.isLoading = false, this.profileData});

  ProfileState copyWith({
    bool? isLoading,
    String? error,
    Map<String, dynamic>? profileData,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      profileData: profileData ?? this.profileData,
    );
  }
}
