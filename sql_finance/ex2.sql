WITH total_cost AS
    (SELECT meals.meal_id,
        SUM(stocked_quantity) AS quantity,
        SUM(meal_cost * stocked_quantity) AS cost
    FROM meals
    JOIN stock ON meals.meal_id = stock.meal_id
    GROUP BY meals.meal_id)

    SELECT
        SUM(cost)
    FROM total_cost;