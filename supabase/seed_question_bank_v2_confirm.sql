-- After all v2 parts
select count(*) as v2_sba from public.questions
where exam_id='a1000000-0000-4000-8000-000000000001'
  and coalesce(payload->>'source','')='plab1-xlsx-v2';
select count(*) as v2_with_image from public.questions
where coalesce(payload->>'source','')='plab1-xlsx-v2'
  and coalesce(payload->>'image_url','')<>'';
select name from public.topics
where exam_id='a1000000-0000-4000-8000-000000000001' and slug='neurology';
