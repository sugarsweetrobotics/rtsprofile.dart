
library rtsprofile.executioncontexts;

import 'package:xml/xml.dart' as xml;
import 'namespaces.dart';


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
