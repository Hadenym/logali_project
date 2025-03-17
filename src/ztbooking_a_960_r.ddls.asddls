@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZTBOOKING_A_960_R
  as select from ztbooking_a_960 
  
  association to parent ZTTRAVEL_A_960_R as _Travel on $projection.TravelUUID = _Travel.TravelUUID
  composition [0..*] of ZTBKSUPPL_960_R as _BookingSupplement 
{
  key booking_uuid   as BookingUUID,
      parent_uuid    as TravelUUID,
      booking_id     as BookingID,
      booking_date   as BookingDate,
      customer_id    as CustomerID,
      carrier_id     as CarrierID,
      connection_id  as ConnectionId,
      flight_date    as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price   as FlightPrice,
      currency_code  as CurrencyCode,
      booking_status as BookingStatus,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_change_at as LastChangeAt,
      
      _Travel,
      _BookingSupplement
}
