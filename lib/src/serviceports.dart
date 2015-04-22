library rtsprofile.serviceports;

import 'package:xml/xml.dart' as xml;
import 'namespaces.dart';

class ServicePorts {
  
  String name;
  String visible;
  
  ServicePorts() {}
  
  void loadFromXmlElement(xml.XmlElement elem) {
    name = elem.getAttribute('name', namespace: ns_rts);
    visible = elem.getAttribute('visible', namespace: ns_rtsExt);
  }
  
  static ServicePorts load(xml.XmlElement elem) {
    return new ServicePorts()..loadFromXmlElement(elem);
  }
  

  void buildXml(xml.XmlBuilder builder) {
    builder.element('DataPorts', namespace : ns_rts,
        attributes : {
          'rts:name' : name,
          'rtsExt:visible' : visible
        }
    );
  }
}
