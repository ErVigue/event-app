@EndUserText.label: 'Event'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI: { headerInfo: { typeName: 'Event', typeNamePlural: 'Events', title: { type: #STANDARD, value: 'EventName' } } }
@Search.searchable: true

define root view entity ZC_EVENT
  as projection on ZI_EVENT
{
      @UI.facet: [ { id:              'Event',
                     purpose:         #STANDARD,
                     type:            #IDENTIFICATION_REFERENCE,
                     label:           'Event',
                     position:        10 } ]
      @UI.hidden: true
  key event_uuid as EventUUID,


      @UI: { lineItem:       [ { position: 10, importance: #HIGH, label: 'Event ID' } ],
             identification: [ { position: 10, importance: #HIGH, label: 'Event ID' } ] }
      @ObjectModel.text.element: ['EventName']
      @Search.defaultSearchElement: true
      event_id   as EventID,

      @UI: { lineItem:       [ { position: 20, importance: #HIGH, label: 'Event Name' } ],
             identification: [ { position: 20, importance: #HIGH, label: 'Event Name' } ],
             selectionField: [ { position: 10 } ] }
      event_name as EventName,

      @UI: { lineItem:       [ { position: 30, importance: #MEDIUM, label: 'Location' } ],
             identification: [ { position: 30, importance: #MEDIUM, label: 'Location' } ],
             selectionField: [ { position: 20 } ] }
      location   as Location,

      @UI: { lineItem:       [ { position: 40, importance: #MEDIUM, label: 'Online' } ],
             identification: [ { position: 40, importance: #MEDIUM, label: 'Online' } ] }
      is_online  as IsOnline,

      @UI: { lineItem:       [ { position: 50, importance: #MEDIUM, label: 'Date From' } ],
             identification: [ { position: 50, importance: #MEDIUM, label: 'Date From' } ] }
      date_from  as DateFrom,

      @UI: { lineItem:       [ { position: 60, importance: #MEDIUM, label: 'Date To' } ],
             identification: [ { position: 60, importance: #MEDIUM, label: 'Date To' } ] }
      date_to    as DateTo
}
