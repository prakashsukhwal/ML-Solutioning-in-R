model = readRDS("car_price.rds")

#* Test connection
#* @get /connected

function(){
  list(status = paste("Welcome", Sys.getenv('username'), "to DSSI. We are a go!"),
       time = Sys.time())
}

#* predict the price of a used car
#* @param Age age of the car
#* @param KM distance ran in kms
#* @param FuelType Diesel/Petrol/CNG
#* @param HP horsepower
#* @param Automatic 1 or 0
#* @param CC vehicle fuel capacity
#* @param Doors 2/3/4/5 doors
#* @param Weight weight of vehicle

#* @post /predict
function(Age, KM, FuelType, HP, Automatic, CC, Doors, Weight){
  newdata = data.frame(Age = as.numeric(Age), KM = as.numeric(KM),
                       FuelType = FuelType, HP = as.numeric(HP),
                       Automatic = as.numeric(Automatic),
                       CC = as.numeric(CC), Doors = as.numeric(Doors),
                       Weight = as.numeric(Weight)) 
  predict(model, newdata)
  }





