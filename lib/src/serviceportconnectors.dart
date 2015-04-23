library rtsprofile.serviceportconenctors;

import 'package:xml/xml.dart' as xml;
import 'namespaces.dart';
import 'miscs.dart';
import 'ports.dart';



class ServicePortConnectors {
  String connectorId;
  String dataType;
  String dataflowType;
  String interfaceType;
  String name;
  String pushInterval;
  String subscriptionType;
  String visible;
  
  SourceServicePort sourceServicePort;
  TargetServicePort targetServicePort;
  Map<String, String> properties;
  
  ServicePortConnectors() {
    properties = new Map<String, String>();
    sourceServicePort = new SourceServicePort();
    targetServicePort = new TargetServicePort();
  }
  
  void loadFromXmlElement(xml.XmlElement elem) {
    properties = new Map<String, String>();
    sourceServicePort = new SourceServicePort();
    targetServicePort = new TargetServicePort();

    name = elem.getAttribute('name', namespace: ns_rts);
    connectorId= elem.getAttribute('connectorId', namespace: ns_rts);
    visible = elem.getAttribute('visible', namespace: ns_rtsExt);
    
    elem.findAllElements('sourceServicePort', namespace : ns_rts).forEach((e) {
      sourceServicePort.loadFromXmlElement(e);
    });    
    
    elem.findAllElements('targetServicePort', namespace : ns_rts).forEach((e) {
      targetServicePort.loadFromXmlElement(e);
    });

    Properties prop = new Properties();
    elem.findAllElements('Properties', namespace : ns_rtsExt).forEach((e) {
      prop.loadFromXmlElement(e);
      properties[prop.name] = prop.value;
    });
  }
  
  static ServicePortConnectors load(xml.XmlElement elem) {
    return new ServicePortConnectors()..loadFromXmlElement(elem);
  }
  
  
  void buildXml(xml.XmlBuilder builder) {
    builder.element('ServicePortConnectors', namespace: ns_rts,
          attributes: {
            'rts:name': name,
            'rts:connectorId': connectorId,
            'rtsExt:visible' : visible
          },
          nest : () {
            sourceServicePort.buildXml(builder);
            targetServicePort.buildXml(builder);
            properties.keys.forEach((name_) {
              builder.element('Properties', namespace : ns_rtsExt,
                  attributes : {
                    'rtsExt:name' : name_,
                    'rtsExt:value' : properties[name_]
                  }
              );
            });
          }
      );
  
  }

}