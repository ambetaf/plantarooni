# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

HumiditySensorReading.create([{measurement: 12},{measurement: 1222},{measurement: 12},{measurement: 13412}])
TemperatureSensorReading.create([{measurement: 12},{measurement: 1222},{measurement: 12},{measurement: 13412}])
MoistureSensorReading.create([{measurement: 12},{measurement: 1222},{measurement: 12},{measurement: 13412}])
Plant.create(name: 'makahiya', humidity_threshold: 112, temperature_threshold: 45, moisture_threshold: 565)

SystemSettings.instance.update(
  moisture_threshold: 300,
  temperature_threshold: 28,
  humidity_threshold: 90,
  manual_control: false,
  sprinkler_manual_on: false,
  cooling_manual_on: false,
  exhaust_manual_on: false
)
