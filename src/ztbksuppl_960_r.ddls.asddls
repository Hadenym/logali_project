@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Sul'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZTBKSUPPL_960_R
  as select from ztbksuppl_960 
  association to parent ZTBOOKING_A_960_R as _Booking on $projection.BookingUUID = _Booking.BookingUUID
{
  key booksuppl_uuid        as BooksupplUUID,
      root_uuid             as TravelUUID,
      parent_uuid           as BookingUUID,
      booking_supplement_id as BookingSupplementID,
      supplement_id         as SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      _Booking
}
