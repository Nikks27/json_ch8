class PixabayModal
{
  late List http;

  PixabayModal({required this.http});

  factory PixabayModal.fromjson(Map m1)
  {
    return PixabayModal(http: m1['']);
  }
}

class Hit
{
  late String web;

  Hit({required this.web});

  factory Hit.fromjson(Map m1)
  {
    return Hit(web: m1['']);
  }

}