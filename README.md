
## Описание

В рамках задания реализована витрина данных `mart_city_top_products` на Apache Spark (PySpark, DataFrame API).

Витрина строится на основе трёх таблиц:

- `users (user_id, city)`
- `orders (order_id, user_id, product_id, qty, price)`
- `products (product_id, product_name)`

## Логика расчёта

1. Добавлена производная метрика:
   - `revenue = qty * price`

2. Выполнены объединения:
   - `orders` + `users` по `user_id`
   - результат + `products` по `product_id`

3. Выполнена агрегация по:
   - `(city, product_id, product_name)`

   Рассчитаны метрики:
   - `orders_cnt` — количество заказов
   - `qty_sum` — суммарное количество
   - `revenue_sum` — суммарная выручка

4. Для каждого города выбран Top-2 товара по `revenue_sum`
   с использованием оконной функции (`Window`, `row_number()`).

5. Результат записан в формате Parquet (режим `overwrite`) по пути:
   /tmp/sandbox_zeppelin/mart_city_top_products/

6. После записи выполнено повторное чтение данных и вывод результата.

## Запуск проекта

### Сборка и запуск

```bash
docker compose up --build -d
