@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Interface'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZTBKSUPPL_960_I as projection on ZTBKSUPPL_960_R
{
    key BooksupplUUID,
    TravelUUID,
    BookingUUID,
    BookingSupplementID,
    SupplementID,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    CurrencyCode,
    LocalLastChangedAt,
    /* Associations */
    _Booking : redirected to parent ZTBOOKING_A_960_I,
    _Product,
    _SupplementText,
    _Travel: redirected to ZTTRAVEL_A_960_I 
}
