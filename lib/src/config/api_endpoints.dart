class APIEndpoints {
  static url(city) {
    return "https://api.weatherapi.com/v1/forecast.json?key=d8fa071b2a0c4aec98e85009221008&q=$city&days=10&aqi=yes&alerts=yes";
  }

  static history(date,city) {
    return "http://api.weatherapi.com/v1/history.json?key=d8fa071b2a0c4aec98e85009221008&q=$city&dt=$date";
  }
}