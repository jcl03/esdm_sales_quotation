using SalesManagementService as service from '../../srv/sales';
annotate service.Quotations with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : quotationID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'product_productID',
                Value : product_productID,
            },
            {
                $Type : 'UI.DataField',
                Value : quantity,
            },
            {
                $Type : 'UI.DataField',
                Value : status,
            },
            {
                $Type : 'UI.DataField',
                Value : createdDate,
            },
            {
                $Type : 'UI.DataField',
                Value : expiryDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'createdBy_employeeID',
                Value : createdBy_employeeID,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : quotationID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'product_productID',
            Value : product_productID,
        },
        {
            $Type : 'UI.DataField',
            Value : quantity,
        },
        {
            $Type : 'UI.DataField',
            Value : status,
        },
        {
            $Type : 'UI.DataField',
            Value : createdDate,
        },
    ],
);

annotate service.Quotations with {
    product @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Products',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : product_productID,
                ValueListProperty : 'productID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'description',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'price',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'stockLevel',
            },
        ],
    }
};

annotate service.Quotations with {
    createdBy @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Employees',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : createdBy_employeeID,
                ValueListProperty : 'employeeID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'firstName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'lastName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'department',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'role',
            },
        ],
    }
};

