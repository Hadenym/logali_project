@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZTTRAVEL_A_960_R
  as select from zttravel_a_960
  composition [0..*] of ZTBOOKING_A_960_R as _Booking
  association  [0..1] to /DMO/I_Agency as _Agency on $projection.AgencyID = _Agency.AgencyID
  association [0..1] to /DMO/I_Customer as _Customer on $projection.CustomerId = _Customer.CustomerID 
  association [1..1] to /DMO/I_Overall_Status_VH as _OverStatus on $projection.OverallStatus = _OverStatus.OverallStatus
  association [0..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency
  {
  key travel_uuid           as TravelUUID,
      travel_id             as TravelID,
      agency_id             as AgencyID,
      customer_id           as CustomerId,
      begin_date            as BeginDate,
      end_date              as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee           as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price           as TotalPrice,
      currency_code         as CurrencyCode,
      description           as Description,
      overall_status        as OverallStatus,
      @Semantics.user.createdBy: true
      local_created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as CreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LastChangedAt,

      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LasChangedAt ,
      _Booking,
      _Agency,
      _Customer,
      _OverStatus,
      _Currency
}
