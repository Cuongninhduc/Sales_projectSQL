
-- Sản phẩm (Sub-Category) được mua cùng nhau trong 1 đơn hàng nhiều nhất

use sales_projcet
go


with abc as
(select 
[Order ID] as OID, [Sub-Category] from dbo.['Sale Data$']
),

def as
(select 
[Order ID] as OID, [Sub-Category] from dbo.['Sale Data$']
)
 
 select   
		CONCAT(abc.[Sub-Category],'-',def.[Sub-Category]) as order1
		,count(abc.OID) as no_or

from abc cross join def
where abc.OID = def.OID and abc.[Sub-Category] <> def.[Sub-Category]
GROUP by CONCAT(abc.[Sub-Category],'-',def.[Sub-Category])
order by 2 desc


