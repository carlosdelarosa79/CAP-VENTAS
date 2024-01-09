namespace com.training;


entity Orders  {
    key ClientEmail  : String(65);
        FirstName    : String(30);
        LastName     : String(30);
        CreatedOn    : Date;
        Reviewed     : Boolean;
        Approved     : Boolean;
        Country_code : String(20);
}
