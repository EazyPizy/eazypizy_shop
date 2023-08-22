import 'package:get/get.dart';

import '../../core/logger.dart';

class SplashController extends GetxController {
  final _log = getLogger('Splash Controller');

  // Future<EazyMenModel> loadEazymanData(String id) async {
  //   _log.v('Getting EazyMen...');

  //   final data = await FirebaseFirestore.instance
  //       .collection('EazyMen')
  //       .doc(
  //         id,
  //       )
  //       .get();

  //   return EazyMenModel.fromJson(data.data() as DynamicMap);
  // }

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    //   final initialData = DeepLinkingService.instance.linkData;
    //   if (initialData == null) {
    //     await Get.offAllNamed(Routes.navigationScreen);
    //     return;
    //   } else {
    //     final eazymanId = initialData.link.queryParameters['id'];
    //     if (eazymanId == null) {
    //       await Get.offAllNamed(Routes.navigationScreen);
    //       return;
    //     } else {
    //       try {
    //         final eazymanData = await loadEazymanData(eazymanId);
    //         await Get.toNamed(
    //           Routes.eazymanProfile,
    //           arguments: eazymanData,
    //         );
    //         return;
    //       } catch (e) {
    //         await Get.offAllNamed(Routes.navigationScreen);
    //       }
    //     }
    //     return;
    //   }
  }
}
