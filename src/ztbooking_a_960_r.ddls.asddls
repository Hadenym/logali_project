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
  
  association [1..1] to /DMO/I_Customer as _Customer on $projection.CustomerID = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier as _Carrier on $projection.AirlineID = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection as _Connection on $projection.ConnectionId = _Connection.ConnectionID
                                                            and $projection.AirlineID = _Connection.AirlineID
 association [1..1] to /DMO/I_Booking_Status_VH as _BookingStatus on $projection.BookingStatus = _BookingStatus.BookingStatus                                
  
{
  key booking_uuid   as BookingUUID,
      parent_uuid    as TravelUUID,
      booking_id     as BookingID,
      booking_date   as BookingDate,
      customer_id    as CustomerID,
      carrier_id     as AirlineID,
      connection_id  as ConnectionId,
      flight_date    as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price   as FlightPrice,
      currency_code  as CurrencyCode,
      booking_status as BookingStatus,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_change_at as LastChangeAt,
      
      _Travel,
      _BookingSupplement,
      _Customer,
      _Carrier,
      _Connection,
      _BookingStatus
}
