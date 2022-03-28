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
	addresses_id			int not null primary key,
    addresses_person_id		int,
    addresses_address		varchar(100),
    addresses_comment		varchar(100),
    foreign key (addresses_person_id) references gbsqlpractice.persons (persons_id) on delete set null
);
  
create table gbsqlpractice.phones (
	phones_id			int not null primary key,
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
(25, 'Кузьмин К.К.', 20200521, false, 'no comment');

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