using com.training as training from '../db/training';

service GestionDePedidos {
    entity GetOrders as projection on training.Orders;
    entity CreateOrder as projection on training.Orders;
}
