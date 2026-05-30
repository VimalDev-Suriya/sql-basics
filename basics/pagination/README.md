# Pagination in SQL:

1. Using Offset and Limit
2. Cursor based pagination

## Using Offset and Limit:

- LIMIT - restricts on number of rows to be displayed
- OFFSET - How many rows can be skipped.

**Note**: While implementing the pagination `ORDER BY` is more important, because of the following reason,

1. There is no gurantee about the order of the rows that are inserted into the Table, So we should definitely order them before sending to customers.

### Issues of pagination using Offset:

- `Offset` is the high performant clause. Though it tries to skip the rows, but before skipping the rows the complier will still scan all the rows to find the corresponding offset row.
  - This could be helpful in smaller data set, consider if the table has lakh of rows, scanning and skipping them is really a time performant task
- There are more chances that we might get duplicate/ reduntant values - If there was a Insertion/Deletion/Updation of the Rows.
  - How ? Consider the scenario, the new row was added as the 10th element this will increase the row by 1, While serving with offset 10, we will see the same 10th row as the 11th row to the user, this is duplicate.

## Cursor based pagination: (Keyset)

It is a pagination technique, where the pagination was done on the top of **last seen or after the pointer**, instead of offset & limit. The Query looks like

```sql
SELECT * FROM <table_name>
WHERE id > given_id
LIMIT 10
```

- Here we are indexing using PK (id) or TIME Stamps (created_at)
