const cds = require("@sap/cds");
const { Orders } = cds.entities("com.training");

module.exports = (srv) => {
  //*****READ ******/
  srv.on("READ", "GetOrders", async (req) => {
    if (req.data.ClientEmail !== undefined) {
      return await SELECT.from`com.training.Orders`
        .where`ClientEmail = ${req.data.ClientEmail}`;
    }
    return SELECT.from(Orders);
  });

  //*****CREATE ******/
  srv.on("CREATE", "CreateOrder", async (req) => {
    try {
      const result = await cds
        .transaction(req)
        .run(
          INSERT.into(Orders).entries({
            ClientEmail: req.data.ClientEmail,
            FirstName: req.data.FirstName,
            LastName: req.data.LastName,
            CreatedOn: req.data.CreatedOn,
            Reviewed: req.data.Reviewed,
            Approved: req.data.Approved,
            Country_code: req.data.Country_code,
          })
        );
  
      if (result) {
        console.log("Registro Insertado:", result);
        return req.data;
      } else {
        req.error(409, "Registro No Insertado");
      }
    } catch (err) {
      console.error(err);
      req.error(err.code, err.message);
    }
  });
  
};
