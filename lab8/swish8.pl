:- dynamic fact/2. 

rule(1,"растение","дерево",[1]).
rule(2,"растение","дерево",[2]).
rule(3,"растение","водоросли",[3]).
rule(4,"растение","водоросли",[4, 5]).
rule(5,"дерево","хвойное дерево",[6]).
rule(6,"дерево","хвойное дерево",[7, 8, 9]).
rule(7,"дерево","лиственное дерево",[10]).
rule(8,"дерево","лиственное дерево",[11]).
rule(9,"хвойное дерево","кедр",[22, 12, 13]).
rule(10,"хвойное дерево","ель",[14, 12, 13]).
rule(11,"лиственное дерево","береза",[15, 16, 12]).
rule(12,"лиственное дерево","дуб",[17, 13]).
rule(13,"водоросли","ламинария",[18, 19]).
rule(14,"водоросли","родимения",[18, 20]).
rule(15,"водоросли","цианобоактерии",[21]).

ask(1):- write("у него очень твёрдое основание?"), !, complete(1).
ask(2):- write("его можно использовать как строительный материал?"), !, complete(2).
ask(3):- write("это низшие растение?"), !, complete(3).
ask(4):- write("оно находится на воде?"), !, complete(4).
ask(5):- write("оно не вырастает выше 3 метров?"), !, complete(5).
ask(6):- write("у него острая хвоя?"), !, complete(6).
ask(7):- write("его семена содержатся в шишках?"), !, complete(7).
ask(8):- write("оно зеленые даже зимой?"), !, complete(8).
ask(9):- write("оно растет в самых северных районах тайги?"), !, complete(9).
ask(10):- write("оно имеет листья?"), !, complete(10).
ask(11):- write("его листья опадают осенью?"), !, complete(11).
ask(12):- write("оно широко распространено в Сибири?"), !, complete(12).
ask(13):- write("у него тёмный цвет коры?"), !, complete(13).
ask(14):- write("у него короткая и острая хвоя?"), !, complete(14).
ask(15):- write("его ствол белый с черными пятнами?"), !, complete(15).
ask(16):- write("у него весной вырастаю липкие почки?"), !, complete(16).
ask(17):- write("у него есть жёлуди?"), !, complete(17).
ask(18):- write("растение растёт в море?"), !, complete(18).
ask(19):- write("растение съедобное?"), !, complete(19).
ask(20):- write("растение красное?"), !, complete(20).
ask(21):- write("растение очень ядовитое?"), !, complete(21).
ask(22):- write("орехи его шишек употребляют в пищу?"), !, complete(22).
ask(X):- fact(X, 1),!.
ask(X):- fact(X, 0),!,fail.

recognition(X):- rule(N, X, Y, Z), discover(Z), !,
	write("ОТВЕТ: это "), write(X), write(" — "), write(Y), write(" согласно правилу "), write(N), nl,
	recognition(Y).
recognition("растение"):- write("ЭТО РАСТЕНИЕ МНЕ НЕИЗВЕСТНО"),!.
recognition("дерево"):- write("ЭТО РАСТЕНИЕ МНЕ НЕИЗВЕСТНО"),!.
recognition("водоросли"):- write("ЭТО РАСТЕНИЕ МНЕ НЕИЗВЕСТНО"),!.
recognition("хвойное дерево"):- write("ЭТО РАСТЕНИЕ МНЕ НЕИЗВЕСТНО"),!.
recognition("лиственное дерево"):- write("ЭТО РАСТЕНИЕ МНЕ НЕИЗВЕСТНО"),!.
recognition(_).

discover([]).
discover([X|Y]):- ask(X), discover(Y).

complete(X):- nl, read(Y), assert(fact(X, Y)), Y=1.