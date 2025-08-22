import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_size.dart';

// import '../components/Tab.dart';
class Taikhoan extends StatelessWidget {
  const Taikhoan({super.key});
  Widget renderBody(BuildContext context) {
    return Expanded(
      child: Container(
        color: MyColors.surfaceContainerLowest,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              height: 120,
              width: double.infinity,
              child: Row(children: [
                SizedBox(
                    width: 70,
                    height: 70,
                    child: Image.network(
                      "https://raw.githubusercontent.com/coredxor/images/main/q10.png",
                      fit: BoxFit.fill,
                    )),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 16),
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicHeight(
                            child: SizedBox(
                              width: double.infinity,
                              child: Row(children: [
                                const Text(
                                  "Afsar Hossen",
                                  style: TextStyle(
                                    color: Color(0xFF181725),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                      margin: const EdgeInsets.only(left: 8),
                                      width: 15,
                                      height: 15,
                                      child: Image.network(
                                        "https://raw.githubusercontent.com/coredxor/images/main/q12.png",
                                        fit: BoxFit.fill,
                                      )),
                                ),
                              ]),
                            ),
                          ),
                          const Text(
                            "abcxtz@gmail.com",
                            style: TextStyle(
                              color: Color(0xFF303233),
                              fontSize: MyFontSize.body_medium,
                            ),
                          ),
                        ]),
                  ),
                ),
              ]),
            ),
            Container(
              color: const Color(0xFFE2E2E2),
              height: 1,
              width: double.infinity,
              child: const SizedBox(),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Column(children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    height: double.infinity,
                    child: Row(children: [
                      Container(
                          margin: const EdgeInsets.only(right: 16),
                          width: 20,
                          height: 20,
                          child: Image.network(
                            "https://raw.githubusercontent.com/coredxor/images/main/q8.png",
                            fit: BoxFit.fill,
                          )),
                      const Text(
                        "Orders",
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: SizedBox(),
                        ),
                      ),
                      SizedBox(
                          width: 12,
                          height: 20,
                          child: Image.network(
                            "https://raw.githubusercontent.com/coredxor/images/main/q2.png",
                            fit: BoxFit.fill,
                          )),
                    ]),
                  ),
                ),
                Container(
                  color: const Color(0xFFE2E2E2),
                  height: 1,
                  width: double.infinity,
                  child: const SizedBox(),
                ),
              ]),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Column(children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    height: double.infinity,
                    child: Row(children: [
                      Container(
                          margin: const EdgeInsets.only(right: 16),
                          width: 20,
                          height: 20,
                          child: Image.network(
                            "https://raw.githubusercontent.com/coredxor/images/main/q7.png",
                            fit: BoxFit.fill,
                          )),
                      const Text(
                        "My Details",
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: SizedBox(),
                        ),
                      ),
                      SizedBox(
                          width: 12,
                          height: 20,
                          child: Image.network(
                            "https://raw.githubusercontent.com/coredxor/images/main/q2.png",
                            fit: BoxFit.fill,
                          )),
                    ]),
                  ),
                ),
                Container(
                  color: const Color(0xFFE2E2E2),
                  height: 1,
                  width: double.infinity,
                  child: const SizedBox(),
                ),
              ]),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Column(children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    height: double.infinity,
                    child: Row(children: [
                      Container(
                          margin: const EdgeInsets.only(right: 16),
                          width: 20,
                          height: 20,
                          child: Image.network(
                            "https://raw.githubusercontent.com/coredxor/images/main/q4.png",
                            fit: BoxFit.fill,
                          )),
                      const Text(
                        "Delivery Address",
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: SizedBox(),
                        ),
                      ),
                      SizedBox(
                          width: 12,
                          height: 20,
                          child: Image.network(
                            "https://raw.githubusercontent.com/coredxor/images/main/q2.png",
                            fit: BoxFit.fill,
                          )),
                    ]),
                  ),
                ),
                Container(
                  color: const Color(0xFFE2E2E2),
                  height: 1,
                  width: double.infinity,
                  child: const SizedBox(),
                ),
              ]),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Column(children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    height: double.infinity,
                    child: Row(children: [
                      Container(
                          margin: const EdgeInsets.only(right: 16),
                          width: 20,
                          height: 20,
                          child: Image.network(
                            "https://raw.githubusercontent.com/coredxor/images/main/q13.png",
                            fit: BoxFit.fill,
                          )),
                      const Text(
                        "Payment Methods",
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: SizedBox(),
                        ),
                      ),
                      SizedBox(
                          width: 12,
                          height: 20,
                          child: Image.network(
                            "https://raw.githubusercontent.com/coredxor/images/main/q2.png",
                            fit: BoxFit.fill,
                          )),
                    ]),
                  ),
                ),
                Container(
                  color: const Color(0xFFE2E2E2),
                  height: 1,
                  width: double.infinity,
                  child: const SizedBox(),
                ),
              ]),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Column(children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    height: double.infinity,
                    child: Row(children: [
                      Container(
                          margin: const EdgeInsets.only(right: 16),
                          width: 20,
                          height: 20,
                          child: Image.network(
                            "https://raw.githubusercontent.com/coredxor/images/main/q9.png",
                            fit: BoxFit.fill,
                          )),
                      const Text(
                        "Promo Cord",
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: SizedBox(),
                        ),
                      ),
                      SizedBox(
                          width: 12,
                          height: 20,
                          child: Image.network(
                            "https://raw.githubusercontent.com/coredxor/images/main/q2.png",
                            fit: BoxFit.fill,
                          )),
                    ]),
                  ),
                ),
                Container(
                  color: const Color(0xFFE2E2E2),
                  height: 1,
                  width: double.infinity,
                  child: const SizedBox(),
                ),
              ]),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Column(children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    height: double.infinity,
                    child: Row(children: [
                      Container(
                          margin: const EdgeInsets.only(right: 16),
                          width: 20,
                          height: 20,
                          child: Image.network(
                            "https://raw.githubusercontent.com/coredxor/images/main/q3.png",
                            fit: BoxFit.fill,
                          )),
                      const Text(
                        "Notifecations ",
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: SizedBox(),
                        ),
                      ),
                      SizedBox(
                          width: 12,
                          height: 20,
                          child: Image.network(
                            "https://raw.githubusercontent.com/coredxor/images/main/q2.png",
                            fit: BoxFit.fill,
                          )),
                    ]),
                  ),
                ),
                Container(
                  color: const Color(0xFFE2E2E2),
                  height: 1,
                  width: double.infinity,
                  child: const SizedBox(),
                ),
              ]),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Column(children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    height: double.infinity,
                    child: Row(children: [
                      Container(
                          margin: const EdgeInsets.only(right: 16),
                          width: 20,
                          height: 20,
                          child: Image.network(
                            "https://raw.githubusercontent.com/coredxor/images/main/q6.png",
                            fit: BoxFit.fill,
                          )),
                      const Text(
                        "Help",
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: SizedBox(),
                        ),
                      ),
                      SizedBox(
                          width: 12,
                          height: 20,
                          child: Image.network(
                            "https://raw.githubusercontent.com/coredxor/images/main/q2.png",
                            fit: BoxFit.fill,
                          )),
                    ]),
                  ),
                ),
                Container(
                  color: const Color(0xFFE2E2E2),
                  height: 1,
                  width: double.infinity,
                  child: const SizedBox(),
                ),
              ]),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Column(children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    height: double.infinity,
                    child: Row(children: [
                      Container(
                          margin: const EdgeInsets.only(right: 16),
                          width: 20,
                          height: 20,
                          child: Image.network(
                            "https://raw.githubusercontent.com/coredxor/images/main/q1.png",
                            fit: BoxFit.fill,
                          )),
                      const Text(
                        "About ",
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: SizedBox(),
                        ),
                      ),
                      SizedBox(
                          width: 12,
                          height: 20,
                          child: Image.network(
                            "https://raw.githubusercontent.com/coredxor/images/main/q2.png",
                            fit: BoxFit.fill,
                          )),
                    ]),
                  ),
                ),
                Container(
                  color: const Color(0xFFE2E2E2),
                  height: 1,
                  width: double.infinity,
                  child: const SizedBox(),
                ),
              ]),
            ),
          ],
        )),
      ),
    );
  }

  Widget renderFooter(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFF2F3F2),
      ),
      padding: const EdgeInsets.only(left: 16, right: 16),
      margin: const EdgeInsets.all(16),
      height: 65,
      width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
            width: 18,
            height: 18,
            child: Image.network(
              "https://raw.githubusercontent.com/coredxor/images/main/q5.png",
              fit: BoxFit.fill,
            )),
        const Text(
          "Log Out",
          style: TextStyle(
            color: Color(0xFF53B175),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 18,
          height: 18,
          child: SizedBox(),
        ),
      ]),
    );
  }

  Widget renderTab(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF808080),
          width: 2,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      height: 70,
      width: double.infinity,
      child: Row(children: [
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: 25,
                  height: 25,
                  child: Image.network(
                    "https://raw.githubusercontent.com/coredxor/images/main/i1.png",
                    fit: BoxFit.fill,
                  )),
              const Text(
                "Shop",
                style: TextStyle(
                  color: Color(0xFF181725),
                  fontSize: MyFontSize.body_medium,
                ),
              ),
            ]),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: 25,
                  height: 25,
                  child: Image.network(
                    "https://raw.githubusercontent.com/coredxor/images/main/z2.png",
                    fit: BoxFit.fill,
                  )),
              const Text(
                "Explore",
                style: TextStyle(
                  color: Color(0xFF181725),
                  fontSize: MyFontSize.body_medium,
                ),
              ),
            ]),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: 25,
                  height: 25,
                  child: Image.network(
                    "https://raw.githubusercontent.com/coredxor/images/main/i4.png",
                    fit: BoxFit.fill,
                  )),
              const Text(
                "Cart",
                style: TextStyle(
                  color: Color(0xFF181725),
                  fontSize: MyFontSize.body_medium,
                ),
              ),
            ]),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: 25,
                  height: 25,
                  child: Image.network(
                    "https://raw.githubusercontent.com/coredxor/images/main/i5.png",
                    fit: BoxFit.fill,
                  )),
              const Text(
                "Favourite",
                style: TextStyle(
                  color: Color(0xFF181725),
                  fontSize: MyFontSize.body_medium,
                ),
              ),
            ]),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: 25,
                  height: 25,
                  child: Image.network(
                    "https://raw.githubusercontent.com/coredxor/images/main/q11.png",
                    fit: BoxFit.fill,
                  )),
              const Text(
                "Account",
                style: TextStyle(
                  color: Color(0xFF53B175),
                  fontSize: MyFontSize.body_medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: MyColors.surfaceContainerLowest,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              renderBody(context),
              renderFooter(context),
              renderTab(context),
            ],
          ),
        ),
      ),
    );
  }
}
