sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'quotation/test/integration/FirstJourney',
		'quotation/test/integration/pages/QuotationsList',
		'quotation/test/integration/pages/QuotationsObjectPage'
    ],
    function(JourneyRunner, opaJourney, QuotationsList, QuotationsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('quotation') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheQuotationsList: QuotationsList,
					onTheQuotationsObjectPage: QuotationsObjectPage
                }
            },
            opaJourney.run
        );
    }
);