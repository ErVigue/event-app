CLASS lhc_zi_event DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

*    METHODS get_instance_features FOR INSTANCE FEATURES
*      IMPORTING keys REQUEST requested_features FOR Event RESULT result.

    METHODS get_global_authorization FOR GLOBAL AUTHORIZATION
      REQUEST requested_features FOR Event RESULT result.

ENDCLASS.

CLASS lhc_zi_event IMPLEMENTATION.

  METHOD get_global_authorization.
  ENDMETHOD.

ENDCLASS.
