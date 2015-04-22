
library rtsprofile.miscs;

import 'package:xml/xml.dart' as xml;
import 'namespaces.dart';

class Location {
  
  String direction;
  
  String height;
  String width;
  String x;
  String y;
  
  Location() {}
  
  void loadFromXmlElement(xml.XmlElement elem) {
    direction = elem.getAttribute('direction', namespace: ns_rtsExt);
    height = elem.getAttribute('height', namespace: ns_rtsExt);
    width = elem.getAttribute('width', namespace: ns_rtsExt);

    x = elem.getAttribute('x', namespace: ns_rtsExt);
    y = elem.getAttribute('y', namespace: ns_rtsExt);
    
  }
  
  static  Location load(xml.XmlElement elem) {
    return new Location()..loadFromXmlElement(elem);
  }
  
  
  void buildXml(xml.XmlBuilder builder) {

    builder.element('Location', namespace: ns_rtsExt,
      attributes: {
        'rtsExt:direction': direction,
        'rtsExt:width': width,
        'rtsExt:height': height
        });
  }
}

class Properties {
  
  String name = "";
  String value = "";
  
  Properties() {}
  
  void loadFromXmlElement(xml.XmlElement elem) {
    name = elem.getAttribute('name', namespace: ns_rtsExt);
    value = elem.getAttribute('value', namespace: ns_rtsExt);
  }
  
  static Properties load(xml.XmlElement elem) {
    return new Properties()..loadFromXmlElement(elem);
  }
  
  void buildXml(xml.XmlBuilder builder) {

    builder.element('Properties', namespace: ns_rtsExt,
      attributes: {
        'rtsExt:name': name,
        'rtsExt:value': value});
  }
}