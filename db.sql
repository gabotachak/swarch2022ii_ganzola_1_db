DROP SCHEMA IF EXISTS swarch2022ii_1_db;
CREATE SCHEMA swarch2022ii_1_db;
USE swarch2022ii_1_db;

create table user
(
    id_user    int unsigned auto_increment
        primary key,
    first_name varchar(45) null,
    last_name  varchar(45) null,
    username   varchar(20) not null,
    constraint id_user_UNIQUE
        unique (id_user),
    constraint username_UNIQUE
        unique (username)
);

create table transaction
(
    id_transaction   int unsigned auto_increment
        primary key,
    sender           int unsigned                       null,
    receiver         int unsigned                       null,
    amount           decimal(15, 2) unsigned            null,
    transaction_time datetime default CURRENT_TIMESTAMP not null,
    constraint id_transaction_UNIQUE
        unique (id_transaction),
    constraint fk_transaction_user
        foreign key (sender) references user (id_user),
    constraint fk_transaction_user1
        foreign key (receiver) references user (id_user)
);

create index fk_transaction_user1_idx
    on transaction (receiver);

create index fk_transaction_user_idx
    on transaction (sender);

insert into user VALUES (1, 'John', 'Doe', 'userone');
insert into user VALUES (2, 'Jane', 'Smith', 'usertwo');

insert into transaction VALUES (1, null, 1, 100000.00, '2022-01-01 00:00:00');
insert into transaction VALUES (2, null, 2, 100000.00, '2022-01-01 00:00:00');
