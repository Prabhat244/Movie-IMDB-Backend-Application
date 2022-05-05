-- Database: movies_db

-- Table structure for table actors
-----------------------------------------

CREATE TABLE actors (
  actor_id int NOT NULL,
  actor_name varchar(50) NOT NULL,
  biodata text,
  date_of_birth date DEFAULT NULL,
  gender varchar(7) DEFAULT NULL
) ;

INSERT INTO actors (actor_id, actor_name, biodata, date_of_birth, gender) VALUES
(1, 'actor1', 'actor1 biodata', '1990-01-01', 'male'),
(2, 'actor2', 'actor2 biodata', '1990-01-02', 'male'),
(3, 'actor3', 'actor3 biodata', '1990-01-03', 'male'),
(4, 'actor4', 'actor4 biodata', '1990-01-01', 'female'),
(5, 'actor5', 'actor5 biodata', '1990-01-05', 'female'),
(6, 'actor6', 'actor6 biodata', '1990-02-01', 'male'),
(7, 'actor7', 'actor7 biodata', '1990-03-01', 'female');


-- Table structure for table movieactors

CREATE TABLE movieactors (
  movie_id int NOT NULL,
  actor_id int NOT NULL
);

INSERT INTO movieactors (movie_id, actor_id) VALUES
(1, 1),
(1, 2),
(1, 4),
(2, 3),
(2, 5),
(3, 1),
(3, 4),
(3, 6),
(4, 2),
(4, 3),
(4, 6);


-- Table structure for table movies

CREATE TABLE movies (
  movie_id int NOT NULL,
  movie_name varchar(50) NOT NULL,
  description text,
  date_of_release date NOT NULL,
  producer_id int DEFAULT NULL
);

INSERT INTO movies (movie_id, movie_name, description, date_of_release, producer_id) VALUES
(1, 'movie1', 'movie1 description', '2020-08-15', 1),
(2, 'movie2', 'movie2 description', '2019-11-19', 2),
(3, 'movie3', 'movie3 description', '2021-04-08', 1),
(4, 'movie4 Updated', 'movie4 description', '2022-01-02', 3);



-- Table structure for table movie_galleries

CREATE TABLE movie_galleries (
  pic_id int NOT NULL,
  movie_id int DEFAULT NULL,
  pic_path text
);

-- Dumping data for table movie_galleries

INSERT INTO movie_galleries (pic_id, movie_id, pic_path) VALUES
(7, 1, '/images/pic8.jpg'),
(8, 1, '/images/pic2.jpg'),
(9, 2, '/images/pic3.jpg'),
(10, 2, '/images/pic4.jpg'),
(11, 3, '/images/pic5.jpg'),
(20, 4, '/images/pic1.jpg');



-- Table structure for table producers

CREATE TABLE producers (
  producer_id int NOT NULL,
  producer_name varchar(50) NOT NULL,
  company_name varchar(50) DEFAULT NULL,
  date_of_birth date DEFAULT NULL,
  gender varchar(7) DEFAULT NULL
);

INSERT INTO producers (producer_id, producer_name, company_name, date_of_birth, gender) VALUES
(1, 'producer1', 'company1', '1988-04-16', 'male'),
(2, 'producer2', 'company1', '1988-05-29', 'male'),
(3, 'producer3', 'company2', '1988-09-18', 'female');



-- Indexes for dumped tables
------------------------------
-- Indexes for table actors

ALTER TABLE actors ADD PRIMARY KEY (actor_id);


-- Indexes for table movieactors

ALTER TABLE movieactors ADD PRIMARY KEY (movie_id,actor_id), ADD KEY ct_fk_actor (actor_id);


-- Indexes for table movies

ALTER TABLE movies ADD PRIMARY KEY (movie_id), ADD KEY fk_producer (producer_id);


-- Indexes for table movie_galleries

ALTER TABLE movie_galleries ADD PRIMARY KEY (pic_id), ADD KEY mg_fk_movie (movie_id) USING BTREE;


-- Indexes for table producers
-
ALTER TABLE producers
  ADD PRIMARY KEY (producer_id);


-- AUTO_INCREMENT for dumped tables
-------------------------------------

-- AUTO_INCREMENT for table actors

ALTER TABLE actors MODIFY actor_id int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

-- AUTO_INCREMENT for table movies

ALTER TABLE movies MODIFY movie_id int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

-- AUTO_INCREMENT for table movie_galleries

ALTER TABLE movie_galleries MODIFY pic_id int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table producers
--
ALTER TABLE producers MODIFY producer_id int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


-- Constraints for dumped tables
------------------------------------------
-- Constraints for table movieactors

ALTER TABLE movieactors ADD CONSTRAINT ct_fk_actor FOREIGN KEY (actor_id) REFERENCES actors (actor_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE movieactors ADD CONSTRAINT ct_fk_movie FOREIGN KEY (movie_id) REFERENCES movies (movie_id) ON DELETE CASCADE ON UPDATE CASCADE;

---- Constraints for table movies

ALTER TABLE movies
ADD CONSTRAINT fk_producer FOREIGN KEY (producer_id) REFERENCES producers (producer_id) ON DELETE SET NULL ON UPDATE SET NULL;

--- Constraints for table movie_galleries

ALTER TABLE movie_galleries
ADD CONSTRAINT fk_movie FOREIGN KEY (movie_id) REFERENCES movies (movie_id) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
