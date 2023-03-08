import 'package:flutter/cupertino.dart';
import 'package:sudoku_example/app/store/platform_store.dart';
import 'package:sudoku_example/app/widgets/game_card_widget.dart';
import 'package:sudoku_example/app/widgets/statistic_item_widget.dart';
import 'package:sudoku_example/app/widgets/time_card_widget.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Estatísticas'),
        trailing: CupertinoButton(
          onPressed: platformStore.toggle,
          child: const Icon(CupertinoIcons.add),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatisticItemWidget(
                  title: 'Jogos',
                  body: Column(
                    children: const [
                      GameCardWidget(
                        icon: CupertinoIcons.table,
                        title: 'Jogos iniciados',
                        amount: '4',
                      ),
                      GameCardWidget(
                        icon: CupertinoIcons.star,
                        title: 'Jogos vencidos',
                        amount: '3',
                      ),
                      GameCardWidget(
                        icon: CupertinoIcons.flag,
                        title: 'Taxa de vitórias',
                        amount: '75%',
                      ),
                      GameCardWidget(
                        icon: CupertinoIcons.flag_slash,
                        title: 'Vitórias sem erros',
                        amount: '3',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                StatisticItemWidget(
                  title: 'Tempo',
                  body: Column(
                    children: const [
                      SizedBox(
                        width: double.infinity,
                        child: TimeCardWidget(
                          icon: CupertinoIcons.star,
                          title: 'Classificação',
                          description: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: 'Você é mais veloz do que '),
                                TextSpan(
                                  text: '72% ',
                                  style: TextStyle(
                                    color: CupertinoColors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(text: 'dos jogadores!'),
                              ],
                            ),
                            style: TextStyle(
                              color: Color(0xFF868c9b),
                              fontSize: 16,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                      GameCardWidget(
                        icon: CupertinoIcons.stopwatch,
                        title: 'Melhor tempo',
                        amount: '02:22',
                      ),
                      GameCardWidget(
                        icon: CupertinoIcons.timer,
                        title: 'Tempo médio',
                        amount: '03:55',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                StatisticItemWidget(
                  title: 'Pontuação',
                  body: Column(
                    children: const [
                      GameCardWidget(
                        icon: CupertinoIcons.star,
                        title: 'Maior pontuação',
                        amount: '8205',
                      ),
                      GameCardWidget(
                        icon: CupertinoIcons.star_lefthalf_fill,
                        title: 'Pontuação média',
                        amount: '7780',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                StatisticItemWidget(
                  title: 'Sequências',
                  body: Column(
                    children: const [
                      GameCardWidget(
                        icon: CupertinoIcons.arrow_right,
                        title: 'Sequência atual de vitórias',
                        amount: '3',
                      ),
                      GameCardWidget(
                        icon: CupertinoIcons.arrow_right_to_line,
                        title: 'Maior sequência de vitórias',
                        amount: '3',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CupertinoButton(
                    onPressed: () {},
                    child: const Text(
                      'Zerar estatísticas',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
