library rtsprofile.base;

import 'package:xml/xml.dart' as xml;
import 'dart:core';

var ns_rts = 'http://www.openrtp.org/namespaces/rts';
var ns_rtsDoc = 'http://www.openrtp.org/namespaces/rts_doc';
var _ns_xsi = "http://www.w3.org/2001/XMLSchema-instance";
var ns_rtsExt = "http://www.openrtp.org/namespaces/rts_ext";

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
  

  void buildXml(xml.XmlBuilder builder) {}
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
  

  void buildXml(xml.XmlBuilder builder) {}
}

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


class ExecutionContexts {
  
  String id;
  String rate;
  String kind;
  
  ExecutionContexts() {}
  
  void loadFromXmlElement(xml.XmlElement elem) {
    id = elem.getAttribute('id', namespace: ns_rts);
    rate = elem.getAttribute('rate', namespace: ns_rts);
    kind = elem.getAttribute('kind', namespace: ns_rts);
  }
  
  static ExecutionContexts load(xml.XmlElement elem) {
    return new ExecutionContexts()..loadFromXmlElement(elem);
  }
  

  void buildXml(xml.XmlBuilder builder) {}
}

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


class ServicePortConnectors {
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
  
  ServicePortConnectors() {
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
  
  static ServicePortConnectors load(xml.XmlElement elem) {
    return new ServicePortConnectors()..loadFromXmlElement(elem);
  }
  
  
  void buildXml(xml.XmlBuilder builder) {
    
  }

}

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

/// RTSProfile class 
class RTSProfile {
  List<Components> components;

  List<DataPortConnectors> dataPortConnectors;
  List<ServicePortConnectors> servicePortConnectors;
 
  String abstract;
  String updateDate;
  String creationDate;  
  String name = "";
  String filename = "";
  String vendor = "";
  String version = "";
  String rtspVersion;
  
  set id(String v) {
    var tokens = v.split(':');
    var i = tokens.iterator;
    if(i.moveNext()) name = i.current;
    if(i.moveNext()) vendor = i.current;
    if(i.moveNext()) filename = i.current;
    if(i.moveNext()) version = i.current;
  }
  
  String get id {
    return "$name:$vendor:$filename:$version";
  }
  
  RTSProfile() {
    components = new List<Components>();
    dataPortConnectors = new List<DataPortConnectors>();
    servicePortConnectors = new List<ServicePortConnectors>();
  }
  
  static RTSProfile createFromText(String text) {
    xml.XmlDocument doc = xml.parse(text);
    return createFromXmlDocument(doc);
  }
  
  /// This fuction create RTCProfile class instance from XmlDocument data;
  /// If invalid Xml is passed, null is returned;
  static RTSProfile createFromXmlDocument(xml.XmlDocument doc) {
    var rtcp = new RTSProfile();

    doc.findElements('RtsProfile', namespace: ns_rts).forEach((elem) {
      rtcp.rtspVersion = elem.getAttribute('version', namespace: ns_rts);
      rtcp.id = elem.getAttribute('id', namespace: ns_rts);
      rtcp.abstract = elem.getAttribute('abstract', namespace: ns_rts);
      rtcp.updateDate = elem.getAttribute('updateDate', namespace: ns_rts);
      rtcp.creationDate = elem.getAttribute('creationDate', namespace: ns_rts);
    });
    
    doc.findAllElements('Components', namespace: ns_rts).forEach((elem) {
      rtcp.components.add(Components.load(elem));
    });
    
    doc.findAllElements('DataPortConnectors', namespace: ns_rts).forEach((elem) {
      rtcp.dataPortConnectors.add(DataPortConnectors.load(elem));
    });
    
    doc.findAllElements('ServicePortConnectors', namespace: ns_rts).forEach((elem) {
      rtcp.servicePortConnectors.add(ServicePortConnectors.load(elem));
    });
    return rtcp;
  }
  
  /// buildXml
  /// This function returns XmlDocument object which generated by RTCProfile.
  xml.XmlDocument buildXml() {
    xml.XmlBuilder builder = new xml.XmlBuilder();
    builder.processing('xml', 'version="1.0" encoding="UTF-8" standalone="yes"');
    
    builder.element('RtsProfile', namespace: ns_rts,
      namespaces: {ns_rts: 'rts', ns_rtsDoc: 'rtsDoc', ns_rtsExt: 'rtsExt', _ns_xsi: 'xsi'}, 
      attributes: {
        'rts:version': rtspVersion,
        'rts:id': id,
        'rts:abstract' : abstract,
        'rts:updateDate' : updateDate,
        'rts:creationDate': creationDate
      },
      nest : () {
        components.forEach((p) {
          p.buildXml(builder);
        });
        dataPortConnectors.forEach((p) {
          p.buildXml(builder);
        });
        servicePortConnectors.forEach((p) {
          p.buildXml(builder);
        });
    });
    return builder.build();
  }
  
  RTSProfile clone() {
    xml.XmlDocument doc = this.buildXml();
    return RTSProfile.createFromXmlDocument(doc);
  }
}