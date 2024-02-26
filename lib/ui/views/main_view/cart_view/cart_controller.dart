import 'package:challenge_2/core/enums/message_type.dart';
import 'package:challenge_2/core/services/base_controller.dart';
import 'package:challenge_2/ui/shared/custom_widgets/custom_toast.dart';
import 'package:challenge_2/ui/shared/utils.dart';
import 'package:challenge_2/ui/views/check_out/check_out_view.dart';
import 'package:get/get.dart';

import '../../../../core/data/models/cart_model.dart';

class CartController extends BaseController {
  RxList<CartModel> cartList = cartService.cartList;
  void removeFromCart(CartModel model) {
    cartService.removeFromCartList(model);
  }

  void changeCount({required bool incress, required CartModel model}) {
    cartService.changeCount(incress: incress, model: model);
  }

  void checkout() {
    runFullLoadingFutureFunction(
        function: Future.delayed(const Duration(seconds: 2)).then((value) {
      CustomToast.showMessage(
          message: 'Order placed successfully',
          messageType: MessageType.SUCCESS);

      Get.off(CheckOutView());
    }));
  }
}
