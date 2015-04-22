
library rtsprofile.components;

import 'package:xml/xml.dart' as xml;
import 'namespaces.dart';
import 'dataports.dart';
import 'configurations.dart';
import 'executioncontexts.dart';
import 'miscs.dart';


class Components {
  
  String activeConfigurationSet;
  String compositeType;
  String id;
  String instanceName;
  String isRequired;
  String pathUri;
  String visible;
  
  List<DataPorts> dataPorts;
  List<ConfigurationSets> configurationSets;
  List<ExecutionContexts> executionContexts;
  Location location;
  Properties properties;
  
  
  String get ior {
    return properties.value;
  }
  
  void set ior(String v) {
    properties.value  = v;
  }
  
  Components() {
    dataPorts = new List<DataPorts>();
    configurationSets = new List<ConfigurationSets>();
    executionContexts = new List<ExecutionContexts>();
    location = new Location();
    properties = new Properties();
    properties.name = 'IOR';
    
  }
  
  void loadFromXmlElement(xml.XmlElement elem) {
    dataPorts = new List<DataPorts>();
    configurationSets = new List<ConfigurationSets>();
    executionContexts = new List<ExecutionContexts>();
    location = new Location();
    properties = new Properties();
    properties.name = 'IOR';

    activeConfigurationSet = elem.getAttribute('activeConfigurationSet', namespace: ns_rts);
    compositeType = elem.getAttribute('compositeType', namespace: ns_rts);
    id = elem.getAttribute('id', namespace: ns_rts);
    instanceName = elem.getAttribute('instanceName', namespace: ns_rts);
    isRequired = elem.getAttribute('isRequired', namespace: ns_rts);
    pathUri = elem.getAttribute('pathUri', namespace: ns_rts);
    visible = elem.getAttribute('visible', namespace: ns_rtsExt);
    
    dataPorts.clear();
    elem.findAllElements('DataPorts', namespace : ns_rts).forEach((elem) {
      dataPorts.add(DataPorts.load(elem));
    });
    configurationSets.clear();
    elem.findAllElements('ConfigurationSets', namespace : ns_rts).forEach((elem) {
      configurationSets.add(ConfigurationSets.load(elem));
    });
    executionContexts.clear();
    elem.findAllElements('ExecutionContexts', namespace : ns_rts).forEach((elem) {
      executionContexts.add(ExecutionContexts.load(elem));
    });    
    
    elem.findAllElements('Location', namespace : ns_rtsExt).forEach((e) {
      location.loadFromXmlElement(e);
    });
    elem.findAllElements('Properties', namespace : ns_rtsExt).forEach((e) {
      properties.loadFromXmlElement(e);
    });
  }
  
  static Components load(xml.XmlElement elem) {
    return new Components()..loadFromXmlElement(elem);
  }
  
  
  void buildXml(xml.XmlBuilder builder) {
    builder.element('Components', namespace: ns_rts,
      attributes: {
        'rts:activeConfigurationSet': activeConfigurationSet,
        'rts:compositeType': compositeType,
        'rts:id' : id,
        'rts:instanceName' : instanceName,
        'rts:isRequired': isRequired,
        'rts:pathUri' : pathUri,
        'rtsExt:visible' : visible
      },
      nest : () {
        dataPorts.forEach((p) {
          p.buildXml(builder);
        });
        configurationSets.forEach((p) {
          p.buildXml(builder);
        });
        executionContexts.forEach((p) {
          p.buildXml(builder);
        });
        location.buildXml(builder);
        properties.buildXml(builder);
        
    });
  }

}
