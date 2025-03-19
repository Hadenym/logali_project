@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking - Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZTBOOKING_A_960_I
  as projection on ZTBOOKING_A_960_R
{
  key BookingUUID,
      TravelUUID,
      BookingID,
      BookingDate,
      CustomerID,
      AirlineID,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      LastChangeAt,
      /* Associations */
      _BookingStatus,
      _BookingSupplement : redirected to composition child ZTBKSUPPL_960_I,
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent ZTTRAVEL_A_960_I
}
