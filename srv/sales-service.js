const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
    const { Quotations, Employees } = this.entities;

    // Before creating a quotation, set the createdBy field to the first employee
    this.before('CREATE', Quotations, async (req) => {
        // Fetch the first employee from the Employees table
        const firstEmployee = await cds.transaction(req).run(
            SELECT.one.from(Employees).orderBy('employeeID')
        );

        if (!firstEmployee) {
            req.reject(400, `No employees are available to assign as 'createdBy'.`);
        }

        // Automatically assign the first employee's ID to createdBy
        req.data.createdBy = firstEmployee.employeeID;
    });
});
