replace into manufacturer(name)
select distinct TRIM(TRAILING ' motorcycles' FROM manufacturer) manufacturerName from model_hold_bikez;

insert into ms.category(name, nameeng)
select distinct attrValue, attrValue from ms.modelattribute_hold_bikez ma
where attrName = 'Category:' order by 1;

insert into ms.coolingtype(name, nameeng)
select distinct attrValue, attrValue from ms.modelattribute_hold_bikez ma
where attrName = 'Cooling system:' order by 1;

insert into ms.enginetype(name, nameeng)
select distinct attrValue, attrValue from ms.modelattribute_hold_bikez ma
where attrName = 'Engine type:' order by 1;

insert into ms.startertype(name, nameeng)
select distinct attrValue, attrValue from ms.modelattribute_hold_bikez ma
where attrName = 'Starter:' order by 1;

insert into ms.finaldrivetype(name, nameeng)
select distinct attrValue, attrValue from ms.modelattribute_hold_bikez ma
where attrName = 'Transmission type, final drive:' order by 1;

insert into ms.model(
  name,
  year,
  manufacturerId,
  categoryID,
  borestroke,
  compression,
  coolingTypeID,
  displacement,
  engine,
  engineeng,
  engineTypeID,
  lubrications,
  lubricationseng,
  maxRPM,
  oilcapacity,
  valverpercylinder,
  frame,
  frameeng,
  gearbox,
  gearboxeng,
  finaldriveTypeID,
  clutch,
  clutcheng,
  height,
  length,
  width,
  dryweight,
  wetweight,
  wheelbase,
  clearance,
  carrying,
  carryingeng,
  seatheight,
  altseatheight,
  seat,
  seateng,
  power,
  torque,
  powerweight,
  topspeed,
  acceleration100,
  acceleration60_140,
  quotertime,
  ignition,
  ignitioneng,
  starterTypeID,
  light,
  lighteng,
  emission,
  emissioneng,
  exhaust,
  exhausteng,
  co2,
  fuelcontrol,
  fuelcontroleng,
  fuelsystem,
  fuelsystemeng,
  fuelcapacity,
  reservefuel,
  consumtion,
  frontbrakesdiameter,
  frontbrakes,
  frontbrakeseng,
  rearbrakesdiameter,
  rearbrakes,
  rearbrakeseng,
  frontweightperc,
  frontsuspension,
  frontsuspensioneng,
  fronttravel,
  rearweightperc,
  rearsuspension,
  rearsuspensioneng,
  reartravel,
  fronttyre,
  fronttyreeng,
  reartyre,
  reartyreeng,
  wheels,
  wheelseng,
  rake,
  trail,
  driveline,
  drivelineeng,
  electrical,
  electricaleng,
  instruments,
  instrumentseng,
  modifications,
  modificationseng,
  price,
  colors,
  colorseng,
  comments,
  commentseng,
  consumption
)
select	trim(substring(m.modelname, length(mf.name)+1)),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Year:'),
		mf.id,
        c.id,
        (select substring(attrValue, 1, position(' mm' in attrValue)-1) from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Bore x stroke:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Compression:'),
        cool.id,
        (select substring(attrValue, 1, position(' ccm' in attrValue)-1) from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Displacement:'),
        (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Engine details:'),
        (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Engine details:'),
        e.id,
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Lubrication system:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Lubrication system:'),
        (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Max RPM:'),
        (select substring(attrValue, 1, position(' litres' in attrValue)-1) from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Oil capacity:'),
        (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Valves per cylinder:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Frame type:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Frame type:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Gearbox:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Gearbox:'),
        fd.id,
        (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Clutch:'),
        (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Clutch:'),  
		(select replace(substring(attrValue, 1, position(' mm' in attrValue)-1),',','') from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Overall height:'),
		(select replace(substring(attrValue, 1, position(' mm' in attrValue)-1),',','') from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Overall length:'),
		(select replace(substring(attrValue, 1, position(' mm' in attrValue)-1),',','') from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Overall width:'),
        (select replace(substring(attrValue, 1, position(' kg' in attrValue)-1),',','')  from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Dry weight:'),
        (select replace(substring(attrValue, 1, position(' kg' in attrValue)-1),',','')  from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Weight incl. oil, gas, etc:'), 
		(select replace(substring(attrValue, 1, position(' mm' in attrValue)-1),',','') from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Wheelbase:'),
        (select replace(substring(attrValue, 1, position(' mm' in attrValue)-1),',','') from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Ground clearance:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Carrying capacity:'),  
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Carrying capacity:'),  
		(select replace(substring(attrValue, 1, position(' mm' in attrValue)-1),',','') from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Seat height:'),
		(select replace(substring(attrValue, 1, position(' mm' in attrValue)-1),',','') from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Alternate seat height:'),  
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Seat:'),  
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Seat:'), 
        (select concat(substring(attrValue, 1, position(' HP' in attrValue)-1) , substring(attrValue, position(' @' in attrValue))) from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Power:'),  
        (select concat(substring(attrValue, 1, position(' Nm' in attrValue)-1) , substring(attrValue, position(' @' in attrValue))) from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Torque:'),
        (select substring(attrValue, 1, position(' HP/kg' in attrValue)-1) from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Power/weight ratio:'),  
        (select substring(attrValue, 1, position(' km/h' in attrValue)-1) from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Top speed:'),  
        (select substring(attrValue, 1, position(' seconds' in attrValue)-1) from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = '0-100 km/h (0-62 mph):'),  
        (select substring(attrValue, 1, position(' seconds' in attrValue)-1) from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = '60-140 km/h (37-87 mph), highest gear:'),  
        (select substring(attrValue, 1, position(' seconds' in attrValue)-1) from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = '1/4 mile (0.4 km):'),  
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Ignition:'), 
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Ignition:'),       
        s.id,
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Light:'),         
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Light:'),   
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Emission details:'),     
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Emission details:'),  
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Exhaust system:'),  
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Exhaust system:'),  
        (select replace(substring(attrValue, 1, position(' CO2 g/km.' in attrValue)-1),',','') from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Greenhouse gases:'),  
        (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Fuel control:'),  
        (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Fuel control:'),  
        (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Fuel system:'),  
        (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Fuel system:'),  
        (select replace(substring(attrValue, 1, position(' litres' in attrValue)-1),',','') from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Fuel capacity:'),
        (select substring(attrValue, 1, position(' litres' in attrValue)-1) from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Reserve fuel capacity:'),
        (select substring(attrValue, 1, position(' litres/100 km' in attrValue)-1) from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Fuel consumption:'),
        (select replace(substring(attrValue, 1, position(' mm' in attrValue)-1),',','') from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Front brakes diameter:'),
        (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Front brakes:'),
        (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Front brakes:'),
        (select replace(substring(attrValue, 1, position(' mm' in attrValue)-1),',','') from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Rear brakes diameter:'),  
        (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Rear brakes:'),
        (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Rear brakes:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Front percentage of weight:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Front suspension:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Front suspension:'),
        (select replace(substring(attrValue, 1, position(' mm' in attrValue)-1),',','') from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Front wheel travel:'),  
        (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Rear percentage of weight:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Rear suspension:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Rear suspension:'),
        (select replace(substring(attrValue, 1, position(' mm' in attrValue)-1),',','') from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Rear wheel travel:'),    
        (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Front tyre:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Front tyre:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Rear tyre:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Rear tyre:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Wheels:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Wheels:'),        
        (select substring(attrValue, 1, position('°' in attrValue)-1) from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Rake (fork angle):'), 
        (select replace(substring(attrValue, 1, position(' mm' in attrValue)-1),',','') from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Trail:'),    
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Driveline:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Driveline:'), 
   		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Electrical:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Electrical:'), 
   		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Instruments:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Instruments:'), 
   		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Modifications compared to previous model:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Modifications compared to previous model:'), 
        (select substring(attrValue, 1, position('.' in attrValue)-1) from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Price as new (MSRP):'), 
   		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Color options:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Color options:'), 
   		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Comments:'),
		(select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Comments:'),
        (select CAST(substring(attrValue, 1, position('litres' in attrValue)-1) AS DECIMAL(6,2)) from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Fuel consumption:')
from ms.model_hold_bikez m
left outer join ms.manufacturer mf on mf.name = TRIM(TRAILING ' motorcycles' FROM m.manufacturer)
left outer join ms.category c on c.nameeng = (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Category:')
left outer join ms.coolingtype cool on cool.nameeng = (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Cooling system:')
left outer join ms.enginetype e on e.nameeng = (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Engine type:')
left outer join ms.finaldrivetype fd on fd.nameeng = (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Transmission type, final drive:')
left outer join ms.startertype s on s.nameeng = (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Starter:')
where (select attrValue from modelattribute_hold_bikez ma where ma.url = m.url and ma.attrName = 'Year:') is not null;


