import 'package:flutter/material.dart';
import 'package:lab52/widgets/right_message.dart';
import 'left_message.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LeftMassage('Ассалам Алейкум'),
        LeftMassage('Как поживаешь?'),
        RightMassage('Вааалейкум Ассалам,все хорошо!'),
        RightMassage('Как сам?'),
        LeftMassage('Да все нормально,делаю проект на курсах'),
        RightMassage('Ооо,молодец,как успехи?'),
        LeftMassage('Почти закончил,рахмат'),
        LeftMassage('Сам что программируешь?'),
        RightMassage('Пока ничего,сам хочу на курсы пойти'),
        RightMassage('Ты какой язык изучаешь?'),
        LeftMassage('Изначально Dart, а сейчас FrameWork Flutter'),
        RightMassage('Интересная тема,слышал недавно.Нравится хоть?'),
        LeftMassage('Конечно,мощная тема. В Attractor давно хотел'),
        RightMassage('Да нуу,ты еще и туда пошел,красавчик)'),
        RightMassage('Тогда попозже тоже запишусь на ближайший курс'),
        LeftMassage('Давай-давай, скоро как раза Java и C# должны начатся'),
        RightMassage('Отлично тогда,как и планировал'),
        RightMassage('К концу месяца на Шарп запишусь тогда!'),
        LeftMassage('Договор,там и увидимся,родной'),
        LeftMassage('На связи'),
        RightMassage('Все-все,рахмат,на связи'),
        RightMassage('Успешно доделать все)'),
        LeftMassage('Спасибо,Арс,стараюсь'),
      ],
    );
  }
}
