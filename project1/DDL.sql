create
	table
		PRJ1_USERS(USER_ID serial primary key,
		UNAME varchar(100) not null,
		FNAME varchar(100) not null,
		LNAME varchar(100) not null,
		PASWD varchar(100) not null,
		DATE_OF_BIRTH date not null);

select
	*
from
	prj1_users;

create
	table
		PRJ1_BOOKS(ISBN_NO serial primary key,
		TITLE varchar(100) not null,
		AUTHOR varchar(100) not null,
		PUBLICATION_YEAR integer not null);

select
	*
from
	PRJ1_BOOKS;

create
	table
		PRJ1_SESSIONS(SESSION_ID serial primary key,
		USER_ID integer references PRJ1_USERS(USER_ID) not null,
		LOGIN_TIME timestamp not null,
		LOGOUT_TIME timestamp not null);

select
	*
from
	PRJ1_SESSIONS;

create
	table
		PRJ1_REVIEWS(REVIEW_ID serial primary key,
		USER_ID integer references PRJ1_USERS(USER_ID) not null,
		ISBN_NO integer references PRJ1_BOOKS(ISBN_NO) not null,
		LOGOUT_TIME timestamp not null);
