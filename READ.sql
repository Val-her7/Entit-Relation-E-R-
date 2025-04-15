SELECT Voyage.ville, Voyage.pays, Voyage.date, Voyage.prix, Voyage.nombre_de_places, Hebergement.type, CONCAT(Contact.nom, " ", Contact.prenom, " ", Contact.telephone) AS "Contact_Hebergement", CONCAT(Transport.type, " ", Transport.compagnie, " ", Transport.places, " places") AS Proposition_de_Transport FROM Voyage
INNER JOIN Hebergement ON Voyage.HebergementID = Hebergement.HebergementID
INNER JOIN Contact ON Hebergement.ContactID = Contact.ContactID
INNER JOIN Proposition_transport AS P ON Voyage.VoyageID = P.VoyageID
INNER JOIN Transport ON Transport.TransportID = P.TransportID
ORDER BY Voyage.ville ASC;

SELECT Client.nom, Client.prenom, Reservation.date_reservation, CONCAT(Voyage.ville, "(", Voyage.pays, ")") AS Destination, Paiement.montant_payé, Paiement.date_paiement, Paiement.methode_paiement FROM Reservation
INNER JOIN Client ON Reservation.ClientID = Client.ClientID
INNER JOIN Voyage ON Voyage.VoyageID = Reservation.VoyageID
INNER JOIN Paiement ON Paiement.ReservationID = Reservation.ReservationID
WHERE Client.ClientID = 1
ORDER BY Reservation.date_reservation DESC;

SELECT CONCAT(Voyage.ville, "(", Voyage.pays, ")") AS Destination, Voyage.date, Transport.type AS "moyen de transport disponible", Transport.compagnie, Transport.places FROM Voyage
INNER JOIN Proposition_transport ON Voyage.VoyageID = Proposition_transport.VoyageID
INNER JOIN Transport ON Transport.TransportID = Proposition_transport.TransportID
WHERE Voyage.VoyageID = 2;

SELECT Transport.type, Transport.places, Transport.compagnie FROM Transport
WHERE Transport.compagnie = "Compagnie A";