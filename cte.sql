-- jdbc:h2:mem:tsn;MV_STORE=FALSE
-- jdbc:h2:mem:tsn;MV_STORE=FALSE;DB_CLOSE_DELAY=-1

runscript from 'init.sql';

WITH cte(tsn,name,type,parent) as (
  select
    tsn,name,type,parent
  from taxnum
  WHERE tsn = '180092'
  union all
  select
    txn.tsn,txn.name,txn.type,txn.parent
  from taxnum txn
  inner join cte cte
  on txn.tsn = cte.parent
  where cte.parent is not null
)
SELECT tsn,name,type FROM cte
