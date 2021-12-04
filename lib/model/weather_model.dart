class Weather {
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? Feels_like;
  int? pressure;

  Weather({
    this.cityName,
    this.temp,
    this.wind,
    this.humidity,
    this.Feels_like,
    this.pressure
  });

  Weather.fromJson(Map<String, dynamic> json){
    cityName = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    pressure = json [ "main"] ["pressure"];
    humidity = json["main"] ["humidity"];
    Feels_like = json["main"]["feels like"];
  }
}