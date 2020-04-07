-- Sakila Sample Database Schema
-- Version 1.2

-- Copyright (c) 2006, 2019, Oracle and/or its affiliates.
-- All rights reserved.

-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are
-- met:

-- * Redistributions of source code must retain the above copyright notice,
--   this list of conditions and the following disclaimer.
-- * Redistributions in binary form must reproduce the above copyright
--   notice, this list of conditions and the following disclaimer in the
--   documentation and/or other materials provided with the distribution.
-- * Neither the name of Oracle nor the names of its contributors may be used
--   to endorse or promote products derived from this software without
--   specific prior written permission.

-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
-- IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
-- CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
-- EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
-- PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
-- PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
-- LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
-- NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
-- SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

DROP SCHEMA IF EXISTS sakila CASCADE;
CREATE SCHEMA sakila;

--
-- Table structure for table `actor`
--

CREATE TABLE sakila.actor(actor_id      BIGINT NOT NULL
                          , first_name  VARCHAR(45) NOT NULL
                          , last_name   VARCHAR(45) NOT NULL
                          , last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                          PRIMARY KEY (actor_id) );

--
-- Table structure for table `address`
--

CREATE TABLE sakila.address(address_id    BIGINT NOT NULL
                            , address     VARCHAR(50) NOT NULL
                            , address2    VARCHAR(50) DEFAULT NULL
                            , district    VARCHAR(20) NOT NULL
                            , city_id     SMALLINT NOT NULL
                            , postal_code VARCHAR(10) DEFAULT NULL
                            , phone       VARCHAR(20) NOT NULL
                            , last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
                            PRIMARY KEY (address_id) );

--
-- Table structure for table `category`
--

CREATE TABLE sakila.category(category_id   BIGINT NOT NULL
                             , name        VARCHAR(25) NOT NULL
                             , last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             PRIMARY KEY (category_id) );

--
-- Table structure for table `city`
--

CREATE TABLE sakila.city(city_id       BIGINT NOT NULL
                         , city        VARCHAR(50) NOT NULL
                         , country_id  SMALLINT NOT NULL
                         , last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                         PRIMARY KEY (city_id) );

--
-- Table structure for table `country`
--

CREATE TABLE sakila.country(country_id    BIGINT NOT NULL
                            , country     VARCHAR(50) NOT NULL
                            , last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                            PRIMARY KEY (country_id) );

--
-- Table structure for table `customer`
--

CREATE TABLE sakila.customer(customer_id   BIGINT NOT NULL
                             , store_id    SMALLINT NOT NULL
                             , first_name  VARCHAR(45) NOT NULL
                             , last_name   VARCHAR(45) NOT NULL
                             , email       VARCHAR(50) DEFAULT NULL
                             , address_id  SMALLINT NOT NULL
                             , active      BOOLEAN NOT NULL DEFAULT TRUE
                             , create_date DATETIME NOT NULL
                             , last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                             PRIMARY KEY (customer_id) );

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS sakila.film;
CREATE TABLE sakila.film(film_id                BIGINT NOT NULL
                         , title                VARCHAR(128) NOT NULL
                         , description          TEXT DEFAULT NULL
                         , release_year         INTEGER DEFAULT NULL
                         , language_id          SMALLINT NOT NULL
                         , original_language_id SMALLINT DEFAULT NULL
                         , rental_duration      SMALLINT NOT NULL DEFAULT 3
                         , rental_rate          DECIMAL(4,2) NOT NULL DEFAULT 4.99
                         , length               SMALLINT DEFAULT NULL
                         , replacement_cost     DECIMAL(5,2) NOT NULL DEFAULT 19.99
                         , rating               VARCHAR(10) DEFAULT 'G'
                         , special_features     VARCHAR(100) DEFAULT NULL
                         , last_update          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                         PRIMARY KEY (film_id) );

--
-- Table structure for table `film_actor`
--

CREATE TABLE sakila.film_actor(actor_id      SMALLINT NOT NULL
                               , film_id     SMALLINT NOT NULL
                               , last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                               PRIMARY KEY (actor_id,film_id) );

--
-- Table structure for table `film_category`
--

CREATE TABLE sakila.film_category(film_id       SMALLINT NOT NULL
                                  , category_id SMALLINT NOT NULL
                                  , last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                  PRIMARY KEY (film_id, category_id) );

--
-- Table structure for table `film_text`
--

CREATE TABLE sakila.film_text(film_id       SMALLINT NOT NULL
                              , title       VARCHAR(255) NOT NULL
                              , description TEXT,
                              PRIMARY KEY (film_id) ) ;

--
-- Table structure for table `inventory`
--

CREATE TABLE sakila.inventory(inventory_id  BIGINT NOT NULL
                              , film_id     SMALLINT NOT NULL
                              , store_id    SMALLINT NOT NULL
                              , last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                              PRIMARY KEY (inventory_id) );

--
-- Table structure for table `language`
--

CREATE TABLE sakila.language(language_id   BIGINT NOT NULL
                             , name        CHAR(20) NOT NULL
                             , last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             PRIMARY KEY (language_id) );

--
-- Table structure for table `payment`
--

CREATE TABLE sakila.payment(payment_id     BIGINT NOT NULL
                            , customer_id  SMALLINT NOT NULL
                            , staff_id     SMALLINT NOT NULL
                            , rental_id    INT DEFAULT NULL
                            , amount       DECIMAL(5,2) NOT NULL
                            , payment_date DATETIME NOT NULL
                            , last_update  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                            PRIMARY KEY (payment_id) );

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS sakila.rental;
CREATE TABLE sakila.rental(rental_id      BIGINT NOT NULL
                           , rental_date  DATETIME NOT NULL
                           , inventory_id BIGINT NOT NULL
                           , customer_id  SMALLINT NOT NULL
                           , return_date  DATETIME DEFAULT NULL
                           , staff_id     SMALLINT NOT NULL
                           , last_update  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                           PRIMARY KEY (rental_id) );

--
-- Table structure for table `staff`
--

CREATE TABLE sakila.staff(staff_id      BIGINT NOT NULL
                          , first_name  VARCHAR(45) NOT NULL
                          , last_name   VARCHAR(45) NOT NULL
                          , address_id  SMALLINT NOT NULL
                          , email       VARCHAR(50) DEFAULT NULL
                          , store_id    SMALLINT NOT NULL
                          , active      BOOLEAN NOT NULL DEFAULT TRUE
                          , username    VARCHAR(16) NOT NULL
                          , PASSWORD    VARCHAR(40) DEFAULT NULL
                          , last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                          PRIMARY KEY (staff_id) );

--
-- Table structure for table `store`
--

CREATE TABLE sakila.store(store_id           BIGINT NOT NULL
                          , manager_staff_id SMALLINT NOT NULL
                          , address_id       SMALLINT NOT NULL
                          , last_update      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                          PRIMARY KEY (store_id) );