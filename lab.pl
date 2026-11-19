mesto(0).
mesto(1).
mesto(2).
mesto(3).

tema(flora).
tema(sport).
tema(kosmos).

sleva(1, 0).
sleva(2, 1).
sleva(3, 2).
sleva(0, 3).

naprotiv(0, 2).
naprotiv(2, 0).
naprotiv(1, 3).
naprotiv(3, 1).

reshenie(SV, SNi, SNa, SNu, TNi, TNa, TNu) :-
    mesto(SV), mesto(SNi), mesto(SNa), mesto(SNu),
    SV \= SNi, SV \= SNa, SV \= SNu,
    SNi \= SNa, SNi \= SNu, SNa \= SNu,
    tema(TNi), tema(TNa), tema(TNu),
    TNi \= TNa, TNi \= TNu, TNa \= TNu,
    sleva(SV, SNa),
    naprotiv(SNu, SNa),
    TNu \= sport,
    ( TNa = kosmos, sleva(SNa, SNi)
    ; TNu = kosmos, sleva(SNu, SNi)
    ).

pokaz(Imya, Mesto, Tema) :-
    write(Imya), write(': тема - '), write(Tema),
    write(', место '), write(Mesto), nl.

start :-
    reshenie(SV, SNi, SNa, SNu, TNi, TNa, TNu),
    nl,
    pokaz('Серый Волк', SV, fauna),
    pokaz('Ниф-Ниф', SNi, TNi),
    pokaz('Наф-Наф', SNa, TNa),
    pokaz('Нуф-Нуф', SNu, TNu),
    nl.