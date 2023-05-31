Criar uma nova execução(Scheme)

---

Project > Runner > Info  
Duplique o Debug com o nome da flavor

---

Edite o Scheme gerado  
Onde for `Run`, `Test`, `Analyze`, coloque a nova execução(Debug-daniel)

---

Targets > Runner > Build Settings > Packaging > Product Bundle Identifier  
Onde for a sua flavor, altere o nome do package  

---

Targets > Runner > Build Settings > Add > Add User-Defined Settings   
Crie uma variavel com o nome que quiser e onde for a flavor, coloque o nome que deseja
  
---

Project Navigator/Arquivos > Info(Info.plist) > Bundle display name  
Coloque o nome da variavel criada anteriormente = $(<NOME_DA_VARIAVEL>)

---

Coloque e configure o package `flutter_launcher_icons`  
https://pub.dev/packages/flutter_launcher_icons

---

Rode o package `flutter_launcher_icons`  
`flutter pub run flutter_launcher_icons`

---

Voltando o XCode  
Targets > Runner > Build Settings > Asset Catalog Compiler - Options > Primary App Icon Set Name  
Altere e coloque o nome do arquivo  
Dica: Se voce entrar no Assets que fica nos arquivos, ele mostra o nome do "Asset"

---

Targets > Runner > Build Settings > Add > Add User-Defined Settings  
Coloque o nome da variavel de `DART_DEFINES`  
Onde for a flavor, coloque os valores  

---

Obs.: Ele tem que estar em Base64 e em caso de multiplos `defines`, separe por virgula.  
Ex.: `<firstBase64>,<secondBase64>`  

Obs.: Pode ser preciso rodar o `pod install` dentro da pasta `ios` caso ele não ache algo dentro de `Target Support Files`
