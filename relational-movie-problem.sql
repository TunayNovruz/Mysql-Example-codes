
-- Your code here!
CREATE TABLE movies ( movie_id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,name varchar(250) NOT NULL);
CREATE TABLE genres (genre_id int(11) not null auto_increment primary key, name varchar(250) not null);
CREATE TABLE relation (
                id int(11) nOT NULL AUTO_INCREMENT primary key ,
                movie_id int(11) not null ,FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
                genre_id int(11) not null ,foreign key (genre_id) references genres(genre_id)
            );

insert into movies (name) values("titanic"),("Whiplash"),("scario"),("split");
insert into genres (name) values("thriller"),("romance"),("comedy"),("drama");
insert into relation (movie_id,genre_id) values (1,2),(1,3),(1,4),(2,2),(2,4),(3,1),(4,1),(4,2);

select group_concat(r.genre_id) as gnrs , r.movie_id from relation r 
        JOIN movies m on m.movie_id = r.movie_id 
        JOIN genres g on g.genre_id = r.genre_id
        group by r.genre_id;
        
        select m.movie_id , m.name , group_concat(g.name) as gnrs  from relation r 
        JOIN movies m on m.movie_id = r.movie_id 
        JOIN genres g on g.genre_id = r.genre_id
        group by r.movie_id;
