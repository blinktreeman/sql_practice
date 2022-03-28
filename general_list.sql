use gbsqlpractice;
create table genlist (
	genlist_id			int primary key not null auto_increment,
    genlist_full_name	varchar(100),
    genlist_birth_date	date,
    genlist_status		bool,
    genlist_phone		int,
    genlist_comment		varchar(100),
    genlist_address		varchar(100),
    genlist_group		varchar(100)
);
insert gbsqlpractice.genlist (
	genlist_full_name,
    genlist_birth_date,
    genlist_status,
    genlist_phone,
    genlist_comment,
    genlist_address,
    genlist_group
)
values
('Иванов И. И.', 19900212, true, 126, 'интернет', 'Можга', 'Работа'),
('Иванов И. И.', 19900212, true, 127, 'старый', 'Можга', 'Работа'),
('Иванов И. И.', 20010918, false, 527, 'личный', 'Санкт-Петербург', 'Школа'),
('Петров П. П.', 19830423, true, 234, 'личный', 'Москва', 'Родня'),
('Петров П. П.', 19830424, true, 235, 'рабочий', 'Москва', 'Родня'),
('Васильев В. В.', 19980521, false, 456, 'личный', 'Белгород', 'Друзья'),
('Сидоров С.С.', 20070713, false, 643, 'личный', 'Киров', 'Родня'),
('Сидоров С.С.', 20070713, false, 654, 'старый', 'Киров', 'Родня'),
('Александров А.А.', 19870305, true, 412, 'рабочий', 'Уфа', 'Друзья'),
('Борисов Б.Б.', 19890816, false, 723, 'рабочий', 'Москва', 'Работа'),
('Михайлов М.М.', 19970108, true, 876, 'личный', 'Сочи', 'Университет'),
('Михайлов М.М.', 19970108, true, 875, 'рабочий', 'Сочи', 'Университет'),
('Кириллов К.К.', 19961203, false, 933, 'личный', 'Киров', 'Работа');

-- Задания
-- 1. SELECT ФИО, Тел, Комментарий FROM Общий список
select genlist_full_name, genlist_phone, genlist_comment from gbsqlpractice.genlist;
-- 2. SELECT ФИО, Д/р, Адрес FROM Общий список
select genlist_full_name, genlist_birth_date, genlist_address from gbsqlpractice.genlist;
-- 3. SELECT ФИО, Тел, Комментарий FROM Общий список WHERE Группа = «Родня»
select genlist_full_name, genlist_phone, genlist_comment from gbsqlpractice.genlist where genlist_group = 'Родня';
-- 4. SELECT ФИО, Статус FROM Общий список WHERE Адрес = «Можга»
select genlist_full_name, genlist_status from gbsqlpractice.genlist where genlist_address = 'Можга';
-- 5. SELECT Тел FROM Общий список WHERE Группа = «Друзья» AND Статус = «холост»
select genlist_phone from gbsqlpractice.genlist where genlist_group = 'Друзья' and genlist_status = false;
-- 6. SELECT ФИО FROM Общий список WHERE Адрес = «Москва» AND Группа = «Работа»
select genlist_full_name from gbsqlpractice.genlist where genlist_address = 'Москва' and genlist_group = 'Работа';
-- 7. SELECT Д/р FROM Общий список WHERE Группа = «Университет» OR Статус = «холост»
select genlist_birth_date from gbsqlpractice.genlist where genlist_group = 'Университет' or genlist_status = false;
-- 8. SELECT Д/р FROM Общий список WHERE Адрес = «Москва» OR Группа = «Работа»
select genlist_birth_date from gbsqlpractice.genlist where genlist_address = 'Москва' or genlist_group = 'Работа';
