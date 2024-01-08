using {proyecto.personal as proyecto} from '../db/schema';

// define service CatalogoDeProductos {
//     entity Productos         as select from proyecto.materials.Products;
//     entity Proveedores       as select from proyecto.sales.Suppliers;
//     entity UnidadDeMedidas   as select from proyecto.materials.UnitOfMeasures;
//     entity Moneda            as select from proyecto.materials.Currencies;
//     entity UnidadDeDimension as select from proyecto.materials.DimensionUnits;
//     entity Categoria         as select from proyecto.materials.Categories;
//     entity DatosDeVenta      as select from proyecto.sales.SalesData;
//     entity Reseñas           as select from proyecto.materials.ProductReview;
//     entity Meses             as select from proyecto.sales.Months;
//     entity Orden             as select from proyecto.sales.Orders;
//     entity ArticuloOrdenado  as select from proyecto.sales.OrderItems;
// }

define service CatalogoDeProductos {

    entity Productos            as
        select from proyecto.reports.Products {
            ID,
            Name                          @mandatory,
            Description                   @mandatory,
            ImageUrl,
            ReleaseDate,
            DiscontinuedDate,
            Price                         @mandatory,
            Height                        @mandatory,
            Width                         @mandatory,
            Depth,
            Quantity                      @mandatory,
            UnitOfMeasure,
            Currencie                     @mandatory,
            Categorie      as ToCategorie @mandatory,
            Categorie.Name as Categorie   @readonly,
            DimensionUnit,
            SalesData,
            Supplier,
            Reviews,
            Rating,
            StockAvailability,
            ToStockAvailibilty
        };

    @readonly
    entity Proveedores          as
        select from proyecto.sales.Suppliers {
            ID,
            Name,
            Email,
            Phone,
            Fax,
            Product
        };

    entity Reseñas              as
        select from proyecto.materials.ProductReview {
            ID,
            Name,
            Rating,
            Comment,
            createdAt,
            Product
        };

    @readonly
    entity DatosDeVentas        as
        select from proyecto.sales.SalesData {
            ID,
            DeliveryDate,
            Revenue,
            Currencie.ID     as CurrencieKey,
            DeliveryMonth.ID as DeliveryMonth,
            Product
        };

    @readonly
    entity Disponibilidad       as
        select from proyecto.materials.StockAvailability {
            ID,
            Description,
            Product
        };

    @readonly
    entity VH_Categorias        as
        select from proyecto.materials.Categories {
            ID,
            Name
        };

    @readonly
    entity VH_Moneda            as
        select from proyecto.materials.Currencies {
            ID,
            Description
        };

    @readonly
    entity VH_UnidadDeMedida    as
        select from proyecto.materials.UnitOfMeasures {
            ID,
            Description
        };

    entity VH_UnidadDeDimension as
        select from proyecto.materials.DimensionUnits {
            ID,
            Description
        };
}

define service Reports {
    entity AverageRating        as projection on proyecto.reports.AverageRating;

    entity EntityCasting        as
        select
            cast(
                Price as      Integer
            )     as Price,
            Price as Price2 : Integer
        from proyecto.materials.Products;

    entity EntityExists         as
        select from proyecto.materials.Products {
            Name
        }
        where
            exists Supplier[Name = 'John Doe'];
}
