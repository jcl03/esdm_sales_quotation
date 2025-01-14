using app.sales from '../db/sales'; // Reference your database model
using {sap} from '@sap/cds-common-content';

service SalesManagementService {

    // Enable draft functionality for the service
    @odata.draft.enabled: true
    // Expose the Quotations entity
    entity Quotations as projection on sales.Quotations;

    // Expose the Products entity
    entity Products as projection on sales.Products;

    // Expose the Employees entity
    entity Employees as projection on sales.Employees;

    // Read-only access to Languages for multi-language support or value help
    @readonly
    entity Languages as projection on sap.common.Languages;
}
