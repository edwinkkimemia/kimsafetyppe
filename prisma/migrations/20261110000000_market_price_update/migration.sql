-- Individual market-price corrections (Recommended sheet).
-- One-time: safe to apply once; future admin edits are untouched.

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(350), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"350","savings":"Standard"},{"qty":"10 – 49","price":"333","savings":"5% off"},{"qty":"50 – 199","price":"319","savings":"9% off"},{"qty":"200+","price":"305","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0255';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1700), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,700","savings":"Standard"},{"qty":"10 – 49","price":"1,615","savings":"5% off"},{"qty":"50 – 199","price":"1,547","savings":"9% off"},{"qty":"200+","price":"1,479","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-PPE-3008';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(7000), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"7,000","savings":"Standard"},{"qty":"10 – 49","price":"6,650","savings":"5% off"},{"qty":"50 – 199","price":"6,370","savings":"9% off"},{"qty":"200+","price":"6,090","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0068';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(4000), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"4,000","savings":"Standard"},{"qty":"10 – 49","price":"3,800","savings":"5% off"},{"qty":"50 – 199","price":"3,640","savings":"9% off"},{"qty":"200+","price":"3,480","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0073';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(550), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"550","savings":"Standard"},{"qty":"10 – 49","price":"523","savings":"5% off"},{"qty":"50 – 199","price":"501","savings":"9% off"},{"qty":"200+","price":"479","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-PPE-3022';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(750), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"750","savings":"Standard"},{"qty":"10 – 49","price":"713","savings":"5% off"},{"qty":"50 – 199","price":"683","savings":"9% off"},{"qty":"200+","price":"653","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0032';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(4500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"4,500","savings":"Standard"},{"qty":"10 – 49","price":"4,275","savings":"5% off"},{"qty":"50 – 199","price":"4,095","savings":"9% off"},{"qty":"200+","price":"3,915","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-PPE-3053';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1450), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,450","savings":"Standard"},{"qty":"10 – 49","price":"1,378","savings":"5% off"},{"qty":"50 – 199","price":"1,320","savings":"9% off"},{"qty":"200+","price":"1,262","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-SIG-1311';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(2500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"2,500","savings":"Standard"},{"qty":"10 – 49","price":"2,375","savings":"5% off"},{"qty":"50 – 199","price":"2,275","savings":"9% off"},{"qty":"200+","price":"2,175","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0229';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(10500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"10,500","savings":"Standard"},{"qty":"10 – 49","price":"9,975","savings":"5% off"},{"qty":"50 – 199","price":"9,555","savings":"9% off"},{"qty":"200+","price":"9,135","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0183';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3000), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,000","savings":"Standard"},{"qty":"10 – 49","price":"2,850","savings":"5% off"},{"qty":"50 – 199","price":"2,730","savings":"9% off"},{"qty":"200+","price":"2,610","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0085';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(600), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"600","savings":"Standard"},{"qty":"10 – 49","price":"570","savings":"5% off"},{"qty":"50 – 199","price":"546","savings":"9% off"},{"qty":"200+","price":"522","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0036';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"200","savings":"Standard"},{"qty":"10 – 49","price":"190","savings":"5% off"},{"qty":"50 – 199","price":"182","savings":"9% off"},{"qty":"200+","price":"174","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-SEC-1106';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(2300), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"2,300","savings":"Standard"},{"qty":"10 – 49","price":"2,185","savings":"5% off"},{"qty":"50 – 199","price":"2,093","savings":"9% off"},{"qty":"200+","price":"2,001","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IND-2019';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,500","savings":"Standard"},{"qty":"10 – 49","price":"1,425","savings":"5% off"},{"qty":"50 – 199","price":"1,365","savings":"9% off"},{"qty":"200+","price":"1,305","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0072';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(9500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"9,500","savings":"Standard"},{"qty":"10 – 49","price":"9,025","savings":"5% off"},{"qty":"50 – 199","price":"8,645","savings":"9% off"},{"qty":"200+","price":"8,265","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0093';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1600), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,600","savings":"Standard"},{"qty":"10 – 49","price":"1,520","savings":"5% off"},{"qty":"50 – 199","price":"1,456","savings":"9% off"},{"qty":"200+","price":"1,392","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0191';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,500","savings":"Standard"},{"qty":"10 – 49","price":"3,325","savings":"5% off"},{"qty":"50 – 199","price":"3,185","savings":"9% off"},{"qty":"200+","price":"3,045","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0055';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3800), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,800","savings":"Standard"},{"qty":"10 – 49","price":"3,610","savings":"5% off"},{"qty":"50 – 199","price":"3,458","savings":"9% off"},{"qty":"200+","price":"3,306","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0047';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3000), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,000","savings":"Standard"},{"qty":"10 – 49","price":"2,850","savings":"5% off"},{"qty":"50 – 199","price":"2,730","savings":"9% off"},{"qty":"200+","price":"2,610","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0027';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(400), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"400","savings":"Standard"},{"qty":"10 – 49","price":"380","savings":"5% off"},{"qty":"50 – 199","price":"364","savings":"9% off"},{"qty":"200+","price":"348","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0165';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1000), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,000","savings":"Standard"},{"qty":"10 – 49","price":"950","savings":"5% off"},{"qty":"50 – 199","price":"910","savings":"9% off"},{"qty":"200+","price":"870","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-FOO-1204';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(800), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"800","savings":"Standard"},{"qty":"10 – 49","price":"760","savings":"5% off"},{"qty":"50 – 199","price":"728","savings":"9% off"},{"qty":"200+","price":"696","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0079';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"500","savings":"Standard"},{"qty":"10 – 49","price":"475","savings":"5% off"},{"qty":"50 – 199","price":"455","savings":"9% off"},{"qty":"200+","price":"435","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0335';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(300), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"300","savings":"Standard"},{"qty":"10 – 49","price":"285","savings":"5% off"},{"qty":"50 – 199","price":"273","savings":"9% off"},{"qty":"200+","price":"261","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0275';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1300), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,300","savings":"Standard"},{"qty":"10 – 49","price":"1,235","savings":"5% off"},{"qty":"50 – 199","price":"1,183","savings":"9% off"},{"qty":"200+","price":"1,131","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0060';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(950), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"950","savings":"Standard"},{"qty":"10 – 49","price":"903","savings":"5% off"},{"qty":"50 – 199","price":"865","savings":"9% off"},{"qty":"200+","price":"827","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-PPE-3045';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(800), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"800","savings":"Standard"},{"qty":"10 – 49","price":"760","savings":"5% off"},{"qty":"50 – 199","price":"728","savings":"9% off"},{"qty":"200+","price":"696","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0142';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(600), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"600","savings":"Standard"},{"qty":"10 – 49","price":"570","savings":"5% off"},{"qty":"50 – 199","price":"546","savings":"9% off"},{"qty":"200+","price":"522","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0007';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3000), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,000","savings":"Standard"},{"qty":"10 – 49","price":"2,850","savings":"5% off"},{"qty":"50 – 199","price":"2,730","savings":"9% off"},{"qty":"200+","price":"2,610","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0212';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3000), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,000","savings":"Standard"},{"qty":"10 – 49","price":"2,850","savings":"5% off"},{"qty":"50 – 199","price":"2,730","savings":"9% off"},{"qty":"200+","price":"2,610","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0049';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(750), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"750","savings":"Standard"},{"qty":"10 – 49","price":"713","savings":"5% off"},{"qty":"50 – 199","price":"683","savings":"9% off"},{"qty":"200+","price":"653","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-CLN-8002';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(350), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"350","savings":"Standard"},{"qty":"10 – 49","price":"333","savings":"5% off"},{"qty":"50 – 199","price":"319","savings":"9% off"},{"qty":"200+","price":"305","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0259';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(2800), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"2,800","savings":"Standard"},{"qty":"10 – 49","price":"2,660","savings":"5% off"},{"qty":"50 – 199","price":"2,548","savings":"9% off"},{"qty":"200+","price":"2,436","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0222';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3800), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,800","savings":"Standard"},{"qty":"10 – 49","price":"3,610","savings":"5% off"},{"qty":"50 – 199","price":"3,458","savings":"9% off"},{"qty":"200+","price":"3,306","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IND-2021';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(600), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"600","savings":"Standard"},{"qty":"10 – 49","price":"570","savings":"5% off"},{"qty":"50 – 199","price":"546","savings":"9% off"},{"qty":"200+","price":"522","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-ROA-5008';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(350), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"350","savings":"Standard"},{"qty":"10 – 49","price":"333","savings":"5% off"},{"qty":"50 – 199","price":"319","savings":"9% off"},{"qty":"200+","price":"305","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0287';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(2500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"2,500","savings":"Standard"},{"qty":"10 – 49","price":"2,375","savings":"5% off"},{"qty":"50 – 199","price":"2,275","savings":"9% off"},{"qty":"200+","price":"2,175","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0088';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3000), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,000","savings":"Standard"},{"qty":"10 – 49","price":"2,850","savings":"5% off"},{"qty":"50 – 199","price":"2,730","savings":"9% off"},{"qty":"200+","price":"2,610","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-PPE-3001';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,500","savings":"Standard"},{"qty":"10 – 49","price":"1,425","savings":"5% off"},{"qty":"50 – 199","price":"1,365","savings":"9% off"},{"qty":"200+","price":"1,305","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-FIR-4002';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(350), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"350","savings":"Standard"},{"qty":"10 – 49","price":"333","savings":"5% off"},{"qty":"50 – 199","price":"319","savings":"9% off"},{"qty":"200+","price":"305","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0156';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(450), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"450","savings":"Standard"},{"qty":"10 – 49","price":"428","savings":"5% off"},{"qty":"50 – 199","price":"410","savings":"9% off"},{"qty":"200+","price":"392","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0018';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,200","savings":"Standard"},{"qty":"10 – 49","price":"1,140","savings":"5% off"},{"qty":"50 – 199","price":"1,092","savings":"9% off"},{"qty":"200+","price":"1,044","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-PPE-3014';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(2200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"2,200","savings":"Standard"},{"qty":"10 – 49","price":"2,090","savings":"5% off"},{"qty":"50 – 199","price":"2,002","savings":"9% off"},{"qty":"200+","price":"1,914","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0214';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,200","savings":"Standard"},{"qty":"10 – 49","price":"3,040","savings":"5% off"},{"qty":"50 – 199","price":"2,912","savings":"9% off"},{"qty":"200+","price":"2,784","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0278';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(2700), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"2,700","savings":"Standard"},{"qty":"10 – 49","price":"2,565","savings":"5% off"},{"qty":"50 – 199","price":"2,457","savings":"9% off"},{"qty":"200+","price":"2,349","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-SIG-1303';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3800), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,800","savings":"Standard"},{"qty":"10 – 49","price":"3,610","savings":"5% off"},{"qty":"50 – 199","price":"3,458","savings":"9% off"},{"qty":"200+","price":"3,306","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IND-2002';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(18000), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"18,000","savings":"Standard"},{"qty":"10 – 49","price":"17,100","savings":"5% off"},{"qty":"50 – 199","price":"16,380","savings":"9% off"},{"qty":"200+","price":"15,660","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-CON-6001';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3800), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,800","savings":"Standard"},{"qty":"10 – 49","price":"3,610","savings":"5% off"},{"qty":"50 – 199","price":"3,458","savings":"9% off"},{"qty":"200+","price":"3,306","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0282';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,200","savings":"Standard"},{"qty":"10 – 49","price":"1,140","savings":"5% off"},{"qty":"50 – 199","price":"1,092","savings":"9% off"},{"qty":"200+","price":"1,044","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0034';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(400), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"400","savings":"Standard"},{"qty":"10 – 49","price":"380","savings":"5% off"},{"qty":"50 – 199","price":"364","savings":"9% off"},{"qty":"200+","price":"348","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-PPE-3025';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3000), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,000","savings":"Standard"},{"qty":"10 – 49","price":"2,850","savings":"5% off"},{"qty":"50 – 199","price":"2,730","savings":"9% off"},{"qty":"200+","price":"2,610","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-PPE-3056';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"500","savings":"Standard"},{"qty":"10 – 49","price":"475","savings":"5% off"},{"qty":"50 – 199","price":"455","savings":"9% off"},{"qty":"200+","price":"435","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0263';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3800), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,800","savings":"Standard"},{"qty":"10 – 49","price":"3,610","savings":"5% off"},{"qty":"50 – 199","price":"3,458","savings":"9% off"},{"qty":"200+","price":"3,306","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IND-2010';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"500","savings":"Standard"},{"qty":"10 – 49","price":"475","savings":"5% off"},{"qty":"50 – 199","price":"455","savings":"9% off"},{"qty":"200+","price":"435","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0096';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,500","savings":"Standard"},{"qty":"10 – 49","price":"3,325","savings":"5% off"},{"qty":"50 – 199","price":"3,185","savings":"9% off"},{"qty":"200+","price":"3,045","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0030';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,200","savings":"Standard"},{"qty":"10 – 49","price":"1,140","savings":"5% off"},{"qty":"50 – 199","price":"1,092","savings":"9% off"},{"qty":"200+","price":"1,044","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0020';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1400), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,400","savings":"Standard"},{"qty":"10 – 49","price":"1,330","savings":"5% off"},{"qty":"50 – 199","price":"1,274","savings":"9% off"},{"qty":"200+","price":"1,218","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0046';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(600), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"600","savings":"Standard"},{"qty":"10 – 49","price":"570","savings":"5% off"},{"qty":"50 – 199","price":"546","savings":"9% off"},{"qty":"200+","price":"522","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0245';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(58000), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"58,000","savings":"Standard"},{"qty":"10 – 49","price":"55,100","savings":"5% off"},{"qty":"50 – 199","price":"52,780","savings":"9% off"},{"qty":"200+","price":"50,460","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0170';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3800), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,800","savings":"Standard"},{"qty":"10 – 49","price":"3,610","savings":"5% off"},{"qty":"50 – 199","price":"3,458","savings":"9% off"},{"qty":"200+","price":"3,306","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-EMR-9005';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,500","savings":"Standard"},{"qty":"10 – 49","price":"1,425","savings":"5% off"},{"qty":"50 – 199","price":"1,365","savings":"9% off"},{"qty":"200+","price":"1,305","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0242';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(400), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"400","savings":"Standard"},{"qty":"10 – 49","price":"380","savings":"5% off"},{"qty":"50 – 199","price":"364","savings":"9% off"},{"qty":"200+","price":"348","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0148';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(750), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"750","savings":"Standard"},{"qty":"10 – 49","price":"713","savings":"5% off"},{"qty":"50 – 199","price":"683","savings":"9% off"},{"qty":"200+","price":"653","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-PPE-3040';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(4000), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"4,000","savings":"Standard"},{"qty":"10 – 49","price":"3,800","savings":"5% off"},{"qty":"50 – 199","price":"3,640","savings":"9% off"},{"qty":"200+","price":"3,480","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0139';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(850), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"850","savings":"Standard"},{"qty":"10 – 49","price":"808","savings":"5% off"},{"qty":"50 – 199","price":"774","savings":"9% off"},{"qty":"200+","price":"740","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0176';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1800), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,800","savings":"Standard"},{"qty":"10 – 49","price":"1,710","savings":"5% off"},{"qty":"50 – 199","price":"1,638","savings":"9% off"},{"qty":"200+","price":"1,566","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-PPE-3006';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(2300), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"2,300","savings":"Standard"},{"qty":"10 – 49","price":"2,185","savings":"5% off"},{"qty":"50 – 199","price":"2,093","savings":"9% off"},{"qty":"200+","price":"2,001","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0177';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(5000), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"5,000","savings":"Standard"},{"qty":"10 – 49","price":"4,750","savings":"5% off"},{"qty":"50 – 199","price":"4,550","savings":"9% off"},{"qty":"200+","price":"4,350","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-SEC-1108';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1100), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,100","savings":"Standard"},{"qty":"10 – 49","price":"1,045","savings":"5% off"},{"qty":"50 – 199","price":"1,001","savings":"9% off"},{"qty":"200+","price":"957","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IND-2008';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,200","savings":"Standard"},{"qty":"10 – 49","price":"3,040","savings":"5% off"},{"qty":"50 – 199","price":"2,912","savings":"9% off"},{"qty":"200+","price":"2,784","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0161';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(6500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"6,500","savings":"Standard"},{"qty":"10 – 49","price":"6,175","savings":"5% off"},{"qty":"50 – 199","price":"5,915","savings":"9% off"},{"qty":"200+","price":"5,655","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0100';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(100), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"100","savings":"Standard"},{"qty":"10 – 49","price":"95","savings":"5% off"},{"qty":"50 – 199","price":"91","savings":"9% off"},{"qty":"200+","price":"87","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-PPE-3029';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(350), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"350","savings":"Standard"},{"qty":"10 – 49","price":"333","savings":"5% off"},{"qty":"50 – 199","price":"319","savings":"9% off"},{"qty":"200+","price":"305","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0250';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"500","savings":"Standard"},{"qty":"10 – 49","price":"475","savings":"5% off"},{"qty":"50 – 199","price":"455","savings":"9% off"},{"qty":"200+","price":"435","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0344';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"200","savings":"Standard"},{"qty":"10 – 49","price":"190","savings":"5% off"},{"qty":"50 – 199","price":"182","savings":"9% off"},{"qty":"200+","price":"174","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0006';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,200","savings":"Standard"},{"qty":"10 – 49","price":"3,040","savings":"5% off"},{"qty":"50 – 199","price":"2,912","savings":"9% off"},{"qty":"200+","price":"2,784","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0258';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1800), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,800","savings":"Standard"},{"qty":"10 – 49","price":"1,710","savings":"5% off"},{"qty":"50 – 199","price":"1,638","savings":"9% off"},{"qty":"200+","price":"1,566","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IND-2013';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(350), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"350","savings":"Standard"},{"qty":"10 – 49","price":"333","savings":"5% off"},{"qty":"50 – 199","price":"319","savings":"9% off"},{"qty":"200+","price":"305","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0238';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(550), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"550","savings":"Standard"},{"qty":"10 – 49","price":"523","savings":"5% off"},{"qty":"50 – 199","price":"501","savings":"9% off"},{"qty":"200+","price":"479","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0215';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,200","savings":"Standard"},{"qty":"10 – 49","price":"1,140","savings":"5% off"},{"qty":"50 – 199","price":"1,092","savings":"9% off"},{"qty":"200+","price":"1,044","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0209';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1000), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,000","savings":"Standard"},{"qty":"10 – 49","price":"950","savings":"5% off"},{"qty":"50 – 199","price":"910","savings":"9% off"},{"qty":"200+","price":"870","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-SEC-1102';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"200","savings":"Standard"},{"qty":"10 – 49","price":"190","savings":"5% off"},{"qty":"50 – 199","price":"182","savings":"9% off"},{"qty":"200+","price":"174","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0061';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1900), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,900","savings":"Standard"},{"qty":"10 – 49","price":"1,805","savings":"5% off"},{"qty":"50 – 199","price":"1,729","savings":"9% off"},{"qty":"200+","price":"1,653","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-SIG-1306';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(100), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"100","savings":"Standard"},{"qty":"10 – 49","price":"95","savings":"5% off"},{"qty":"50 – 199","price":"91","savings":"9% off"},{"qty":"200+","price":"87","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0308';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1800), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,800","savings":"Standard"},{"qty":"10 – 49","price":"1,710","savings":"5% off"},{"qty":"50 – 199","price":"1,638","savings":"9% off"},{"qty":"200+","price":"1,566","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0031';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(600), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"600","savings":"Standard"},{"qty":"10 – 49","price":"570","savings":"5% off"},{"qty":"50 – 199","price":"546","savings":"9% off"},{"qty":"200+","price":"522","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-PPE-3020';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(800), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"800","savings":"Standard"},{"qty":"10 – 49","price":"760","savings":"5% off"},{"qty":"50 – 199","price":"728","savings":"9% off"},{"qty":"200+","price":"696","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0155';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,200","savings":"Standard"},{"qty":"10 – 49","price":"3,040","savings":"5% off"},{"qty":"50 – 199","price":"2,912","savings":"9% off"},{"qty":"200+","price":"2,784","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0023';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,200","savings":"Standard"},{"qty":"10 – 49","price":"1,140","savings":"5% off"},{"qty":"50 – 199","price":"1,092","savings":"9% off"},{"qty":"200+","price":"1,044","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0033';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(300), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"300","savings":"Standard"},{"qty":"10 – 49","price":"285","savings":"5% off"},{"qty":"50 – 199","price":"273","savings":"9% off"},{"qty":"200+","price":"261","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-FOO-1210';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(2100), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"2,100","savings":"Standard"},{"qty":"10 – 49","price":"1,995","savings":"5% off"},{"qty":"50 – 199","price":"1,911","savings":"9% off"},{"qty":"200+","price":"1,827","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0224';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(2500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"2,500","savings":"Standard"},{"qty":"10 – 49","price":"2,375","savings":"5% off"},{"qty":"50 – 199","price":"2,275","savings":"9% off"},{"qty":"200+","price":"2,175","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0062';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1800), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,800","savings":"Standard"},{"qty":"10 – 49","price":"1,710","savings":"5% off"},{"qty":"50 – 199","price":"1,638","savings":"9% off"},{"qty":"200+","price":"1,566","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0138';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1700), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,700","savings":"Standard"},{"qty":"10 – 49","price":"1,615","savings":"5% off"},{"qty":"50 – 199","price":"1,547","savings":"9% off"},{"qty":"200+","price":"1,479","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-SIG-1312';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"200","savings":"Standard"},{"qty":"10 – 49","price":"190","savings":"5% off"},{"qty":"50 – 199","price":"182","savings":"9% off"},{"qty":"200+","price":"174","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0251';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"500","savings":"Standard"},{"qty":"10 – 49","price":"475","savings":"5% off"},{"qty":"50 – 199","price":"455","savings":"9% off"},{"qty":"200+","price":"435","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0044';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(400), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"400","savings":"Standard"},{"qty":"10 – 49","price":"380","savings":"5% off"},{"qty":"50 – 199","price":"364","savings":"9% off"},{"qty":"200+","price":"348","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-PPE-3002';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(18000), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"18,000","savings":"Standard"},{"qty":"10 – 49","price":"17,100","savings":"5% off"},{"qty":"50 – 199","price":"16,380","savings":"9% off"},{"qty":"200+","price":"15,660","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0195';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1800), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,800","savings":"Standard"},{"qty":"10 – 49","price":"1,710","savings":"5% off"},{"qty":"50 – 199","price":"1,638","savings":"9% off"},{"qty":"200+","price":"1,566","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-PPE-3031';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1000), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,000","savings":"Standard"},{"qty":"10 – 49","price":"950","savings":"5% off"},{"qty":"50 – 199","price":"910","savings":"9% off"},{"qty":"200+","price":"870","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0010';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(300), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"300","savings":"Standard"},{"qty":"10 – 49","price":"285","savings":"5% off"},{"qty":"50 – 199","price":"273","savings":"9% off"},{"qty":"200+","price":"261","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0279';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(2200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"2,200","savings":"Standard"},{"qty":"10 – 49","price":"2,090","savings":"5% off"},{"qty":"50 – 199","price":"2,002","savings":"9% off"},{"qty":"200+","price":"1,914","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-CON-6007';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(2700), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"2,700","savings":"Standard"},{"qty":"10 – 49","price":"2,565","savings":"5% off"},{"qty":"50 – 199","price":"2,457","savings":"9% off"},{"qty":"200+","price":"2,349","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0124';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(2300), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"2,300","savings":"Standard"},{"qty":"10 – 49","price":"2,185","savings":"5% off"},{"qty":"50 – 199","price":"2,093","savings":"9% off"},{"qty":"200+","price":"2,001","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-PPE-3043';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(2100), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"2,100","savings":"Standard"},{"qty":"10 – 49","price":"1,995","savings":"5% off"},{"qty":"50 – 199","price":"1,911","savings":"9% off"},{"qty":"200+","price":"1,827","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-PPE-3010';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(800), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"800","savings":"Standard"},{"qty":"10 – 49","price":"760","savings":"5% off"},{"qty":"50 – 199","price":"728","savings":"9% off"},{"qty":"200+","price":"696","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-MED-1007';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(250), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"250","savings":"Standard"},{"qty":"10 – 49","price":"238","savings":"5% off"},{"qty":"50 – 199","price":"228","savings":"9% off"},{"qty":"200+","price":"218","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0025';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,200","savings":"Standard"},{"qty":"10 – 49","price":"1,140","savings":"5% off"},{"qty":"50 – 199","price":"1,092","savings":"9% off"},{"qty":"200+","price":"1,044","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-PPE-3013';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(2000), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"2,000","savings":"Standard"},{"qty":"10 – 49","price":"1,900","savings":"5% off"},{"qty":"50 – 199","price":"1,820","savings":"9% off"},{"qty":"200+","price":"1,740","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0158';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(2700), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"2,700","savings":"Standard"},{"qty":"10 – 49","price":"2,565","savings":"5% off"},{"qty":"50 – 199","price":"2,457","savings":"9% off"},{"qty":"200+","price":"2,349","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0084';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3800), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,800","savings":"Standard"},{"qty":"10 – 49","price":"3,610","savings":"5% off"},{"qty":"50 – 199","price":"3,458","savings":"9% off"},{"qty":"200+","price":"3,306","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0120';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(300), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"300","savings":"Standard"},{"qty":"10 – 49","price":"285","savings":"5% off"},{"qty":"50 – 199","price":"273","savings":"9% off"},{"qty":"200+","price":"261","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0267';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3300), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,300","savings":"Standard"},{"qty":"10 – 49","price":"3,135","savings":"5% off"},{"qty":"50 – 199","price":"3,003","savings":"9% off"},{"qty":"200+","price":"2,871","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0054';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(2300), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"2,300","savings":"Standard"},{"qty":"10 – 49","price":"2,185","savings":"5% off"},{"qty":"50 – 199","price":"2,093","savings":"9% off"},{"qty":"200+","price":"2,001","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0190';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(2200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"2,200","savings":"Standard"},{"qty":"10 – 49","price":"2,090","savings":"5% off"},{"qty":"50 – 199","price":"2,002","savings":"9% off"},{"qty":"200+","price":"1,914","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-PPE-3044';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1000), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,000","savings":"Standard"},{"qty":"10 – 49","price":"950","savings":"5% off"},{"qty":"50 – 199","price":"910","savings":"9% off"},{"qty":"200+","price":"870","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-PPE-3038';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(800), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"800","savings":"Standard"},{"qty":"10 – 49","price":"760","savings":"5% off"},{"qty":"50 – 199","price":"728","savings":"9% off"},{"qty":"200+","price":"696","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0159';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,200","savings":"Standard"},{"qty":"10 – 49","price":"1,140","savings":"5% off"},{"qty":"50 – 199","price":"1,092","savings":"9% off"},{"qty":"200+","price":"1,044","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0097';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3000), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,000","savings":"Standard"},{"qty":"10 – 49","price":"2,850","savings":"5% off"},{"qty":"50 – 199","price":"2,730","savings":"9% off"},{"qty":"200+","price":"2,610","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0249';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(4200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"4,200","savings":"Standard"},{"qty":"10 – 49","price":"3,990","savings":"5% off"},{"qty":"50 – 199","price":"3,822","savings":"9% off"},{"qty":"200+","price":"3,654","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-FIR-4005';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1600), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,600","savings":"Standard"},{"qty":"10 – 49","price":"1,520","savings":"5% off"},{"qty":"50 – 199","price":"1,456","savings":"9% off"},{"qty":"200+","price":"1,392","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0095';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(850), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"850","savings":"Standard"},{"qty":"10 – 49","price":"808","savings":"5% off"},{"qty":"50 – 199","price":"774","savings":"9% off"},{"qty":"200+","price":"740","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0162';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(7500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"7,500","savings":"Standard"},{"qty":"10 – 49","price":"7,125","savings":"5% off"},{"qty":"50 – 199","price":"6,825","savings":"9% off"},{"qty":"200+","price":"6,525","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0016';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(2500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"2,500","savings":"Standard"},{"qty":"10 – 49","price":"2,375","savings":"5% off"},{"qty":"50 – 199","price":"2,275","savings":"9% off"},{"qty":"200+","price":"2,175","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0009';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1800), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,800","savings":"Standard"},{"qty":"10 – 49","price":"1,710","savings":"5% off"},{"qty":"50 – 199","price":"1,638","savings":"9% off"},{"qty":"200+","price":"1,566","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-PPE-3058';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(4700), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"4,700","savings":"Standard"},{"qty":"10 – 49","price":"4,465","savings":"5% off"},{"qty":"50 – 199","price":"4,277","savings":"9% off"},{"qty":"200+","price":"4,089","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IND-2009';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,500","savings":"Standard"},{"qty":"10 – 49","price":"3,325","savings":"5% off"},{"qty":"50 – 199","price":"3,185","savings":"9% off"},{"qty":"200+","price":"3,045","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-EMR-9001';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(2700), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"2,700","savings":"Standard"},{"qty":"10 – 49","price":"2,565","savings":"5% off"},{"qty":"50 – 199","price":"2,457","savings":"9% off"},{"qty":"200+","price":"2,349","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IND-2014';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,200","savings":"Standard"},{"qty":"10 – 49","price":"1,140","savings":"5% off"},{"qty":"50 – 199","price":"1,092","savings":"9% off"},{"qty":"200+","price":"1,044","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0141';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(2700), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"2,700","savings":"Standard"},{"qty":"10 – 49","price":"2,565","savings":"5% off"},{"qty":"50 – 199","price":"2,457","savings":"9% off"},{"qty":"200+","price":"2,349","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0086';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,500","savings":"Standard"},{"qty":"10 – 49","price":"1,425","savings":"5% off"},{"qty":"50 – 199","price":"1,365","savings":"9% off"},{"qty":"200+","price":"1,305","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0172';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,500","savings":"Standard"},{"qty":"10 – 49","price":"1,425","savings":"5% off"},{"qty":"50 – 199","price":"1,365","savings":"9% off"},{"qty":"200+","price":"1,305","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0076';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3000), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,000","savings":"Standard"},{"qty":"10 – 49","price":"2,850","savings":"5% off"},{"qty":"50 – 199","price":"2,730","savings":"9% off"},{"qty":"200+","price":"2,610","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-PPE-3049';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(350), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"350","savings":"Standard"},{"qty":"10 – 49","price":"333","savings":"5% off"},{"qty":"50 – 199","price":"319","savings":"9% off"},{"qty":"200+","price":"305","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0244';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,500","savings":"Standard"},{"qty":"10 – 49","price":"1,425","savings":"5% off"},{"qty":"50 – 199","price":"1,365","savings":"9% off"},{"qty":"200+","price":"1,305","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0220';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(5000), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"5,000","savings":"Standard"},{"qty":"10 – 49","price":"4,750","savings":"5% off"},{"qty":"50 – 199","price":"4,550","savings":"9% off"},{"qty":"200+","price":"4,350","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-SEC-1109';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"200","savings":"Standard"},{"qty":"10 – 49","price":"190","savings":"5% off"},{"qty":"50 – 199","price":"182","savings":"9% off"},{"qty":"200+","price":"174","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0087';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"200","savings":"Standard"},{"qty":"10 – 49","price":"190","savings":"5% off"},{"qty":"50 – 199","price":"182","savings":"9% off"},{"qty":"200+","price":"174","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0008';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(400), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"400","savings":"Standard"},{"qty":"10 – 49","price":"380","savings":"5% off"},{"qty":"50 – 199","price":"364","savings":"9% off"},{"qty":"200+","price":"348","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0271';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3200), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,200","savings":"Standard"},{"qty":"10 – 49","price":"3,040","savings":"5% off"},{"qty":"50 – 199","price":"2,912","savings":"9% off"},{"qty":"200+","price":"2,784","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0144';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3800), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,800","savings":"Standard"},{"qty":"10 – 49","price":"3,610","savings":"5% off"},{"qty":"50 – 199","price":"3,458","savings":"9% off"},{"qty":"200+","price":"3,306","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IND-2011';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1100), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,100","savings":"Standard"},{"qty":"10 – 49","price":"1,045","savings":"5% off"},{"qty":"50 – 199","price":"1,001","savings":"9% off"},{"qty":"200+","price":"957","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0003';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(3500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"3,500","savings":"Standard"},{"qty":"10 – 49","price":"3,325","savings":"5% off"},{"qty":"50 – 199","price":"3,185","savings":"9% off"},{"qty":"200+","price":"3,045","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0021';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"500","savings":"Standard"},{"qty":"10 – 49","price":"475","savings":"5% off"},{"qty":"50 – 199","price":"455","savings":"9% off"},{"qty":"200+","price":"435","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0332';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(800), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"800","savings":"Standard"},{"qty":"10 – 49","price":"760","savings":"5% off"},{"qty":"50 – 199","price":"728","savings":"9% off"},{"qty":"200+","price":"696","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IND-2007';

UPDATE admin_products
SET data = jsonb_set(
  jsonb_set(data::jsonb, '{price}', to_jsonb(1500), true),
  '{bulk}', $bulk$[{"qty":"1 – 9","price":"1,500","savings":"Standard"},{"qty":"10 – 49","price":"1,425","savings":"5% off"},{"qty":"50 – 199","price":"1,365","savings":"9% off"},{"qty":"200+","price":"1,305","savings":"13% off"}]$bulk$::jsonb, true
)::text,
updated_at = to_char(now() at time zone 'utc', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
WHERE sku = 'KS-IMP-0024';
