part of 'widgets.dart';

class VerifyCodeForm extends StatefulWidget {
  VerifyCodeForm({super.key, required this.email});

  String email;

  @override
  _VerifyCodeFormState createState() => _VerifyCodeFormState();
}

class _VerifyCodeFormState extends State<VerifyCodeForm> {
  bool _isButtonDisabled = true;
  late Timer _timer;

  int _start = 60;

  void startTimer() {
    _isButtonDisabled = true;
    _start = 60;
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _isButtonDisabled = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  String otp1 = '';
  String otp2 = '';
  String otp3 = '';
  String otp4 = '';

  @override
  Widget build(BuildContext context) {
    final read = context.read<ForgetViewModel>();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.blackWithOpacity,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              'Enter Code Here',
              style: GoogleFonts.nunito(
                fontSize: 14.h(context),
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ItemOfCode(index: 0, onChanged: (text) => otp1 = text),
                ItemOfCode(index: 1, onChanged: (text) => otp2 = text),
                ItemOfCode(index: 2, onChanged: (text) => otp3 = text),
                ItemOfCode(index: 3, onChanged: (text) => otp4 = text),
              ],
            ),
            const Gap(20),
            Text(
              '${(_start ~/ 60).toString().padLeft(2, '0')}:${(_start % 60).toString().padLeft(2, '0')}',
              style: GoogleFonts.nunito(
                fontSize: 14.h(context),
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(40),
            ElevatedButton(
              onPressed: () async {
                FocusScope.of(context).unfocus();
                String finalOtp = otp1 + otp2 + otp3 + otp4;
                if (finalOtp.length < 4) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please fill all OTP fields'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                  return;
                }
                var response = await read.confirmReset(finalOtp, widget.email);
                if (response!.data["token"] != null) {
                  context.push(RouteNames.changePsw, extra: {
                    'email': widget.email,
                    'token': response.data['token']
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Invalid OTP'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: const Text('Verify'),
            ),
            const Gap(20),
            if (!_isButtonDisabled)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn’t receive code?',
                    style: GoogleFonts.nunito(
                      fontSize: 11.h(context),
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      read.sendEmail(context, widget.email);
                      startTimer();
                    },
                    child: Text(
                      'Resend Code',
                      style: GoogleFonts.nunito(
                        fontSize: 11.h(context),
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
