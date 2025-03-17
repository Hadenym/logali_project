CLASS zcl_data_gen_rap_960 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_data_gen_rap_960 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  delete from zttravel_a_960.
  insert zttravel_a_960 from (
  SELECT from /dmo/travel
  FIELDS
      uuid(  ) as travel_uuid,
      travel_id,
      agency_id,
      customer_id,
      begin_date,
      end_date,
      booking_fee,
      total_price,
      currency_code,
      description,
      case status
        when 'B' then 'A'
        when 'P' then 'O'
        when 'N' then 'O'
        else 'X' END as overall_status,
      createdby as local_created_by,
      createdat as local_created_at,
      lastchangedby as local_las_changed_by,
      lastchangedat as local_las_changed_at
     " lastchangedat as last_changed_at

  ).

  delete from ZTBOOKING_A_960.
  insert ZTBOOKING_A_960 FROM (
    SELECT FROM /dmo/booking
    join zttravel_a_960 on /dmo/booking~travel_id = zttravel_a_960~travel_id
    join /dmo/travel on /dmo/travel~travel_id = /dmo/booking~travel_id
    fields
    uuid( ) as booking_uuid,
    zttravel_a_960~travel_uuid as parent_uuid,
    /dmo/booking~booking_id,
    /dmo/booking~booking_date,
    /dmo/booking~customer_id,
    /dmo/booking~carrier_id,
    /dmo/booking~connection_id,
    /dmo/booking~flight_date,
    /dmo/booking~flight_price,
    /dmo/booking~currency_code,
    case /dmo/travel~status
    when 'P' THEN 'N'
    else /dmo/travel~status end as booking_status,
    zttravel_a_960~last_changed_at as local_last_changed_at

  ).

  delete from ZTBKSUPPL_960.
  insert ZTBKSUPPL_960 from (
  SELECT from /dmo/book_suppl as suppl
  JOIN zttravel_a_960 as travel on travel~travel_id = suppl~travel_id
  JOIN ztbooking_a_960 as booking on booking~parent_uuid = travel~travel_uuid
                                and booking~booking_id = suppl~booking_id
  fields
  uuid(  ) as booksuppl_uuid,
  travel~travel_uuid as root_uuid,
  booking~booking_uuid as parent_uuid,
  suppl~booking_supplement_id ,
  suppl~supplement_id ,
  suppl~price ,
  suppl~currency_code ,
  travel~last_changed_at as local_last_changed_at

   ).




  ENDMETHOD.


ENDCLASS.
