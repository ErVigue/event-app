CLASS zcl_event_gen_test_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_event_gen_test_data IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lt_event TYPE STANDARD TABLE OF zevent WITH EMPTY KEY.

    TRY.
        lt_event = VALUE #( ( event_uuid = cl_system_uuid=>create_uuid_x16_static( )
                              event_id   = 'E001'
                              event_name = 'SAP TechEd 2019'
                              location   = 'Las Vegas'
                              is_online  = abap_false
                              date_from  = '20190924'
                              date_to    = '20190927' )

                            ( event_uuid = cl_system_uuid=>create_uuid_x16_static( )
                              event_id   = 'E002'
                              event_name = 'SAP TechEd 2019'
                              location   = 'Barcelona'
                              is_online  = abap_false
                              date_from  = '20191008'
                              date_to    = '20191010' )

                            ( event_uuid = cl_system_uuid=>create_uuid_x16_static( )
                              event_id   = 'E003'
                              event_name = 'SAP TechEd 2019'
                              location   = 'Bangalore'
                              is_online  = abap_false
                              date_from  = '20191113'
                              date_to    = '20191115' )

                            ( event_uuid = cl_system_uuid=>create_uuid_x16_static( )
                              event_id   = 'E004'
                              event_name = 'SAP TechEd 2020'
                              location   = ''
                              is_online  = abap_true
                              date_from  = '20201208'
                              date_to    = '20201210' ) ).
      CATCH cx_uuid_error.
        "handle exception
    ENDTRY.

    DELETE FROM zevent.
    INSERT zevent FROM TABLE @lt_event.
    COMMIT WORK.

    out->write( |{ sy-dbcnt } entries modified| ).

  ENDMETHOD.

ENDCLASS.
