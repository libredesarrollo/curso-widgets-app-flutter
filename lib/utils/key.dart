class Key {
  static const RESTBACKEND = "laravel"; // django o laravel

  static const String BASEURL = RESTBACKEND == "laravel"
      ? "http://10.0.2.2:80/restflutter/public/"  // laravel
      : "http://10.0.2.2:8000/";                  // django

  //"http://192.168.100.110/restflutter/public/"; // Laravel
  //static const String BASEURL = "http://10.0.2.2:8000/"; // Django
}
