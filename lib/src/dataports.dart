library rtsprofile.dataports;

import 'package:xml/xml.dart' as xml;
import 'namespaces.dart';

class DataPorts {
  
  String name;
  String visible;
  
  DataPorts() {}
  
  void loadFromXmlElement(xml.XmlElement elem) {
    name = elem.getAttribute('name', namespace: ns_rts);
    visible = elem.getAttribute('visible', namespace: ns_rtsExt);
  }
  
  static DataPorts load(xml.XmlElement elem) {
    return new DataPorts()..loadFromXmlElement(elem);
  }
  

  void buildXml(xml.XmlBuilder builder) {}
}
