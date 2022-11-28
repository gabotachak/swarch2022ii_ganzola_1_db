DROP SCHEMA IF EXISTS swarch2022ii_1_db;
CREATE SCHEMA swarch2022ii_1_db;
USE swarch2022ii_1_db;

CREATE TABLE IF NOT EXISTS `user`
(
    `id_user`    INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(45)  NULL,
    `last_name`  VARCHAR(45)  NULL,
    `username`   VARCHAR(20)  NOT NULL,
    PRIMARY KEY (`id_user`),
    UNIQUE INDEX `id_user_UNIQUE` (`id_user` ASC) VISIBLE,
    UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE
);

CREATE TABLE IF NOT EXISTS `transaction`
(
    `id_transaction`   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `sender`           INT UNSIGNED NOT NULL,
    `receiver`         INT UNSIGNED NOT NULL,
    `transaction_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id_transaction`),
    UNIQUE INDEX `id_transaction_UNIQUE` (`id_transaction` ASC) VISIBLE,
    INDEX `fk_transaction_user_idx` (`sender` ASC) VISIBLE,
    INDEX `fk_transaction_user1_idx` (`receiver` ASC) VISIBLE,
    CONSTRAINT `fk_transaction_user`
        FOREIGN KEY (`sender`)
            REFERENCES `user` (`id_user`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_transaction_user1`
        FOREIGN KEY (`receiver`)
            REFERENCES `user` (`id_user`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);
