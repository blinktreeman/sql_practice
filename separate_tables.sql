-- Create new schema 
create schema gbsqlpractice;

-- Create tables 
create table gbsqlpractice.persons (
	persons_id 			int not null primary key,
    person_full_name	varchar(100),
    person_birth_date	date,
    person_status		bool,
    person_comment		varchar(100)
);

create table gbsqlpractice.addresses (
	addresses_id			int not null primary key auto_increment,
    addresses_person_id		int,
    addresses_address		varchar(100),
    addresses_comment		varchar(100),
    foreign key (addresses_person_id) references gbsqlpractice.persons (persons_id) on delete set null
);
  
create table gbsqlpractice.phones (
	phones_id			int not null primary key auto_increment,
    phones_person_id	int,
    phones_phone		int,
    phones_comment		varchar(100),
    foreign key (phones_person_id) references gbsqlpractice.persons (persons_id) on delete set null
);

-- Insert data
insert gbsqlpractice.persons (
	persons_id,
    person_full_name,
    person_birth_date,
    person_status,
    person_comment
)
values
(1, 'Иванов И.И', 19900212, true, 'no comment'),
(2, 'Иванов И.И', 20010918, false, 'no comment'),
(3, 'Петров П.П.', 19830423, true, 'no comment'),
(4, 'Васильев В.В.', 19980521, false, 'no comment'),
(5, null, null, null, null),
(6, null, null, null, null),
(7, null, null, null, null),
(8, null, null, null, null),
(9, null, null, null, null),
(10, null, null, null, null),
(11, null, null, null, null),
(12, null, null, null, null),
(13, null, null, null, null),
(14, null, null, null, null),
(15, null, null, null, null),
(16, 'Кузьмин К.К.', 20200521, false, 'no comment');

insert gbsqlpractice.addresses (
    addresses_person_id,
    addresses_address,
    addresses_comment
)
values
(1, 'Можга', 'Место рождения'),
(1, 'Казань', 'По прописке'),
(1, 'Москва', 'Рабочий'),
(2, 'Санкт-Петербург', 'По прописке'),
(3, 'Москва', 'По прописке'),
(4, 'Белгород', 'По прописке'),    
(5, 'Уфа', 'По прописке'),
(6, 'Сочи', 'По прописке'),
(7, 'Киров', 'Рабочий'),
(8, 'Владивосток', 'Место рождения'),
(9, 'Рязань', 'Рабочий'),
(10, 'Хабаровск', 'Место рождения');

insert gbsqlpractice.phones (
    phones_person_id,
    phones_phone,
    phones_comment
)
values
(1, 123, 'личный'),
(1, 124, 'рабочий'),
(1, 125, 'для поездок'),
(1, 126, 'интернет'),
(1, 127, 'старый'),
(2, 527, 'личный'),
(3, 234, 'личный'),
(3, 235, 'рабочий'),
(4, 456, 'личный'),
(11, 999, 'личный'),
(12, 997, 'рабочий'),
(13, 995, 'личный'),
(14, 993, 'для поездок'),
(15, 991, 'для поездок');

-- Задания
-- 1. INNER JOIN Люди, Телефоны ON id = Чей телефон
select * from gbsqlpractice.persons inner join gbsqlpractice.phones on phones_person_id = persons_id;
-- 2. INNER JOIN Люди, Адреса ON id = Чей адрес
select * from gbsqlpractice.persons inner join gbsqlpractice.addresses on addresses_person_id = persons_id;
-- 3. LEFT JOIN Люди, Телефоны ON id = Чей телефон
select * from gbsqlpractice.persons left join gbsqlpractice.phones on phones_person_id = persons_id;
-- 4. LEFT JOIN Люди, Адреса ON id = Чей адрес
select * from gbsqlpractice.persons left join gbsqlpractice.addresses on addresses_person_id = persons_id;
-- 5. RIGHT JOIN Люди, Телефоны ON id = Чей телефон
select * from gbsqlpractice.persons right join gbsqlpractice.phones on phones_person_id = persons_id;
-- 6. RIGHT JOIN Люди, Адреса ON id = Чей адрес
select * from gbsqlpractice.persons right join gbsqlpractice.addresses on addresses_person_id = persons_id;
-- 7. FULL JOIN Люди, Телефоны ON id = Чей телефон
select * from gbsqlpractice.persons full join gbsqlpractice.phones on phones_person_id = persons_id;
-- 8. FULL JOIN Люди, Адреса ON id = Чей адрес
select * from gbsqlpractice.persons full join gbsqlpractice.addresses on addresses_person_id = persons_id;

-- Задания со звездочкой (объединяем обе темы). Что будет результатом выборки:
-- 1. SELECT ФИО, Тел, Коммент FROM Люди LEFT JOIN Телефоны ON id = Чей телефон
select persons.person_full_name, phones.phones_phone, phones.phones_comment
	from gbsqlpractice.persons
    left join gbsqlpractice.phones
    on phones_person_id = persons_id;
-- 2. SELECT ФИО, Адрес, Комментарий FROM Люди RIGHT JOIN Адреса ON id = Чей Адрес
select persons.person_full_name, addresses.addresses_address, addresses.addresses_comment
	from gbsqlpractice.persons
    right join gbsqlpractice.addresses
    on addresses_person_id = persons_id;