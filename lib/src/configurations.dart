library rtsprofile.configurations;

import 'package:xml/xml.dart' as xml;
import 'namespaces.dart';



class ConfigurationSets {
  
  List<ConfigurationData> configurationDatas;
  String id;
  
  ConfigurationSets() {
    configurationDatas = new List<ConfigurationData>();
  }
  
  void loadFromXmlElement(xml.XmlElement elem) {
    configurationDatas = new List<ConfigurationData>();
    
    id = elem.getAttribute('id', namespace: ns_rts);
    
    configurationDatas.clear();
    elem.findAllElements('ConfigurationData', namespace : ns_rts).forEach((e) {
      configurationDatas.add(ConfigurationData.load(e));
    });
  }
  
  static ConfigurationSets load(xml.XmlElement elem) {
    return new ConfigurationSets()..loadFromXmlElement(elem);
  }
  

  void buildXml(xml.XmlBuilder builder) {
    builder.element('ConfigurationSets', namespace : ns_rts,
        attributes : {
          'rts:id' : id
        },
        nest : () {
          configurationDatas.forEach((c) {
            c.buildXml(builder);
          });
        }
    );
  }
}

class ConfigurationData {
  String name = "";
  String data = "";
  
  ConfigurationData() {}
  
  void loadFromXmlElement(xml.XmlElement elem) {
    name = elem.getAttribute('name', namespace: ns_rts);
    data = elem.getAttribute('data', namespace: ns_rts);
  }
  
  static ConfigurationData load(xml.XmlElement elem) {
    return new ConfigurationData()..loadFromXmlElement(elem);
  }
  

  void buildXml(xml.XmlBuilder builder) {
    builder.element('ConfigurationData', namespace: ns_rts, 
        attributes : {
          'rts:name' : name,
          'rts:data' : data
        }
        );
  }
}
