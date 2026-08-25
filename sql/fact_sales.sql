-- Fact_Sales dataset
-- Base dataset used for all Tableau analysis and dashboards
SELECT
	Invoice.InvoiceDate AS Date,
    InvoiceLine.InvoiceLineId,
    InvoiceLine.InvoiceId,
    InvoiceLine.TrackId,
    REPLACE(Track.Name, '"', '""') AS Track,
    InvoiceLine.UnitPrice,
    InvoiceLine.Quantity,
    InvoiceLine.UnitPrice*InvoiceLine.Quantity AS Revenue,
    Track.GenreId,
    REPLACE(Genre.Name, '"', '""') AS Genre,
    Invoice.CustomerId,
    REPLACE(CONCAT(Customer.FirstName, ' ', Customer.LastName), '"', '""') AS Customer,
    Customer.Country AS Country,
    Employee.EmployeeId,
    REPLACE(CONCAT(Employee.FirstName, ' ', Employee.LastName), '"', '""') AS EmployeeName
FROM Chinook.InvoiceLine
	JOIN Chinook.Invoice ON Invoice.InvoiceId = InvoiceLine.InvoiceId
    JOIN Chinook.Customer ON Customer.CustomerId = Invoice.CustomerId
    JOIN Chinook.Track ON Track.TrackId = InvoiceLine.TrackId
    JOIN Chinook.Genre ON Genre.GenreId = Track.GenreId
    JOIN Chinook.Employee ON Employee.EmployeeId = Customer.SupportRepId
ORDER BY InvoiceLine.InvoiceLineId;