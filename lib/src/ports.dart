library rtsprofile.ports;

import 'package:xml/xml.dart' as xml;
import 'namespaces.dart';
import 'miscs.dart';



class TargetDataPort {
  
  String componentId;
  String instanceName;
  String portName;
  Properties properties;
  
  TargetDataPort() {
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
  

  
  void buildXml(xml.XmlBuilder builder) {
    builder.element('targetDataPort', namespace : ns_rts,
        attributes : {
          'rts:componentId' : componentId,
          'rtsExt:instanceName' : instanceName,
          'rtsExt:portName' : portName
        },
        nest : () {
          properties.buildXml(builder);
        });
        
  }
}

class SourceDataPort {

  String componentId;
  String instanceName;
  String portName;
  Properties properties;
  
  SourceDataPort() {
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
  

  void buildXml(xml.XmlBuilder builder) {
    builder.element('sourceDataPort', namespace : ns_rts,
        attributes : {
          'rts:componentId' : componentId,
          'rtsExt:instanceName' : instanceName,
          'rtsExt:portName' : portName
        },
        nest : () {
          properties.buildXml(builder);
        });
  }
}

class SourceServicePort {

  String componentId;
  String instanceName;
  String portName;
  Properties properties;
  
  SourceServicePort() {
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
  

  void buildXml(xml.XmlBuilder builder) {
    builder.element('sourceServicePort', namespace : ns_rts,
        attributes : {
          'rts:componentId' : componentId,
          'rtsExt:instanceName' : instanceName,
          'rtsExt:portName' : portName
        },
        nest : () {
          properties.buildXml(builder);
        });
  }
}




class TargetServicePort {
  
  String componentId;
  String instanceName;
  String portName;
  Properties properties;
  
  TargetServicePorts() {
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
  

  
  void buildXml(xml.XmlBuilder builder) {
    builder.element('targetServicePort', namespace : ns_rts,
        attributes : {
          'rts:componentId' : componentId,
          'rtsExt:instanceName' : instanceName,
          'rtsExt:portName' : portName
        },
        nest : () {
          properties.buildXml(builder);
        });
        
  }
}

