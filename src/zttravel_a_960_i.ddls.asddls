@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZTTRAVEL_A_960_I
provider contract transactional_interface
  as projection on ZTTRAVEL_A_960_R
{
  key TravelUUID,
      TravelID,  
      AgencyID,
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

    @Semantics.systemDateTime.localInstanceLastChangedAt: true
     LocalLastChangedAt,

      @Semantics.systemDateTime.lastChangedAt: true
     LastChangedAt ,
      
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZTBOOKING_A_960_I,
      _Currency,
      _Customer,
      _OverStatus
}
