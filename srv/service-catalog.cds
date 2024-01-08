using {proyecto.personal as proyecto} from '../db/schema';

define service CatalogoDeProductos {
    entity Productos      as select from proyecto.materials.Products;
    entity Proveedores      as select from proyecto.sales.Suppliers;
    entity UnidadDeMedidas as select from proyecto.materials.UnitOfMeasures;
    entity Moneda      as select from proyecto.materials.Currencies;
    entity UnidadDeDimension  as select from proyecto.materials.DimensionUnits;
    entity Categoria      as select from proyecto.materials.Categories;
    entity DatosDeVenta      as select from proyecto.sales.SalesData;
    entity Reseñas        as select from proyecto.materials.ProductReview;
    entity Meses         as select from proyecto.sales.Months;
    entity Orden          as select from proyecto.sales.Orders;
    entity ArticuloOrdenado      as select from proyecto.sales.OrderItems;
}
