void main() {
  Teste? teste;

  teste = Teste();
  teste.algo();
  teste = null;
  try {
    teste!.algo();
    print('OK OK - teste!.algo(); não lançou exceção após Teste ser null');
  } catch (e) {
    print('ERROR - teste!.algo(); lançou exceção após Teste ser null');
  }

  try {
    teste?.algo();
    print('OK OK - teste?.algo(); não lançou exceção após Teste ser null');
  } catch (e) {
    print('ERROR - teste?.algo(); lançou exceção após Teste ser null');
  }
}

class Teste {
  algo() {
    print('algo');
  }
}
