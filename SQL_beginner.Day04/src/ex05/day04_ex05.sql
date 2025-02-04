-- Please create a Database View `v_price_with_discount` that returns a person's orders with person names, pizza names, real price
-- and calculated column `discount_price` (with applied 10% discount and satisfies formula `price - price*0.1`). The result please sort
-- by person name and pizza name and make a round for `discount_price` column to integer type. Please take a look at a sample result below.

CREATE VIEW v_price_with_discount AS
  SELECT person.name AS name,
    menu.pizza_name AS pizza_name,
    menu.price AS price,
    ROUND(menu.price - menu.price * 0.1)::INT AS discount_price
  FROM person
    JOIN person_order
    ON person.id = person_order.person_id
    JOIN menu
    ON person_order.menu_id = menu.id
  ORDER BY name, pizza_name;
