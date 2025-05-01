
-- 1. Ricerca dei biglietti disponibili per una determinata tratta
SELECT * FROM Biglietto
WHERE id_tratta = 1 AND data_viaggio = '2025-06-15';

-- 2. Verifica della validità di un biglietto
SELECT * FROM Biglietto
WHERE id_biglietto = 3 AND data_viaggio >= CURRENT_DATE;

-- 3. Storico delle prenotazioni di un cliente
SELECT * FROM Biglietto
WHERE id_cliente = 1
ORDER BY data_viaggio DESC;

-- 4. Dettagli di un passeggero e dei biglietti acquistati
SELECT c.nome, c.cognome, b.id_biglietto, b.data_viaggio, t.partenza, t.arrivo
FROM Cliente c
JOIN Biglietto b ON c.id_cliente = b.id_cliente
JOIN Tratta t ON b.id_tratta = t.id_tratta
WHERE c.id_cliente = 1;

-- 5. Ricerca dei treni in partenza in un determinato giorno
SELECT * FROM Tratta
WHERE data_partenza = '2025-06-15';
