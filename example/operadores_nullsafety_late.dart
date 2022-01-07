late Teste teste;
void main() {

  try {
    teste.algo();
  } catch (e) {
    print(
        'ERROR - teste.algo(); usando keyrword late com o objeto não inicializado lançou exceção');
  }
}

class Teste {
  algo() {
    print('algo');
  }
}
