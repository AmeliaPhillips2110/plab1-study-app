-- Run after all bank parts
select count(*) as sba_from_xlsx from public.questions
where exam_id = 'a1000000-0000-4000-8000-000000000001'
  and coalesce(payload->>'source','') = 'plab1-xlsx';

select t.name, count(*) as n
from public.questions q
left join public.topics t on t.id = q.topic_id
where q.exam_id = 'a1000000-0000-4000-8000-000000000001'
  and coalesce(q.payload->>'source','') = 'plab1-xlsx'
group by t.name
order by n desc;
