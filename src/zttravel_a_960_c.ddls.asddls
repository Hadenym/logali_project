@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel  - Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity ZTTRAVEL_A_960_C
  provider contract transactional_query
  as projection on ZTTRAVEL_A_960_R
{
  key TravelUUID,

      @Search.defaultSearchElement: true
      TravelID,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'AgencyName' ]
      @Consumption.valueHelpDefinition: [{ entity:{ name: '/DMO/I_Agency_StdVH',
                                                    element: 'AgencyID'} ,
                                                    useForValidation: true }]
      AgencyID,
      _Agency.Name as AgencyName,

      CustomerId,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking,
      _Currency,
      _Customer,
      _OverStatus
}
