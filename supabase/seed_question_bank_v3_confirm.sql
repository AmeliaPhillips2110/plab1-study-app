-- After all v3 parts
select count(*) as v3_sba from public.questions
where exam_id='a1000000-0000-4000-8000-000000000001'
  and coalesce(payload->>'source','')='plab1-xlsx-v3';
select count(*) as v3_with_image from public.questions
where coalesce(payload->>'source','')='plab1-xlsx-v3'
  and coalesce(payload->>'image_url','')<>'';
-- Banks should remain additive
select coalesce(payload->>'source','(none)') as source, count(*) as n
from public.questions
where exam_id='a1000000-0000-4000-8000-000000000001'
  and question_type='sba'
  and is_active=true
group by 1
order by 1;
