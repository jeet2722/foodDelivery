select * from foodDelivery;
update foodDelivery set timeTaken = substring(timeTaken,6,8);

-- PickupTime 
ALTER TABLE foodDelivery ADD pickupTime int;
update foodDelivery set pickupTime = DATEDIFF(minute,timeOrderd, timeOrderPicked);
update foodDelivery set pickupTime = 1440 + pickupTime where pickupTime < 0 ;

--delivered distance
ALTER TABLE foodDelivery ADD deliveredDistance float;
update foodDelivery set deliveredDistance =  SQRT(SQUARE(deliveryLocationLatitude - restaurantLatitude)
+ SQUARE(deliveryLocationLongitude - restaurantLongitude));
DELETE from foodDelivery where deliveredDistance > 1;

--finalizing table
ALTER table foodDelivery 
drop COLUMN 
deliveryLocationLatitude, restaurantLatitude, deliveryLocationLongitude,restaurantLongitude, timeOrderPicked;


create TABLE AgedDeliveryCount ( ages VARCHAR(20), deliveriesCount int);
select * from AgedDeliveryCount;

create TABLE totalTimeAndDistance ( city VARCHAR(20),typeOfVehicles VARCHAR(20), timeTaken float, deliveredDistance float);
select * from totalTimeAndDistance;

create TABLE totalVehiclesCount (city VARCHAR(20),typeOfVehicles VARCHAR(20), cnt int);
select * from totalVehiclesCount;
