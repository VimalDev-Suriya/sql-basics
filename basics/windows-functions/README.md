# Window Function

## Row Numbers

Used to uniquely identify each rows in the Table. Remenber this is not the primary Key, it just to refer and organize the data.

```sql
ROW_NUMBER() OVER(
    ORDER BY <column_name> DESC
)
```

- `ROW_NUMBER()` is the Global SQL function, Which assign the sequentail numbers starting from 1.
- It was used in conjuction with `OVER`, this 'over' adds the specification where we need to add this row numbers

### Realtime usecases

1. Server-Side Pagination: Splitting massive API responses into pages by pulling a specific range (e.g., rows 21 to 30) without using slow OFFSET clauses.
2. Top-N Reporting: Finding the top 3 highest-selling products within every single distinct product category.
3. Timeline Analysis: Identifying the first or last action a customer took during a specific web session

## Rank and Dense Rank:

Both of them are used to rank the rows, here if 2 rows having same values

- `RANK` - the same value will be assigned to them, but the next value will be skipped.
- `DENSE_RANK` - the same value will be assigned to them, but the next value will not be skipped.

## Partition by:

A Property used in conjustion with window functions, used primarly to group. SImilar to group by, but it will not merge the rows.
