program Exercicio_7;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

var
  A, B, C: double;
  intA, intB, intC: integer;
begin


  writeln('Insira tres valores inteiros seguidos:');
  readln(A, B, C);

  intA:= Trunc(A);
  intB:= Trunc(B);
  intC:= Trunc(C);

  writeln(Format('%0.f + %0.f + %0.f = %2.f', [A, B, C, (A + B + C)]));
  writeln(Format('%0.f - %0.f + %0.f = %2.f', [A, B, C, (A - B + C)]));
  writeln(Format('%0.f - (%f + %f) = %2.f', [A, B, C, (A - (B + C))]));
  writeln(Format('(%0.f * 2) + (%0.f - %0.f) = %2.f', [A, B, C, ((A * 2) + (B - C))]));
  writeln(Format('(%0.f * 4) + (%0.f / 2) - (%0.f + 8) = %2.f', [A, C, B, (A * 4) + (C / 2) - (B + 8)]));
  writeln(Format('%0.f + %0.f + %0.f = %2.f', [A, B, C, ((A / 2) + (B / 2) + C / 2)]));
  writeln(Format('%0.f² + %0.f² = %2.f', [A, B, (Sqr(A) + Sqr(B))]));
  writeln(Format('%0.f² + 3 * %0.f = %2.f', [C, B, (Sqr(C) + 3 * B)]));
  writeln(Format('%d MOD 2 = %d', [intA, (intA mod 2)]));
  writeln(Format('%d MOD 2 = %d', [intB, (intB mod 2)]));
  writeln(Format('%d MOD 2 = %d', [intC, (intC mod 2)]));

end.
