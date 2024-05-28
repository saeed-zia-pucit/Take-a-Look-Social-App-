
part of 'pages.dart';

class AboutTermPrivacy extends StatefulWidget {
  const AboutTermPrivacy({super.key, required this.aboutTermPrivacyType});

  final AboutTermPrivacyType aboutTermPrivacyType;

  @override
  State<AboutTermPrivacy> createState() => _AboutTermPrivacyState();
}

class _AboutTermPrivacyState extends State<AboutTermPrivacy> {

  String about = """
**About Us**
 
Welcome to Take A Look, your premier destination for hair education and empowerment. At Take A Look, we believe that knowledge is the key to unlocking creativity and confidence in the beauty industry. Our mission is to provide comprehensive, accessible, and engaging educational content that empowers both aspiring and seasoned hair professionals to elevate their skills and stay ahead of industry trends.
 
**Our Story**
 
Take A Look was founded by Tamika Sturgis, a passionate industry veteran with over 20 years of experience in hair styling and education. Recognizing the need for high-quality, easily accessible educational resources, Tamika Sturgis set out to create a platform that combines expert instruction with the convenience of modern technology. Take A Look was born from a desire to bridge the gap between traditional beauty schools and the dynamic, ever-evolving world of hair styling.
 
**Our Vision**
 
We envision a world where every hair professional has the tools and knowledge they need to succeed. Whether you’re just starting your journey in the beauty industry or looking to refine your techniques, Take A Look is here to support you. Our app offers a diverse range of courses, tutorials, and resources, all designed to help you achieve your goals and express your creativity.
 
**What We Offer**
 
- **Expert Instruction:** Learn from top industry professionals who share their insider tips, tricks, and techniques.
- **Comprehensive Courses:** Our curriculum covers a wide range of topics, from basic hair cutting and styling to advanced coloring and treatment techniques.
- **Interactive Learning:** Engage with our content through videos, quizzes, and hands-on assignments that reinforce your learning.
- **Community Support:** Connect with fellow learners and industry experts through our community forums and events.
 
 
**Why Choose Us**
 
At Take A Look, we are dedicated to your success. We continuously update our content to reflect the latest trends and techniques in the beauty industry, ensuring you always have access to cutting-edge knowledge. Our user-friendly app is designed to fit seamlessly into your busy lifestyle, allowing you to learn at your own pace, anytime and anywhere.
 
Join us on this exciting journey and take your hair styling skills to new heights with [App Name]. Whether you’re looking to enhance your career or simply explore your passion for hair, we’re here to guide and inspire you every step of the way.
 
**Contact Us**
 
Have questions or need support? We’re here to help! Reach out to us at TakeALook@info.com, and a member of our team will be happy to assist you.
 
**Follow Us**
 
Stay up-to-date with the latest news, updates, and special offers by following us on social media:
- Instagram - @TakeALook
 
 
Thank you for choosing TakeALook@info.com. We look forward to being a part of your educational journey!
  """;
  String term = """
**Terms of Service**
 
**1. Acceptance of Terms**
By accessing or using Take A Look (the "App"), you agree to be bound by these Terms of Service ("Terms"). If you do not agree to these Terms, you may not use the App.
 
**2. Use of the App**
- **Eligibility:** You must be at least 16 years old to use the App. By using the App, you represent and warrant that you meet this age requirement.
- **Account Registration:** You may be required to create an account to access certain features of the App. You agree to provide accurate, complete, and current information during the registration process and to update such information as necessary.
- **User Conduct:** You agree not to use the App for any unlawful or prohibited activities. You also agree not to interfere with or disrupt the App's operation.
 
**3. Intellectual Property**
All content and materials available on the App, including text, graphics, logos, and software, are the property of [Company Name] or its licensors and are protected by intellectual property laws. You agree not to reproduce, distribute, or create derivative works from any content without our prior written permission.
 
**4. Subscription and Payment**
- **Subscription Services:** Some features of the App may require a paid subscription. By subscribing, you agree to pay all applicable fees and charges.
- **Billing:** We use a third-party payment processor to handle billing and payments. By providing your payment information, you agree to our payment processor's terms and policies.
 
**5. Termination**
We may terminate or suspend your account and access to the App at our sole discretion, without prior notice or liability, for any reason, including if you breach these Terms.
 
**6. Disclaimer of Warranties**
The App is provided on an "as-is" and "as-available" basis. We make no warranties, express or implied, regarding the App's operation or the information, content, or materials included on the App.
 
**7. Limitation of Liability**
To the maximum extent permitted by law, [Company Name] shall not be liable for any indirect, incidental, special, or consequential damages arising out of or in connection with your use of the App.
 
**8. Governing Law**
These Terms shall be governed by and construed in accordance with the laws of [State/Country], without regard to its conflict of law principles.
 
 
**9. Changes to These Terms**
We may update these Terms from time to time. We will notify you of any changes by posting the new Terms on this page. Your continued use of the App after such changes will constitute your acknowledgment and acceptance of the updated Terms.
 
**10. Contact Us**
If you have any questions or concerns about these Terms, please contact us at TakeALook@info.com.
  """;
  String privacy = """
**Privacy Policy**
 
**1. Introduction**
Welcome to Take A Look, a hair educational app operated by Take A Look Co. ("we," "us," "our"). Your privacy is important to us. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our app.
 
**2. Information We Collect**
- **Personal Information:** We may collect personal information such as your name, email address, and phone number when you register for an account or subscribe to our services.
- **Usage Data:** We collect information about how you use the app, including your interactions with educational content, features, and other users.
- **Device Information:** We may collect information about the device you use to access the app, including your IP address, device type, operating system, and browser type.
 
**3. How We Use Your Information**
- **To Provide Services:** We use your information to operate and maintain the app, provide customer support, and improve our services.
- **To Personalize Experience:** We may use your information to personalize your experience and deliver content tailored to your interests.
- **To Communicate with You:** We use your contact information to send you updates, newsletters, and other communications.
 
**4. Sharing Your Information**
We do not sell, trade, or otherwise transfer your personal information to outside parties except as described below:
- **Service Providers:** We may share your information with third-party service providers who assist us in operating the app and providing our services.
- **Legal Requirements:** We may disclose your information if required by law or in response to a valid request by a government or law enforcement agency.
 
 
**5. Data Security**
We implement reasonable security measures to protect your information from unauthorized access, use, or disclosure. However, no method of transmission over the internet or electronic storage is 100% secure.
 
**6. Your Rights**
You have the right to access, correct, or delete your personal information. You may also opt-out of receiving communications from us at any time by following the unsubscribe link in our emails or contacting us directly.
 
**7. Changes to This Privacy Policy**
We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. Your continued use of the app after such changes will constitute your acknowledgment and acceptance of the updated terms.
 
**8. Contact Us**
If you have any questions or concerns about this Privacy Policy, please contact us at  TakeALook@info.com.
  
""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        (widget.aboutTermPrivacyType == AboutTermPrivacyType.about) ?
        const Text('About Us') :
        (widget.aboutTermPrivacyType == AboutTermPrivacyType.term) ?
        const Text('Terms & Condition') :
        const Text('Privacy & Policy'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: (widget.aboutTermPrivacyType == AboutTermPrivacyType.about) ?
          Text(about) :
          (widget.aboutTermPrivacyType == AboutTermPrivacyType.term) ?
          Text(term) :
          Text(privacy),
        ),
      ),
    );
  }
}

enum AboutTermPrivacyType {
  about,
  term,
  privacy,
}