namespace app.sales;

type ProductID   : String(10);
type QuotationID : String(10);
type Status      : String(50);
type Quantity    : Integer;
type Description : String(255);
type TDate       : Date;
type EmployeeID  : String(10);

entity Products {
    key productID : ProductID @UI.Identification: [{ type: #AS_PRIMARY, position: 10 }] @title: 'Product ID';
    name          : String(100) @UI.LineItem: [{ position: 20 }] @title: 'Name';
    description   : Description @UI.LineItem: [{ position: 30 }] @title: 'Description';
    price         : Decimal(10,2) @UI.LineItem: [{ position: 40 }] @title: 'Price';
    stockLevel    : Integer @UI.LineItem: [{ position: 50 }] @title: 'Stock Level';
}

entity Quotations {
    key quotationID : QuotationID @UI.Identification: [{ type: #AS_PRIMARY, position: 10 }] @title: 'Quotation ID';
    product         : Association to Products @UI.LineItem: [{ position: 20 }] @title: 'Product';
    quantity        : Quantity @UI.LineItem: [{ position: 30 }] @UI.DataPoint: { type: #Number } @title: 'Quantity';
    status          : Status @UI.LineItem: [{ position: 40 }] @title: 'Status'; // E.g., Pending, Approved, Denied
    createdDate     : TDate @UI.LineItem: [{ position: 50 }] @UI.DataPoint: { type: #Date } @title: 'Created Date';
    expiryDate      : TDate @UI.LineItem: [{ position: 60 }] @UI.DataPoint: { type: #Date } @title: 'Expiry Date';
    createdBy       : Association to Employees @UI.LineItem: [{ position: 70 }] @title: 'Created By';
}

entity Employees {
    key employeeID : EmployeeID @UI.Identification: [{ type: #AS_PRIMARY, position: 10 }] @title: 'Employee ID';
    firstName      : String(100) @UI.LineItem: [{ position: 20 }] @title: 'First Name';
    lastName       : String(100) @UI.LineItem: [{ position: 30 }] @title: 'Last Name';
    department     : String(100) @UI.LineItem: [{ position: 40 }] @title: 'Department';
    role           : String(100) @UI.LineItem: [{ position: 50 }] @title: 'Role';
    dateOfJoining  : TDate @UI.LineItem: [{ position: 60 }] @UI.DataPoint: { type: #Date } @title: 'Date of Joining';
    tasks          : Composition of many Quotations on tasks.createdBy = $self @title: 'Quotations';
}
