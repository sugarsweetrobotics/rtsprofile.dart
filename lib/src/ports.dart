library rtsprofile.ports;

import 'package:xml/xml.dart' as xml;
import 'namespaces.dart';
import 'miscs.dart';



class TargetDataPort {
  
  String componentId;
  String instanceName;
  String portName;
  Properties properties;
  
  TargetDataPorts() {
    properties = new Properties();
  }
  
  void loadFromXmlElement(xml.XmlElement elem) {
    componentId = elem.getAttribute('componentId', namespace: ns_rts);
    instanceName = elem.getAttribute('instanceName', namespace: ns_rtsExt);
    portName = elem.getAttribute('portName', namespace: ns_rtsExt);
    properties = new Properties();
    elem.findAllElements('Properties', namespace : ns_rtsExt).forEach((e) {
      properties.loadFromXmlElement(e);
    });
  }
  
}

class SourceDataPort {

  String componentId;
  String instanceName;
  String portName;
  Properties properties;
  
  SourceDataPorts() {
    properties = new Properties();
  }
  
  void loadFromXmlElement(xml.XmlElement elem) {
    componentId = elem.getAttribute('componentId', namespace: ns_rts);
    instanceName = elem.getAttribute('instanceName', namespace: ns_rtsExt);
    portName = elem.getAttribute('portName', namespace: ns_rtsExt);
    properties = new Properties();
    elem.findAllElements('Properties', namespace : ns_rtsExt).forEach((e) {
      properties.loadFromXmlElement(e);
    });
  }
}