ALTER TABLE Paiement
DROP FOREIGN KEY paiement_ibfk_1;

ALTER TABLE Paiement
ADD CONSTRAINT fk_paiement_reservation
FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID) ON DELETE CASCADE;

DELETE FROM Reservation
WHERE ReservationID = 40;

DELETE FROM Paiement
WHERE methode_paiement NOT IN ("Virement", "Espèces");

ALTER TABLE Proposition_transport
DROP FOREIGN KEY proposition_transport_ibfk_2;

ALTER TABLE Proposition_transport
ADD CONSTRAINT fk_proposition_transport
FOREIGN KEY (TransportID) REFERENCES Transport(TransportID) ON DELETE CASCADE;

DELETE FROM Transport
WHERE TransportID = 4;