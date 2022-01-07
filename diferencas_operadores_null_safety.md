Desmostrando o que ocorre com cada operador [null-safety](https://dart.dev/null-safety) ```!``` e ```?``` ao acionar métodos na linguagem dart (usando [Dartpad](https://dartpad.dev/?)).

> Observe o [exemplo](https://github.com/ulisseshen/exemplos-dart-flutter/blob/main/example/operadores_nullsafety.dart) abaixo:

```dart
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
```
O resultador do print será

```
algo
ERROR - teste!.algo(); lançou exceção após teste ser null
OK OK - teste?.algo(); não lançou exceção após teste ser null
```

É interessante saber disso para evitar erros em tempo de execução.

Quando usamos  ```teste!.algo();``` presumimos que a váriavel foi inicializada e o seu valor agora é não nulo, mesmo que seu tipo aceite o tipo null ```Teste? teste;```
Você pode verificar a keyword ```late``` mas ela ainda presumi que a inicialização do objeto aconteça em tempo de execução. 
> Veja o [código](https://github.com/ulisseshen/exemplos-dart-flutter/blob/main/example/operadores_nullsafety_late.dart) abaixo:

```dart
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

```
O resultado do print será: 
```
ERROR - teste.algo(); usando keyrword late com o objeto não inicializado lançou exceção
```
Mostrando assim que seu sistema pode sair do fluxo de operação caso a utilização dos operadores do null-safety sejam mau utilizados, principalmente em projetos que estão migrando para se adequar ao novo padrão da linguagém.

Espero que tenha ajudado. Essa foi a intenção.
