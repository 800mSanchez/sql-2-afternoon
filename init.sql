/* Get all invoices where the unit_price on the invoice_line is greater than $0.99. */

SELECT *
FROM invoice
JOIN invoice_line  ON invoice_line.invoice_id = invoice.invoice_id
WHERE invoice_line.unit_price > 0.99;

/* Get the invoice_date, customer first_name and last_name, and total from all invoices. */

SELECT invoice_date, first_name, last_name, total
FROM invoice
JOIN customer ON invoice.customer_id = customer.customer_id

/* Get the customer first_name and last_name and the support rep's first_name and last_name from all customers. */

SELECT c.first_name, c.last_name, e.first_name, e.last_name
FROM customer c
JOIN employee e ON c.support_rep_id = e.employee_id;

/* Support reps are on the employee table. */

SELECT al.title, ar.name
FROM album al
JOIN artist ar ON al.artist_id = ar.artist_id;

/* Get the album title and the artist name from all albums. */

SELECT al.title, ar.name
FROM album al
JOIN artist ar ON al.artist_id = ar.artist_id;

/* Get all playlist_track track_ids where the playlist name is Music. */

SELECT pt.track_id
FROM playlist_track pt
JOIN playlist p ON p.playlist_id = pt.playlist_id
WHERE p.name = 'Music';


/* Get all track names for playlist_id 5. */

SELECT t.name
FROM track t
JOIN playlist_track pt ON pt.track_id = t.track_id
WHERE pt.playlist_id = 5;

/* Get all track names and the playlist name that they're on ( 2 joins ). */

SELECT t.name, p.name
FROM track t
JOIN playlist_track pt ON t.track_id = pt.track_id
JOIN playlist p ON pt.playlist_id = p.playlist_id;

/* Get all track names and album titles that are the genre Alternative & Punk ( 2 joins ). */

SELECT t.name, a.title
FROM track t
JOIN album a ON t.album_id = a.album_id
JOIN genre g ON g.genre_id = t.genre_id
WHERE g.name = 'Alternative & Punk';

/* Get all invoices where the unit_price on the invoice_line is greater than $0.99. */

SELECT *
FROM invoice
WHERE invoice_id IN ( SELECT invoice_id FROM invoice_line WHERE unit_price > 0.99 );

/* Get all playlist tracks where the playlist name is Music. */

SELECT *
FROM playlist_track
WHERE playlist_id IN ( SELECT playlist_id FROM playlist WHERE name = 'Music' );

/* Get all track names for playlist_id 5. */

SELECT name
FROM track
WHERE track_id IN ( SELECT track_id FROM playlist_track WHERE playlist_id = 5 );

/* Get all tracks where the genre is Comedy. */

SELECT *
FROM track
WHERE genre_id IN ( SELECT genre_id FROM genre WHERE name = 'Comedy' );

/* Get all tracks where the album is Fireball. */

SELECT *
FROM track
WHERE album_id IN ( SELECT album_id FROM album WHERE title = 'Fireball' );

/* Get all tracks for the artist Queen ( 2 nested subqueries ). */

SELECT *
FROM track
WHERE album_id IN ( 
  SELECT album_id FROM album WHERE artist_id IN ( 
    SELECT artist_id FROM artist WHERE name = 'Queen'
  )
); 