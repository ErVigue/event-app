CLASS zcl_event_gen_test_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EVENT_GEN_TEST_DATA IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lt_event TYPE STANDARD TABLE OF zevent WITH EMPTY KEY.

    GET TIME STAMP FIELD DATA(lv_timestamp).

    TRY.
        lt_event = VALUE #( ( event_uuid      = cl_system_uuid=>create_uuid_x16_static( )
                              event_id        = 'E001'
                              event_name      = 'SAP TechEd 2019'
                              location        = 'Las Vegas'
                              is_online       = abap_false
                              date_from       = '20190924'
                              date_to         = '20190927'
                              last_changed_at = lv_timestamp )

                            ( event_uuid      = cl_system_uuid=>create_uuid_x16_static( )
                              event_id        = 'E002'
                              event_name      = 'SAP TechEd 2019'
                              location        = 'Barcelona'
                              is_online       = abap_false
                              date_from       = '20191008'
                              date_to         = '20191010'
                              last_changed_at = lv_timestamp )

                            ( event_uuid      = cl_system_uuid=>create_uuid_x16_static( )
                              event_id        = 'E003'
                              event_name      = 'SAP TechEd 2019'
                              location        = 'Bangalore'
                              is_online       = abap_false
                              date_from       = '20191113'
                              date_to         = '20191115'
                              last_changed_at = lv_timestamp )

                            ( event_uuid      = cl_system_uuid=>create_uuid_x16_static( )
                              event_id        = 'E004'
                              event_name      = 'SAP TechEd 2020'
                              location        = ''
                              is_online       = abap_true
                              date_from       = '20201208'
                              date_to         = '20201210'
                              last_changed_at = lv_timestamp ) ) ##NO_TEXT.
      CATCH cx_uuid_error.
        "handle exception
    ENDTRY.

    DELETE FROM zevent.                                 "#EC CI_NOWHERE
    INSERT zevent FROM TABLE @lt_event.
    COMMIT WORK.

    out->write( |{ sy-dbcnt } entries modified| ) ##NO_TEXT.

  ENDMETHOD.
ENDCLASS.
