--
-- PARTIE 1
--

-- --------------------------------------------------------

--
-- QUESTION 1
--

SELECT NOMPILOTE, ADRESSE
FROM pilote;

-- --------------------------------------------------------

--
-- QUESTION 2
--

SELECT DISTINCT VILLEDEP 
FROM vol;

-- --------------------------------------------------------

--
-- QUESTION 3
--

SELECT NUMVOL, VILLEDEP, VILLEARR, HEUREDEP, HEUREARR
FROM vol
WHERE VILLEDEP = 'Paris' AND HEUREDEP BETWEEN '14:00' AND '16:00';

-- --------------------------------------------------------

--
-- QUESTION 4
--

SELECT *
FROM avion
WHERE NOMAVION LIKE 'Airbus%';

-- --------------------------------------------------------

--
-- QUESTION 5
--

SELECT *
FROM pilote
WHERE NOMPILOTE LIKE '_i%';

-- --------------------------------------------------------

--
-- QUESTION 6
--

SELECT *
FROM avion
WHERE CAPACITE BETWEEN 200 AND 300;

-- --------------------------------------------------------

--
-- QUESTION 7
--

SELECT NUMAVION, NOMAVION, LOCALISATION
FROM avion
WHERE CAPACITE > 200 AND LOCALISATION <> 'Nice'
ORDER BY NUMAVION DESC;

-- --------------------------------------------------------

--
-- QUESTION 8
--

SELECT DISTINCT NOMPILOTE
FROM pilote
INNER JOIN vol ON pilote.NUMPILOTE = vol.NUMPILOTE AND vol.VILLEDEP = 'Paris';

-- --------------------------------------------------------

--
-- QUESTION 9
--

SELECT DISTINCT NOMPILOTE
from pilote
INNER JOIN avion ON avion.LOCALISATION = pilote.ADRESSE and avion.NOMAVION LIKE '%Airbus%'

-- --------------------------------------------------------

--
-- QUESTION 10
--

SELECT DISTINCT NOMPILOTE
FROM vol
INNER JOIN pilote ON vol.NUMPILOTE = pilote.NUMPILOTE
WHERE vol.NUMAVION IN (
    SELECT NUMAVION
    FROM vol
    WHERE NUMPILOTE = 2
);

-- --------------------------------------------------------

--
-- QUESTION 11
--

SELECT avion.NUMAVION, avion.NOMAVION
FROM avion
JOIN vol
WHERE avion.CAPACITE BETWEEN 200 AND 300 AND vol.NUMVOL = 'USA050';

-- --------------------------------------------------------

--
-- QUESTION 12
--

SELECT *
FROM avion
WHERE CAPACITE > (
    SELECT MAX(CAPACITE)
    FROM avion
    WHERE LOCALISATION = 'Nice'
);

-- --------------------------------------------------------

--
-- QUESTION 13
--

SELECT *
FROM avion
WHERE CAPACITE > (
    SELECT MIN(CAPACITE)
    FROM avion
    WHERE LOCALISATION = 'Nice'
);


-- --------------------------------------------------------

--
-- QUESTION 14
--

SELECT DISTINCT NOMPILOTE
from pilote
INNER JOIN avion ON avion.LOCALISATION = pilote.ADRESSE and avion.NOMAVION LIKE '%Airbus%'
where NUMPILOTE IN (
  SELECT NUMPILOTE
  from vol
  where VILLEDEP IN(
    SELECT VILLEARR
    from vol
    INNER JOIN pilote ON pilote.NUMPILOTE = vol.NUMPILOTE and pilote.NOMPILOTE LIKE '%Ader%'
  )
);


--
-- PARTIE 2
--

--
-- QUESTION 15
--

SELECT COUNT(DISTINCT NUMPILOTE) AS NbPilote
FROM vol;

-- --------------------------------------------------------

--
-- QUESTION 16
--

SELECT NUMAVION
FROM avion
WHERE CAPACITE >= (
    SELECT AVG(CAPACITE)
    FROM avion
    WHERE avion.LOCALISATION = avion.LOCALISATION
);

-- --------------------------------------------------------

--
-- QUESTION 17
--

SELECT NUMAVION, NOMAVION
FROM avion
WHERE (CAPACITE * 1.1) > 250;

-- --------------------------------------------------------

--
-- QUESTION 18
--

