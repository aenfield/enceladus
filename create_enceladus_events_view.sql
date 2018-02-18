drop view if exists enceladus_events;
create view enceladus_events as
select
    e.id
    ,e.title
    ,e.description
    ,e.time_stamp
    ,e.time_stamp::date as date
    ,et.description as event
from events e
inner join event_types et on et.id = e.event_type_id
where e.target_id = 28  -- Enceladus
order by e.time_stamp;