namespace proyecto.personal;

using {
    cuid,
    managed
} from '@sap/cds/common';

type Dec : Decimal(16, 2);


context materials {

    define entity Products : cuid, managed {
        Name             : localized String not null;
        Description      : localized String;
        ImageUrl         : String;
        ReleaseDate      : DateTime;
        DiscontinuedDate : DateTime;
        Price            : Dec;
        Height           : type of Price;
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
        Supplier         : Association to sales.Suppliers;
        UnitOfMeasure    : Association to UnitOfMeasures;
        Currencie        : Association to Currencies;
        DimensionUnit    : Association to DimensionUnits;
        Categorie        : Association to Categories;
        SalesData        : Association to many sales.SalesData
                               on SalesData.Product = $self;
        Reviews          : Association to many ProductReview
                               on Reviews.Product = $self;
    };

    entity Categories : cuid {
        key ID   : String(1);
            Name : localized String;
    };

    entity StockAvailability : cuid {
        key ID          : String(3);
            Description : localized String;
            Product     : Association to Products;
    };

    entity Currencies : cuid {
        key ID          : String(3);
            Description : localized String;
    };

    entity UnitOfMeasures : cuid {
        key ID          : String(3);
            Description : localized String;
    };

    entity DimensionUnits : cuid {
        key ID          : String(3);
            Description : localized String;
    };

    entity ProductReview : cuid, managed {
        Name    : String;
        Rating  : Integer;
        Comment : String;
        Product : Association to materials.Products;
    };


}


context sales {
    entity Orders : cuid {
        Date     : Date;
        Customer : String;
        Item     : Composition of many OrderItems
                       on Item.Order = $self;
    };

    entity OrderItems : cuid {
        Order    : Association to Orders;
        Product  : Association to materials.Products;
        Quantity : Integer;
    };

    entity Suppliers : cuid {
        Name               : type of materials.Products : Name;
        Address_Street     : String;
        Address_City       : String;
        Address_State      : String(20);
        Address_PostalCode : String(20);
        Address_Country    : String(20);
        Email              : String;
        Phone              : String;
        Fax                : String;
        Product            : Association to many materials.Products
                                 on Product.Supplier = $self;
    };


    entity Months : cuid {
        key ID               : String(3);
            Description      : localized String;
            ShortDescription : localized String(3);
    };


    entity SalesData : cuid, managed {
        DeliveryDate  : DateTime;
        Revenue       : Decimal(16, 2);
        Product       : Association to materials.Products;
        Currencie     : Association to materials.Currencies;
        DeliveryMonth : Association to sales.Months;
    };

}
