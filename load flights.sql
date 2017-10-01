create user if not exists 'guest_user'@'localhost' identified by 'datascience';
grant select on *.* to 'guest_user'@'localhost';
create schema if not exists airports;
use airports;

drop table if exists flights;

create table flights(
	airline char(50),
    status char(20),
    los_angeles int,
    phoenix int,
    san_diego int,
    san_francisco int,
    seattle int
    )
;
insert into flights(
	airline,
    status,
    los_angeles,
    phoenix,
    san_diego,
    san_francisco,
    seattle
    )
    values
		('Alaska', 'on time', 497, 221, 212, 503, 1841),
        ('', 'delayed', 62, 12, 20, 102, 305),
       ('AM West', 'on time', 694, 4840, 383, 320, 201),
		('', 'delayed', 117, 415, 65, 129, 61)
;
    