/**
 * aca en este archivo agregamos o quitamos propiedades desde la odata sapbackend.xml la que se expone en el servicio
 *
 */

using {sapbackend as external} from './external/sapbackend';

define service SAPBackendExit {
   @cds.persistence: {
      table,
      skip: false
   }
   @cds.autoexpose
   // entity Incidents as select from external.IncidentsSet;
   entity Incidents as projection on external.IncidentsSet;
}

/**
 * aca creamos un servicio con el protocolo REST
 */
@protocol: 'rest'
service RestService {
   entity Incidents as projection on SAPBackendExit.Incidents;
}
