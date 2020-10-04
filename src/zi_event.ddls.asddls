@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_EVENT
  as select from zevent as Event
{
  key event_uuid,
      event_id,
      event_name,
      location,
      is_online,
      date_from,
      date_to
}
