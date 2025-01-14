const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
    const { Quotations, Employees } = this.entities;

    // Before creating a quotation, set the createdBy field to the first employee
    this.before('CREATE', Quotations, async (req) => {
        // Fetch the first employee from the Employees table
        const firstEmployee = await cds.transaction(req).run(
            SELECT.one.from(Employees).orderBy('employeeID')
        );

        // If no employees are found, reject the request
        if (!firstEmployee) {
            req.reject(400, `No employees are available to assign as 'createdBy'.`);
            return;
        }

        // Automatically assign the first employee's ID to createdBy
        req.data.createdBy = firstEmployee.employeeID;

        // Generate a unique quotationID
        const count = await cds.run(SELECT.from(Quotations).columns('count(quotationID) as count'));
        req.data.quotationID = `Q${count[0].count + 1}`.padStart(4, '0');
    });
});