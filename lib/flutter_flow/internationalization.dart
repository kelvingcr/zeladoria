import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'j3qetmb9': {
      'pt': 'Esse é o menu do painel adminstrativo.',
      'en': '',
    },
    'crlja2z6': {
      'pt': 'Relatorios',
      'en': '',
    },
    'nmunqtx1': {
      'pt': 'Funcionarios',
      'en': '',
    },
    '2zm7fnd5': {
      'pt': 'Ambientes',
      'en': '',
    },
    'wc3cj35v': {
      'pt': 'Rastreadores',
      'en': '',
    },
    '72q4ttc3': {
      'pt': 'Perfil',
      'en': '',
    },
    's0vh0pyx': {
      'pt': 'Perfil da Empresa',
      'en': '',
    },
    'd1r88f1i': {
      'pt': 'Configurações',
      'en': '',
    },
    'aeilbm61': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // Onboarding1
  {
    'huxl7hc0': {
      'pt': 'Bem vindo(a)!',
      'en': 'Welcome!',
    },
    '04oxsli0': {
      'pt':
          'Bem-vindo ao aplicativo líder para a gestão do seu prédio ou condomínio.',
      'en':
          'Welcome to the leading application for managing your building or condominium.',
    },
    'ho2enpgz': {
      'pt': 'INICIAR',
      'en': 'GET STARTED',
    },
    'cy6b1swf': {
      'pt': 'MINHA CONTA',
      'en': 'MY ACCOUNT',
    },
    'dys1lott': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // LoginPage
  {
    'wmrfngoi': {
      'pt': 'Zeladoria App',
      'en': 'brand.ai',
    },
    'enh8h14y': {
      'pt': 'Seja bem vindo!',
      'en': 'Welcome!',
    },
    'jmb0pxh8': {
      'pt': 'Preencha os dados abaixo para acessar sua conta.',
      'en': 'Fill in the details below to access your account.',
    },
    'ajl6wc0v': {
      'pt': 'Email',
      'en': 'Email',
    },
    'hwrcvizt': {
      'pt': 'Senha',
      'en': 'Password',
    },
    'mamxjy8b': {
      'pt': 'ENTRAR',
      'en': 'SIGN IN',
    },
    'gu759ofw': {
      'pt': 'Ou registra-se gratuitamente',
      'en': 'Or register for free',
    },
    'qg6cutif': {
      'pt': 'REGISTRAR-SE',
      'en': 'REGISTER',
    },
    '4r326p36': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // RegisterPage
  {
    'e304xnzm': {
      'pt': 'Zeladoria App',
      'en': 'brand.ai',
    },
    '15hgms0m': {
      'pt': 'Seja bem vindo!',
      'en': 'Welcome!',
    },
    '2rpc5no9': {
      'pt': 'Preencha os dados abaixo para criar sua conta.',
      'en': 'Fill in the details below to access your account.',
    },
    'x11medkj': {
      'pt': 'Email',
      'en': 'Email',
    },
    'h395im6t': {
      'pt': 'Senha',
      'en': 'Password',
    },
    't6xjwk3o': {
      'pt': 'Confirme sua senha',
      'en': 'Confirm your password',
    },
    'gogujnb4': {
      'pt': 'Campo obrigatório',
      'en': 'Required field',
    },
    '55smo793': {
      'pt': 'E-mail está incorreto.',
      'en': '',
    },
    '2zy85kjb': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'xh2cfuki': {
      'pt': 'Campo obrigatório',
      'en': '',
    },
    'wibtfffg': {
      'pt': 'Mínimo oito caracteres\nPelo menos uma letra e um número.',
      'en': '',
    },
    '7mssp576': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'kv529dh3': {
      'pt': 'Campo obrigatório',
      'en': '',
    },
    'wn2idevv': {
      'pt': 'Mínimo oito caracteres\nPelo menos uma letra e um número.',
      'en': '',
    },
    'ywjiklyb': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'wawr4zv2': {
      'pt': 'As senhas não são iguais.',
      'en': '',
    },
    'es718yrd': {
      'pt': 'Código da empresa',
      'en': 'Confirm your password',
    },
    '4kvandki': {
      'pt': 'Insira o código da empresa para entrar como funcionário.',
      'en': 'Enter your company code to sign in as an employee.',
    },
    'jxx4xdfi': {
      'pt': 'CADASTRAR',
      'en': 'SIGN IN',
    },
    'ze4mtdnf': {
      'pt': 'CADASTRAR',
      'en': 'SIGN IN',
    },
    'gko3fgw9': {
      'pt': 'VOLTAR',
      'en': 'BACK',
    },
    '7sgttrtq': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // SettingsPage
  {
    'vws5cp3d': {
      'pt': 'Suporte',
      'en': 'Support',
    },
    '01arn0s2': {
      'pt': 'Tutorial',
      'en': 'Tutorial',
    },
    'jei1j97j': {
      'pt': 'Reportar bugs',
      'en': 'Report bugs',
    },
    'oeq18x15': {
      'pt': 'Envie uma solicitação de recurso',
      'en': 'Submit a feature request',
    },
    'b00t3c0k': {
      'pt': 'Modo Claro',
      'en': 'Light',
    },
    '0sh40vo7': {
      'pt': 'Modo Escuro',
      'en': 'Dark',
    },
    '8pige558': {
      'pt': 'Configurações',
      'en': '',
    },
    '95e3ljdp': {
      'pt': '__',
      'en': '',
    },
  },
  // ProfileCompanyPage
  {
    'sp81t0zt': {
      'pt': 'Dados da empresa',
      'en': 'Support',
    },
    '62b5d2vq': {
      'pt': 'Nome da Empresa',
      'en': '',
    },
    'cyb52gbe': {
      'pt': 'CPNJ',
      'en': '',
    },
    'xhak04cz': {
      'pt': 'Data de registro',
      'en': '',
    },
    'k49kmctd': {
      'pt': 'Usúario administrador',
      'en': 'Support',
    },
    'd0srfz9z': {
      'pt': 'QRCode',
      'en': '',
    },
    'zabzf90b': {
      'pt': 'Perfil da Empresa',
      'en': 'Company Profile',
    },
    '7o3x08d1': {
      'pt': 'Home',
      'en': '',
    },
  },
  // CompleteYourProfilePage
  {
    'om6mb452': {
      'pt': 'Complete seu Perfil',
      'en': '',
    },
    'v6fqs9a8': {
      'pt': 'Primeiro Nome',
      'en': 'First Name',
    },
    'zi5xm40m': {
      'pt': 'Sobrenome',
      'en': 'Last Name',
    },
    'yhsz9pn8': {
      'pt': 'E-mail',
      'en': '',
    },
    'jcmw7sbp': {
      'pt': 'DDD',
      'en': '',
    },
    'p8gojllz': {
      'pt': 'Telefone',
      'en': '',
    },
    'hvozk32t': {
      'pt': 'CPF',
      'en': '',
    },
    'w8gr7n1f': {
      'pt': 'Campo obrigátorio',
      'en': 'Field is required',
    },
    'kox6mzgi': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'wgcvomei': {
      'pt': 'Campo obrigátorio',
      'en': 'Required field',
    },
    'azzh38zy': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'zd8ciqaz': {
      'pt': 'Campo obrigátorio',
      'en': 'Field is required',
    },
    'qcccbgeh': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    '8uhyqm4r': {
      'pt': 'Field is requiredCampo obrigátorio',
      'en': '',
    },
    'qqsnxad8': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'yujgf90a': {
      'pt': 'Field is required',
      'en': '',
    },
    'ypllgvoa': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'k5y4ajzf': {
      'pt': 'Field is required',
      'en': 'Required field',
    },
    '8ulcjhxs': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    '0b7oyoz8': {
      'pt': 'Home',
      'en': '',
    },
  },
  // CompleteCompanyProfilePage
  {
    'jaqgqfgw': {
      'pt': 'Perfil da Empresa',
      'en': '',
    },
    '3mse967o': {
      'pt': 'Nome da Empresa',
      'en': 'Company Name',
    },
    'ybv1sjcc': {
      'pt': 'CNPJ',
      'en': '',
    },
    't6o3l1eh': {
      'pt': 'Campo obrigatório',
      'en': 'Field is required',
    },
    'b4p9x2k9': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ozov39d4': {
      'pt': 'Campo Obrigatório',
      'en': 'Field is required',
    },
    'fqiq8ibx': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    '1rvxamyg': {
      'pt': 'SALVAR',
      'en': '',
    },
    'fxxw7kco': {
      'pt': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '44eullt5': {
      'pt': '',
      'en': '',
    },
    '82iwpslo': {
      'pt': '',
      'en': '',
    },
    'ov81ffme': {
      'pt': '',
      'en': '',
    },
    '3e197icy': {
      'pt': '',
      'en': '',
    },
    'roye632p': {
      'pt': '',
      'en': '',
    },
    '8qsi86gq': {
      'pt': '',
      'en': '',
    },
    'mbczsfd7': {
      'pt': '',
      'en': '',
    },
    'i7ldf8au': {
      'pt': '',
      'en': '',
    },
    'ppjb9y6f': {
      'pt': '',
      'en': '',
    },
    'dv1xfi23': {
      'pt': '',
      'en': '',
    },
    'zhm9le35': {
      'pt': '',
      'en': '',
    },
    'dcanytq4': {
      'pt': '',
      'en': '',
    },
    '17j05f1n': {
      'pt': '',
      'en': '',
    },
    '3glx4n22': {
      'pt': '',
      'en': '',
    },
    'vorn20ys': {
      'pt': '',
      'en': '',
    },
    '3u9vbjca': {
      'pt': '',
      'en': '',
    },
    'v18nyow6': {
      'pt': '',
      'en': '',
    },
    'm4uzk84r': {
      'pt': '',
      'en': '',
    },
    '1mbs0haz': {
      'pt': '',
      'en': '',
    },
    'kvcycemw': {
      'pt': '',
      'en': '',
    },
    '7hbp0bn5': {
      'pt': '',
      'en': '',
    },
    'k4ouvjau': {
      'pt': '',
      'en': '',
    },
    'eq8hdzlz': {
      'pt': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
