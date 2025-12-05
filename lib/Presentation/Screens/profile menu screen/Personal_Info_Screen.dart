import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/text%20filed/custom_text_field.dart.dart';
import 'package:intershipflutter/Constans/widgets/profile%20info%20widgets/profile_header.dart';
import 'package:intershipflutter/businessLogic/user%20provider/user_provider.dart';
import 'package:provider/provider.dart';


class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  late TextEditingController _fullNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    final userProvider = context.read<UserProvider>();
    _fullNameController =
        TextEditingController(text: userProvider.user.fullName);
    _phoneController =
        TextEditingController(text: userProvider.user.phoneNumber);
    _emailController = TextEditingController(text: userProvider.user.email);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _toggleEditMode() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _resetChanges() {
    final userProvider = context.read<UserProvider>();
    _fullNameController.text = userProvider.user.fullName;
    _phoneController.text = userProvider.user.phoneNumber;
    _emailController.text = userProvider.user.email;
    _toggleEditMode();
  }

  void _saveChanges() async {
    final userProvider = context.read<UserProvider>();

    // Validate inputs
    if (_fullNameController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please fill in all fields'),
          backgroundColor: Colors.red[600],
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
      return;
    }

    // Validate email format
    if (!_isValidEmail(_emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please enter a valid email address'),
          backgroundColor: Colors.red[600],
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
      return;
    }

    // Validate phone number format
    if (!_isValidPhoneNumber(_phoneController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please enter a valid phone number'),
          backgroundColor: Colors.red[600],
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
      return;
    }

    await userProvider.updateUserProfile(
      fullName: _fullNameController.text,
      phoneNumber: _phoneController.text,
      email: _emailController.text,
    );

    if (mounted) {
      _toggleEditMode();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Profile updated successfully'),
          backgroundColor: Colors.green[600],
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  bool _isValidPhoneNumber(String phone) {
    final phoneRegex = RegExp(r'^[0-9]{10,}$');
    return phoneRegex.hasMatch(phone.replaceAll(RegExp(r'[^0-9]'), ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                // Profile Header
                ProfileHeader(
                  userName: userProvider.user.fullName,
                  profileImageUrl: userProvider.user.profileImageUrl,
                  showEditButton: false,
                ),

                // Content
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header with back button and edit/save button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.08),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(8),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Color(0xFF1B7B7A),
                              ),
                            ),
                          ),
                          if (!userProvider.isLoading)
                            GestureDetector(
                              onTap: _isEditing ? _saveChanges : _toggleEditMode,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1B7B7A),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF1B7B7A)
                                          .withOpacity(0.2),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                child: Text(
                                  _isEditing ? 'Save' : 'Edit',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Form Fields
                      CustomTextField(
                        label: 'Full Name',
                        hintText: 'Enter your full name',
                        controller: _fullNameController,
                        enabled: _isEditing,
                      ),
                      const SizedBox(height: 20),

                      // Phone Number with Change button
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Phone Number',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              letterSpacing: 0.3,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      _phoneController.text,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  if (!_isEditing)
                                    GestureDetector(
                                      onTap: _toggleEditMode,
                                      child: const Text(
                                        'Change',
                                        style: TextStyle(
                                          color: Color(0xFF1B7B7A),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      if (_isEditing)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              label: 'Phone Number (Edit)',
                              hintText: 'Enter your phone number',
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              enabled: _isEditing,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),

                      CustomTextField(
                        label: 'Email',
                        hintText: 'Enter your email',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        enabled: _isEditing,
                      ),

                      if (_isEditing) ...[
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: _resetChanges,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.grey[300]!,
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: GestureDetector(
                                onTap: _saveChanges,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1B7B7A),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF1B7B7A)
                                            .withOpacity(0.2),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Save Changes',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],

                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

