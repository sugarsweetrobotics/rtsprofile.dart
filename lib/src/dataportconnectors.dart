library rtsprofile.dataportconnectors;
import 'package:xml/xml.dart' as xml;
import 'namespaces.dart';
import 'miscs.dart';
import 'ports.dart';

class DataPortConnectors {
  String connectorId;
  String dataType;
  String dataflowType;
  String interfaceType;
  String name;
  String pushInterval;
  String subscriptionType;
  String visible;
  
  SourceDataPort sourceDataPort;
  TargetDataPort targetDataPort;
  Map<String, String> properties;
  
  DataPortConnectors() {
    properties = new Map<String, String>();
    sourceDataPort = new SourceDataPort();
    targetDataPort = new TargetDataPort();
  }
  
  void loadFromXmlElement(xml.XmlElement elem) {
    properties = new Map<String, String>();
    sourceDataPort = new SourceDataPort();
    targetDataPort = new TargetDataPort();

    name = elem.getAttribute('name', namespace: ns_rts);
    connectorId= elem.getAttribute('connectorId', namespace: ns_rts);
    dataType = elem.getAttribute('dataType', namespace: ns_rts);
    dataflowType = elem.getAttribute('dataflowType', namespace: ns_rts);
    interfaceType = elem.getAttribute('interfaceType', namespace: ns_rts);
    subscriptionType = elem.getAttribute('subscriptionType', namespace: ns_rts);
    pushInterval = elem.getAttribute('pushInterval', namespace: ns_rts);
    visible = elem.getAttribute('visible', namespace: ns_rtsExt);
    
    
    
    elem.findAllElements('sourceDataPort', namespace : ns_rts).forEach((e) {
      sourceDataPort.loadFromXmlElement(e);
    });    
    
    elem.findAllElements('TargetDataPort', namespace : ns_rts).forEach((e) {
      targetDataPort.loadFromXmlElement(e);
    });

    Properties prop = new Properties();
    elem.findAllElements('Properties', namespace : ns_rtsExt).forEach((e) {
      prop.loadFromXmlElement(e);
      properties[prop.name] = prop.value;
    });
  }
  
  static DataPortConnectors load(xml.XmlElement elem) {
    return new DataPortConnectors()..loadFromXmlElement(elem);
  }
  
  
  void buildXml(xml.XmlBuilder builder) {
    
  }

}

