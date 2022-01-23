import 'package:get/get.dart';
import 'package:renner_coatings/app/modules/alterar_idioma/alterar_idioma_binding.dart';
import 'package:renner_coatings/app/modules/aplicacao/aplicacao_binding.dart';
import 'package:renner_coatings/app/modules/cadastro_user/cadastro_user_binding.dart';
import 'package:renner_coatings/app/modules/configuracoes/configuracoes_binding.dart';
import 'package:renner_coatings/app/modules/faq/faq_binding.dart';
import 'package:renner_coatings/app/modules/fispqs_bts/fispqs_bts_binding.dart';
import 'package:renner_coatings/app/modules/home/home_binding.dart';
import 'package:renner_coatings/app/modules/locais_lojas/locais_lojas_binding.dart';
import 'package:renner_coatings/app/modules/login/login_binding.dart';
import 'package:renner_coatings/app/modules/meus_dados/meus_dados_binding.dart';
import 'package:renner_coatings/app/modules/normas/normas_binding.dart';
import 'package:renner_coatings/app/modules/politica_privacidade/politica_privacidade_binding.dart';
import 'package:renner_coatings/app/modules/produto_info/produto_info_binding.dart';
import 'package:renner_coatings/app/modules/produtos_nomes/produtos_nomes_binding.dart';
import 'package:renner_coatings/app/modules/produtos_por_segmento/produtos_por_segmento_binding.dart';
import 'package:renner_coatings/app/modules/segmentos/segmentos_binding.dart';
import 'package:renner_coatings/app/modules/splash/splash_binding.dart';
import 'package:renner_coatings/app/modules/step_um/step_um_binding.dart';
import 'package:renner_coatings/app/modules/tank_lining/tank_lining_binding.dart';
import 'package:renner_coatings/app/modules/tecnologia/tecnologia_binding.dart';
import 'package:renner_coatings/app/pages/alterar_idioma/alterar_idioma.dart';
import 'package:renner_coatings/app/pages/alterar_senha/alterar_senha.dart';
import 'package:renner_coatings/app/pages/cadastro_user/cadastro_user.dart';
import 'package:renner_coatings/app/pages/configuracoes/configuracoes.dart';
import 'package:renner_coatings/app/pages/conta/conta.dart';
import 'package:renner_coatings/app/pages/faq/faq.dart';
import 'package:renner_coatings/app/pages/fispqs_bts/fispqs_bts.dart';
import 'package:renner_coatings/app/pages/home/home.dart';
import 'package:renner_coatings/app/pages/locais_lojas/locais_lojas.dart';
import 'package:renner_coatings/app/pages/login/login.dart';
import 'package:renner_coatings/app/pages/normas/normas.dart';
import 'package:renner_coatings/app/pages/normas/pages/normas_page2.dart';
import 'package:renner_coatings/app/pages/normas/pages/normas_page3.dart';
import 'package:renner_coatings/app/pages/politica_privacidade/politica_privacidade.dart';
import 'package:renner_coatings/app/pages/produto_info/produto_info.dart';
import 'package:renner_coatings/app/pages/produtos/pages/aplicacao/aplicacao.dart';
import 'package:renner_coatings/app/pages/produtos/pages/nomes/produtos_nomes.dart';
import 'package:renner_coatings/app/pages/produtos_por_segmento/produtos_por_segmento.dart';
import 'package:renner_coatings/app/pages/recuperar_senha/recuperar_senha.dart';
import 'package:renner_coatings/app/pages/produtos/produtos.dart';
import 'package:renner_coatings/app/pages/segmentos/segmentos.dart';
import 'package:renner_coatings/app/pages/sobre_app/sobre_app.dart';
import 'package:renner_coatings/app/pages/meus_dados/meus_dados.dart';
import 'package:renner_coatings/app/pages/splash/splash.dart';
import 'package:renner_coatings/app/pages/step_um/step_um.dart';
import 'package:renner_coatings/app/pages/tank_lining/tank_lining.dart';
import 'package:renner_coatings/app/pages/tank_lining/widgets/telas/tank2_list.dart';
import 'package:renner_coatings/app/pages/tank_lining/widgets/telas/tank3_list.dart';
import 'package:renner_coatings/app/pages/tank_lining/widgets/telas/tank4_normas.dart';
import 'package:renner_coatings/app/pages/tecnologia/tecnologia.dart';
import 'package:renner_coatings/app/pages/termos_uso/termos_uso.dart';

part './app_routes.dart';

class AppPages {
  AppPages._();

  // TODO: esse vai ser o inicial do app
  // static const INITIAL = Routes.SPLASH;

  //TODO: temp para desenvolvimento
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(name: Routes.SPLASH, page: () => SplashPage(), binding: SplashBinding()),
    GetPage(name: Routes.SPLASH, page: () => SplashPage(), binding: SplashBinding()),
    GetPage(name: Routes.HOME, page: () => Home(), binding: HomeBinding()),
    GetPage(name: Routes.STEPUM, page: () => StepUm(), binding: StepUmBinding()),
    GetPage(name: Routes.SOBRE_APP, page: () => SobreApp()),
    GetPage(name: Routes.LOGIN, page: () => Login(), binding: LoginBinding()),
    //binding: HomeBinding()), //LoginBinding()),
    GetPage(name: Routes.MEUS_DADOS, page: () => MeusDados(), binding: MeusDadosBinding()),
    GetPage(name: Routes.CADASTRO_USER, page: () => CadastroUser(), binding: CadastroUserBinding()),
    GetPage(name: Routes.LOCIASLOJAS, page: () => LocaisLojas(), binding: LocaisLojasBinding()),
    GetPage(name: Routes.CONTA, page: () => Conta()),
    GetPage(name: Routes.TERMOS_USO, page: () => TermosUso()),
    GetPage(name: Routes.RECUPERAR_SENHA, page: () => RecuperarSenha()),
    GetPage(name: Routes.CONFIGURACOES, page: () => Configuracoes(), binding: ConfiguracoesBinding()),
    GetPage(name: Routes.POLITICA_PRIVACIDADE, page: () => PoliticaPrivacidade(), binding: PoliticaPrivacidadeBinding()),
    GetPage(name: Routes.PRODUTOSHOME, page: () => ProdutosHome()),
    GetPage(name: Routes.ALTERARIDIOMA, page: () => AlterarIdioma(), binding: AlterarIdiomaBinding()),
    GetPage(name: Routes.TANKLINING, page: () => TankLining(), binding: TankLiningBinding()),
    GetPage(name: Routes.TANKLININGLISTAGENTS, page: () => TankLiningListAgentes(), binding: TankLiningBinding()),
    GetPage(name: Routes.TANKAGENTSRESULT, page: () => TankAgentesResult(), binding: TankLiningBinding()),
    GetPage(name: Routes.ALTERAR_SENHA, page: () => AlterarSenha()),
    GetPage(name: Routes.FAQ, page: () => FAQ(), binding: FaqBinding()),
    GetPage(name: Routes.TANKAGENTESNORMAS, page: () => TankAgentesNormas()),
    GetPage(name: Routes.SEGMENTOS, page: () => SegmentosPage(), binding: SegmentosBinding()),
    GetPage(name: Routes.PRODUTOS_POR_SEGMENTO, page: () => ProdutosPorSegmentoPage(), binding: ProdutosPorSegmentoBinding()),
    GetPage(name: Routes.PRODUTOS_NOMES, page: () => ProdutosNomes(), binding: ProdutosNomesBinding()),
    GetPage(name: Routes.TECNOLOGIA, page: () => TecnologiaList(), binding: TecnologiaBinding()),
    GetPage(name: Routes.PRODUTOINFO, page: () => ProdutoInfo(), binding: ProdutoInfoBinding()),
    GetPage(name: Routes.NORMAS, page: () => NormasList(), binding: NormasBinding()),
    GetPage(name: Routes.NORMASLISTNORMAS, page: () => ListNormas(), binding: NormasBinding()),
    GetPage(name: Routes.NORMASPRODUCTLISTNORMAS, page: () => ProductListNormas(), binding: NormasBinding()),
    GetPage(name: Routes.FISPQS_BTS, page: () => FispqsBts(), binding: FispqsBtsBinding()),
    GetPage(name: Routes.APLICACAO, page: () => AplicacaoList(), binding: AplicacaoBinding()),
  ];
}
