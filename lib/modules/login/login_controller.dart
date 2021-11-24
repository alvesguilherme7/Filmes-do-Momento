import 'package:app_filmes/application/ui/loader/loader_mixin.dart';
import 'package:app_filmes/application/ui/messages/messages_mixin.dart';
import 'package:app_filmes/services/login/login_service_impl.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessageMixin {
  final LoginServiceImpl _loginService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();


  LoginController({ required loginService,}) : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(this.loading);
    messageListener(this.message);
  }

  Future<void> login() async {
    try{
      this.loading(true);
      await _loginService.login();
      this.loading(false);
      message(MessageModel.info(title: 'Sucesso', message: 'Login realizado com sucesso.'));
    } on Exception catch(e, s) {
      print(e);
      print(s);
      this.loading(false);
      message(MessageModel.error(title: 'Ops', message: 'Erro ao realizar login.'));
    }
  }
}