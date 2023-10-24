#!/bin/bash
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 24);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=24;fi
 if [[ $aa -gt 24 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=24;fi
 if [[ $j1 -gt 24 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 24 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=38; a++ ))
  do
   echo -e "\e[${a};1H\e[47;30m│\e[0m                                                                                \e[47;30m│\e[0m"
  done
 echo -en "\e[1;1H\033[0m\033[47;30m┌────────────────────────────────────────────────────────────────────────────────┐\033[0m";
 echo -en "\e[3;3H\e[1m *** shc ***\e[0m";
 echo -en "\e[4;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[5;3H\e[2m Generic shell script compiler | Общий компилятор сценариев оболочки\e[0m";
 echo -en "\e[6;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[13;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[14;3H\e[36m OPTIONS\e[0m\e[2m                                                               Опции\e[0m";
 echo -en "\e[32;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[33;3H Сообщеня об ошибках:\e[36m https://github.com/neurobin/shc/issues\e[0m";
 echo -en "\e[34;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[36;1H\e[47;30m├\e[0m─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[39;1H\033[0m\033[47;30m└────────────────────────────────────────────────────────────────────────────────┘\033[0m";
}
  E0(){ echo -en "\e[7;3H Установка                                                          \e[32m INSTALL \e[0m";}
  E1(){ echo -en "\e[8;3H Kраткий обзор                                                     \e[32m SYNOPSIS \e[0m";}
  E2(){ echo -en "\e[9;3H Описание                                                       \e[32m DESCRIPTION \e[0m";}
  E3(){ echo -en "\e[10;3H Переменные среды                                     \e[32m ENVIRONMENT VARIABLES \e[0m";}
  E4(){ echo -en "\e[11;3H Ограничения                                                    \e[32m LIMITATIONS \e[0m";}
  E5(){ echo -en "\e[12;3H Авторы                                                             \e[32m AUTHORS \e[0m";}
  E6(){ echo -en "\e[15;3H Срок годности в dd/mm/yyyy format [none]                           \e[32m -e date \e[0m";}
  E7(){ echo -en "\e[16;3H Сообщение, которое отображающееся по истечении срока действия   \e[32m -m message \e[0m";}
  E8(){ echo -en "\e[17;3H Путь к файлу скрипта для компиляции                         \e[32m -f script_name \e[0m";}
  E9(){ echo -en "\e[18;3H Встроенный параметр для интерпретатора оболочки           \e[32m -i inline_option \e[0m";}
 E10(){ echo -en "\e[19;3H Команда eXec в формате printf                                   \e[32m -x command \e[0m";}
 E11(){ echo -en "\e[20;3H Последний вариант оболочки                                  \e[32m -l last_option \e[0m";}
 E12(){ echo -en "\e[21;3H Вывод в файл, указанный outfile                                 \e[32m -o outfile \e[0m";}
 E13(){ echo -en "\e[22;3H Создайте распространяемый двоичный файл                                 \e[32m -r \e[0m";}
 E14(){ echo -en "\e[23;3H Подробная компиляция                                                    \e[32m -v \e[0m";}
 E15(){ echo -en "\e[24;3H Включите setuid для вызываемых root-программ [OFF]                      \e[32m -S \e[0m";}
 E16(){ echo -en "\e[25;3H Включить вызовы отладки exec                                            \e[32m -D \e[0m";}
 E17(){ echo -en "\e[26;3H Сделайте двоичный файл неотслеживаемым                                  \e[32m -U \e[0m";}
 E18(){ echo -en "\e[27;3H Дополнительный флаг безопасности без требования root-доступа            \e[32m -H \e[0m";}
 E19(){ echo -en "\e[28;3H Display license and exit                                                \e[32m -C \e[0m";}
 E20(){ echo -en "\e[29;3H Display abstract and exit                                               \e[32m -A \e[0m";}
 E21(){ echo -en "\e[30;3H Компилировать для BusyBox                                               \e[32m -B \e[0m";}
 E22(){ echo -en "\e[31;3H Display help and exit                                                   \e[32m -h \e[0m";}
 E23(){ echo -en "\e[35;3H Grannik                                                                \e[34m Git \e[0m";}
 E24(){ echo -en "\e[37;3H                                                                       \e[34m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[47;30m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Установка:\e[32m sudo apt-get install shc\e[0m
 Также необходимо для работы. Для Ubuntu, вы можете установить компилятор gcc:
\e[32m sudo apt-get install build-essential\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[47;30m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m
 shc
 [-e date] [-m addr] [-i iopt] [-x cmnd] [-l lopt] [-o outfile] [-ABCDhUHvSr] -f
 script
\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[47;30m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 shc создает урезанную двоичную исполняемую версию сценария, указанного в
 командной строке с параметром -f.
 К двоичной версии по умолчанию будет добавлено расширение .x, если выходной файл
 не определен с помощью опции [-o outfile] и обычно будет немного больше по
 размеру, чем исходный код ascii.
 Сгенерированный исходный код C сохраняется в файле с расширением .x.c или в
 файле, указанном с помощью соответствующей опции.
 Если вы укажете дату истечения срока действия с опцией -e,
 скомпилированный двоичный файл откажется запускаться после указанной даты.
 Вместо этого появится сообщение «Пожалуйста, свяжитесь с вашим провайдером».
 Это сообщение можно изменить с помощью опции -m.
 Вы можете скомпилировать любой сценарий оболочки, но вам необходимо указать
 допустимые параметры -i, -x и -l.
 Скомпилированный двоичный файл по-прежнему будет зависеть от оболочки,
 указанной в первой строке кода оболочки (т. е. /bin/sh), поэтому shc не
 создает полностью независимые двоичные файлы.
 shc сам по себе не является компилятором, таким как cc, он скорее кодирует
 и шифрует сценарий оболочки и генерирует исходный код C с добавленной
 возможностью истечения срока действия.
 Затем он использует системный компилятор для компиляции обрезанного двоичного
 файла, который ведет себя точно так же, как исходный сценарий.
 После выполнения скомпилированный двоичный файл расшифрует и выполнит код
 с опцией оболочки -c.
 К сожалению, это не даст вам никакого прироста скорости, как это могла бы
 сделать настоящая программа на языке C.
 Основная цель shc — защитить ваши сценарии оболочки от изменения или проверки.
 Вы можете использовать его, если хотите распространять свои сценарии,
 но не хотите, чтобы их легко читали другие люди.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[47;30m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 CC : C compiler command [cc]

 CFLAGS : C compiler flags [none]

 LDFLAGS : Linker flags [none]
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[47;30m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Максимальный размер сценария, который может быть выполнен после компиляции,
 ограничен параметром конфигурации операционной системы _SC_ARG_MAX
 (см. sysconf(2))
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[47;30m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Francisco Rosales\e[36m frosal@fi.upm.es\e[0m
 intika           \e[36m intika@librefox.org\e[0m
 Md Jahidul Hamid \e[36m jahidulhamid@yahoo.com\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[47;30m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[47;30m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Сообщение, которое будет отображаться по истечении срока действия
 ['Пожалуйста, обратитесь к своему провайдеру']
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  8)D;echo -en "\e[47;30m"; (E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Предположим, у вас есть скрипт с именем myscript.sh, для компиляции.
 Используйте следующую команду:\e[32m shc -f myscript.sh\e[0m
 Это создаст файл myscript.sh.x - это и есть скомпилированный исполняемый файл.
 Теперь вы можете запустить скомпилированный файл:\e[32m ./myscript.sh.x\e[0m
 Учтите, что shc имеет свои ограничения, и в некоторых случаях скрипты могут
 не компилироваться должным образом из-за их сложности или использования особенных
 возможностей bash. Кроме того, имейте в виду, что скомпилированный исполняемый
 файл будет зависеть от архитектуры процессора и версии ядра Linux, на которых он
 был скомпилирован. Так что если вы планируете распространять исполняемый файл,
 учтите эти ограничения.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  9)D;echo -en "\e[47;30m"; (E9);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Встроенный параметр для интерпретатора оболочки, например: -e
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 10)D;echo -en "\e[47;30m";(E10);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Команда eXec в формате printf, например: exec(\\\\\'%s\\\\\',@ARGV)
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 11)D;echo -en "\e[47;30m";(E11);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Последний вариант оболочки, т.е.: --
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 12)D;echo -en "\e[47;30m";(E12);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Скомпилируйте скрипт, который можно будет запускать в других системах
 с включенной опцией трассировки (без флага -U):\e[32m shc -f myscript -o mybinary\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 13)D;echo -en "\e[47;30m";(E13);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Расслабьтесь, безопасность. Создайте распространяемый двоичный файл, который
 будет выполняться на разных системах под управлением одной и той же операционной
 системы. С помощью этой опции вы можете опубликовать свой двоичный файл,
 чтобы его могли использовать другие.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 14)D;echo -en "\e[47;30m";(E14);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 15)D;echo -en "\e[47;30m";(E15);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 16)D;echo -en "\e[47;30m";(E16);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 17)D;echo -en "\e[47;30m";(E17);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Сделайте двоичный файл неотслеживаемым
 (используя strace, ptrace, truss и т. д.).
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 18)D;echo -en "\e[47;30m";(E18);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Закалка. Дополнительный флаг безопасности без требования root-доступа,
 который защищает от дампа, внедрения кода:\e[32m cat /proc/pid/cmdline, ptrace\e[0m и т. д.
 Эта функция является экспериментальной и может работать не на всех системах.
 для этого требуются сценарии оболочки (sh) с любыми позиционными параметрами.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 19)D;echo -en "\e[47;30m";(E19);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 20)D;echo -en "\e[47;30m";(E20);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 21)D;echo -en "\e[47;30m";(E21);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 22)D;echo -en "\e[47;30m";(E22);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 23)D;echo -en "\e[47;30m";(E23);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 mShc Описание утилиты shc. Общий компилятор сценариев оболочки bash
 asciinema:\e[36m https://asciinema.org/a/Blhpx5vhIwoBQ8BeRADPsAfmf\e[0m
 codeberg:\e[36m https://codeberg.org/Grannik/mShc\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 24)D;echo -en "\e[47;30m";(E24);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;exit 0;fi;;
esac;C;done
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *** Commentary *** ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# - trap установка обработчика сигнала SIGINT для комбинации клавиш Ctrl+C
# ----------------------- Глобальные переменные --------------------------
# aa отслеживает, какой из шагов в первом меню в данный момент является активным, позволяя скрипту реагировать на ввод для изменения текущего активного шага.
# ab отслеживает, какой из шагов во вторм меню в данный момент является активным, позволяя скрипту реагировать на ввод для изменения текущего активного шага.
# ----------------------- Локальные  переменные --------------------------
# a переменная цикла рамки текста
# b это переменная, которая используются в циклах для итерации.
# c переменная используется для хранения символов, считанных с клавиатуры.
# d стрелка вверх.
# e стрелка вниз.
# f стрелка вправо
# g стрелка влево
# i обработчик курсора
# ----------------------- Локальные ветвящиеся переменные ----------------
# j1 j2 ... переменная служит для хранения индекса следующего  шага относительно текущего активного шага.
# k1 k2 ... переменная служит для хранения индекса предыдущего шага относительно текущего активного шага.
# l1 l2 проверяет условие, что значение переменной la не равно пробелу. Этот цикл будет выполняться, пока la не станет равным пробелу.
# ---------------------- Функции -----------------------------------------
# A() функция отвечает за последовательный вызов функций E0, E1, ..., E + 28 Количество вызовов функций зависит от значения 28
# B() функция предназначена для обработки ввода с клавиатуры, особенно при использовании ANSI escape-последовательностей, она может вернуть значения ca da enter
# C() функция в скрипте служит для обработки ввода пользователя и изменения текущего активного шага в меню.
# D() функция осуществляет действия, связанные с обработкой aa j1 k1 и выводом ANSI escape-последовательностей для управления отображением в терминале.
# TXa() функция создает варианнт текстового оформления a
# E0() - ...   начиная с E группа функций использует ANSI escape-последовательности для управления позицией курсора и установки цвета текста.
# E0() - E28() основная группа функций использует ANSI escape-последовательности для управления позицией курсора и установки цвета текста.
# F0() -  F9() дополнительная группа функций использует ANSI escape-последовательности для управления позицией курсора и установки цвета текста.
# INI Эта функция INI() выполняет инициализацию интерфейса. Ниже нельза переносить.
# WILa() функция первого основного цикла
# WILb() функция второго дополнительного цикла
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
