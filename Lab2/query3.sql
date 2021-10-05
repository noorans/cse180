SELECT DISTINCT G.movieID, G.name, G.year, G.length
FROM Movies G, Movies H
WHERE H.name = 'Avengers'
    AND H.year = 2011
    AND H.length < G.length 
ORDER BY G.year DESC, G.name ASC;