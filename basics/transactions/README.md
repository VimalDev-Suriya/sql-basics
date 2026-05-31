# Transactions:

Transaction is the `bundle of multiple SQL statments` executed in a `single unit of work`. <br>
Transaction is the key principle in Relational Database , which is the foundation of ACID principle. Where its states that either all transactions get succeeded and updates in DB or none of the transactions gets updated. <br>

It consist of 3 main blocks

1. BEGIN - A Draft version of the transactions
2. ROLLBACK - A Undo for the transactions which where completed
3. COMMIT - Hard write to DB (only if all tarnsactions are correct)
