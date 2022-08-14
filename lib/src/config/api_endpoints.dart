class APIEndpoints {
  static url(city) {
    return "https://api.weatherapi.com/v1/forecast.json?key=d8fa071b2a0c4aec98e85009221008&q=$city&days=10&aqi=yes&alerts=yes";
  }

  static history(date,city) {
    print(date + city);
    return "http://api.weatherapi.com/v1/history.json?key=d8fa071b2a0c4aec98e85009221008&q=$city&dt=$date";
  }
}

/* 

How to get md5 hash code ????

1.  Go to : https://www.md5hashgenerator.com/
2.  In the text box, first enter your time stamp and then enter your api key
    ex. your time stamp is 1212345 and api key is jju322jj1kj38sdd9
        then your key is 1212345jju322jj1kj38sdd9
        and then click generate
3.  Copy this md5 hash code and put in to your api link
 */