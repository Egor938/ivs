exam(1, "Предмет1","Преподаватель1",203,  10).
exam(1, "ПРедмет2","Преподаватель2",201,  11).
exam(1, "Предмет3","Преподаватель3",257,  23).
exam(2, "Предмет4","Преподаватель4",353,  10).
exam(1, "Предмет5","Преподаватель5",529,  15).
exam(2, "Предмет5","Преподаватель5",529,  15).
exam(3, "Предмет6","Преподаватель6",105,  20).
exam(3, "Предмет7","Преподаватель7",205,  11).
exam(2, "Предмет7","Преподаватель7",205,  11).
exam(1, "Предмет8","Преподаватель1",203,  18).
exam(1, "Предмет9","Преподаватель2",257,  12).
exam(3, "Предмет10","Преподаватель8",105,  15).
exam(2, "Предмет11","Преподаватель9",505,  10).
exam(3, "Предмет12","Преподаватель10",311,  12).
exam(1, "Предмет12","Преподаватель10",311,  13).
exam(3, "Предмет13","Преподаватель11",203,  17).
exam(2, "Предмет14","Преподаватель12",301,  16).
exam(3, "Предмет15","Преподаватель13",405,  21).
exam(2, "ПРедмет2","Преподаватель2",201,  12).
exam(3, "ПРедмет2","Преподаватель2",201,  13).
exam(3, "Предмет16","Преподаватель14",301,  19).

query(1) :-
    !,
    writeln("Номер группы?"),
    read(Group),
    writeln("Название экзамена?"),
    read(Discipline),
    exam(Group, Discipline, _, Room, Day),
    writeln("День, когда будет экзамен:"),
    writeln(Day), 
    writeln("Аудитория, где будет экзамен:"),
    write(Room).

query(2) :-
    !,
    writeln("Фамилия преподавателя?"),
    read(Teacher),
    findall(Group, exam(Group, _, Teacher, _, _), GroupsList),
    list_to_set(GroupsList, GroupsSet),
    writeln("Преподает у групп:"),
    write(GroupsSet).

query(3) :-
    !,
    writeln("Фамилия преподавателя?"),
    read(Teacher),
    findall(Discipline, exam(_, Discipline, Teacher, _, _), DisciplinesList),
    list_to_set(DisciplinesList, DisciplinesSet),
    writeln("Проводит экзамены:"),
    write(DisciplinesSet).

query(4) :-
    !,
    writeln("Номер группы?"),
    read(Group),
    findall(Discipline, exam(Group, Discipline, _, _, _), DisciplinesList),
    list_to_set(DisciplinesList, DisciplinesSet),
    writeln("Экзамены у группы:"),
    write(DisciplinesSet).

query(5) :-
    !,
    writeln("Номер группы?"),
    read(Group),
    findall(Teacher, exam(Group, _, Teacher, _, _), TeachersList),
    list_to_set(TeachersList, TeachersSet),
    writeln("Преподаватели у группы:"),
    write(TeachersSet).

main :-
    writeln("Введите номер операции:"), 
    writeln("[1] В какой аудитории и в какой день будет экзамен у группы?"),
    writeln("[2] Каким группам преподает преподаватель?"),
    writeln("[3] Какие экзамены проводит преподаватель?"),
    writeln("[4] Какие экзамены есть у группы?"),
    writeln("[5] Какие преподаватели есть у группы?"),
    read(QueryId),
    query(QueryId), nl, nl,
    main.

foreach(206).
foreach(N) :- findall(Disc, exam(_, Disc, _, N, _), Discs), 
    write(Discs), write(' в '), write(N), write(' аудитории'), nl, N1 is N + 1, foreach(N1).