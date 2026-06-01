SELECT * FROM pg_stat_activity;
SELECT * FROM pg_stat_activity WHERE state = 'active';

-- To Determin long running Query
SELECT pid, state, now() - query_start as runtime FROM pg_stat_activity
WHERE state = 'active'