create user if not exists 'movie_guest'@'localhost' identified by 'datascience';
grant select on *.* to 'movie_guest'@'localhost';
create schema if not exists movies;
use movies;

drop table if exists movie_names;
drop table if exists users;
drop table if exists user_rating;

create table movie_names(
	id int auto_increment primary key,
    movie_name char(100)
    )
;
create table users(
	id int auto_increment primary key,
    user_name char(100)
    )
;
create table user_rating(
	user_id int,
    movie_id int,
    rating int,
    check(rating >= 1 and rating <= 5)
	)
;
	insert into movie_names(
		movie_name
        )
		values ('Wonder Woman'), ('The Wolf of Wall Street'), ('Cainso Royal'),
				('The Dark Knight'), ('Toy Story'), ('Superbad')
;
	insert into users(
		user_name
        )
		values ('Kristen B'), ('Nicole G'), ('Schaeffer C'), ('Maritta G'), ('Roger F'),
			('Andrew B')
;
    insert into user_rating(
		user_id,
        movie_id,
        rating
        )
        values
			
			(1, 1, 4),
            (1, 2, 5),
            (1, 3, 4),
            (1, 4, 4),
            (1, 5, 5),
            (1, 6, 2),
            (2, 1, 5),
            (2, 2, 3),
            (2, 3, 4),
            (2, 4, 4),
            (2, 5, 5),
            (2, 6, 5),
            (3, 1, 5),
            (3, 2, 5),
            (3, 3, 4),
            (3, 4, 4),
            (3, 5, 5),
            (3, 6, 3),
            (4, 1, 5),
            (4, 2, 4),
            (4, 3, 3),
            (4, 4, 5),
            (4, 5, 5),
            (4, 6, 3),
            (5, 1, 3),
            (5, 2, 4),
            (5, 3, 4),
            (5, 4, 5),
            (5, 5, 5),
            (5, 6, 4),
            (6, 1, 3),
            (6, 2, 4),
            (6, 3, 4),
            (6, 4, 4),
            (6, 5, 5),
            (6, 6, 3)
		
;
			