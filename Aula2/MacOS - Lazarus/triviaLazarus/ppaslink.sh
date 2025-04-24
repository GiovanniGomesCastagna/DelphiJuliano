#!/bin/sh
DoExitAsm ()
{ echo "An error occurred while assembling $1"; exit 1; }
DoExitLink ()
{ echo "An error occurred while linking $1"; exit 1; }
OFS=$IFS
IFS="
"
/Library/Developer/CommandLineTools/usr/bin/ld     -framework Cocoa -weak_framework UserNotifications      -order_file '/Users/giovannigomescastagna/Documents/Linguagem de Programação I/DelphiJuliano/DelphiJuliano/Aula2/MacOS - Lazarus/triviaLazarus/symbol_order.fpc' -multiply_defined suppress -L. -o '/Users/giovannigomescastagna/Documents/Linguagem de Programação I/DelphiJuliano/DelphiJuliano/Aula2/MacOS - Lazarus/triviaLazarus/projectTRIVIA' `cat '/Users/giovannigomescastagna/Documents/Linguagem de Programação I/DelphiJuliano/DelphiJuliano/Aula2/MacOS - Lazarus/triviaLazarus/link5454.res'` -filelist '/Users/giovannigomescastagna/Documents/Linguagem de Programação I/DelphiJuliano/DelphiJuliano/Aula2/MacOS - Lazarus/triviaLazarus/linkfiles5454.res'
if [ $? != 0 ]; then DoExitLink ; fi
IFS=$OFS
