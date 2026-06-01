CREATE FUNCTION check_stock_level(item_id INT) 
RETURNS TEXT AS $$
DECLARE
    current_stock INT;
BEGIN
    SELECT stock_count INTO current_stock FROM inventory WHERE id = item_id;
    IF current_stock < 10 THEN
        RETURN 'REORDER_IMMEDIATELY';
    ELSE
        RETURN 'STOCK_OK';
    END IF;
END;
$$ LANGUAGE plpgsql;
