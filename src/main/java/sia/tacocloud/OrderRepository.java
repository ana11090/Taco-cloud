package sia.tacocloud;

import sia.tacocloud.Order;

public interface OrderRepository {
    Order save(Order order);
}
