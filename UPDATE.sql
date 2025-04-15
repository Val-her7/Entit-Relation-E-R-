UPDATE Client
SET nom = "Herman", prenom = "Valentin", email = "Valentin.herman@gmail.com", telephone = "0473236743"
WHERE ClientID = 9;

UPDATE Reservation
INNER JOIN Client ON Reservation.ClientID = Client.ClientID
INNER JOIN Voyage ON Reservation.VoyageID = Voyage.VoyageID
SET Reservation.status = "Annulée"
WHERE Client.email = "david.moreau@example.com" AND Voyage.ville = "Le Caire";

UPDATE Voyage
INNER JOIN Reservation ON Voyage.VoyageID = Reservation.VoyageID
SET Voyage.prix = 2050,
    Voyage.nombre_de_places = Voyage.nombre_de_places - (SELECT count(*) FROM Reservation WHERE Reservation.VoyageID = 17)
WHERE Voyage.VoyageID = 17;