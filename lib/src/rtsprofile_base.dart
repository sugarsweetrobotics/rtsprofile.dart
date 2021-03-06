library rtsprofile.base;

import 'package:xml/xml.dart' as xml;
import 'dart:core';
import 'namespaces.dart';

import 'components.dart';
import 'miscs.dart';
import 'dataportconnectors.dart';
import 'serviceportconnectors.dart';

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
      namespaces: {ns_rts: 'rts', ns_rtsDoc: 'rtsDoc', ns_rtsExt: 'rtsExt', ns_xsi: 'xsi'}, 
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
  
  String toString() {
    return buildXml().toXmlString(pretty: true);
  }
  
  RTSProfile clone() {
    xml.XmlDocument doc = this.buildXml();
    return RTSProfile.createFromXmlDocument(doc);
  }
}