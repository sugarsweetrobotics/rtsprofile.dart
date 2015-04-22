# rtsprofile

A library for Dart developers. It is awesome.

## Usage

A simple usage example:
// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library rtcprofile.test;

import 'package:unittest/unittest.dart';
import 'package:rtsprofile/rtsprofile.dart' as rtsprofile;


String text = '''<?xml version="1.0" ?>
<rts:RtsProfile rts:abstract="RT System created by rtcryo." rts:creationDate="2013-08-25T13:06:17" rts:id="RTSystem :Sugar Sweet Robotics.DefaultSystem01.1.0" rts:updateDate="2013-08-25T13:06:17" rts:version="0.2" xmlns:rts="http://www.openrtp.org/namespaces/rts" xmlns:rtsExt="http://www.openrtp.org/namespaces/rts_ext" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <rts:Components rts:activeConfigurationSet="default" rts:compositeType="None" rts:id="RTC:ysuga_net:Example:MobileRobot:1.0.0" rts:instanceName="MobileRobot0" rts:isRequired="true" rts:pathUri="localhost/MobileRobot0.rtc" rtsExt:visible="true">
        <rts:DataPorts rts:name="vel" rtsExt:visible="true"/>
        <rts:DataPorts rts:name="pos" rtsExt:visible="true"/>
        <rts:DataPorts rts:name="bumper" rtsExt:visible="true"/>
        <rts:ConfigurationSets rts:id="default">
            <rts:ConfigurationData rts:data="red" rts:name="color"/>
        </rts:ConfigurationSets>
        <rts:ConfigurationSets rts:id="__widget__">
            <rts:ConfigurationData rts:data="text" rts:name="debug"/>
        </rts:ConfigurationSets>
        <rts:ConfigurationSets rts:id="__constraints__">
            <rts:ConfigurationData rts:data="conf_constraint" rts:name="debug"/>
        </rts:ConfigurationSets>
        <rts:ExecutionContexts rts:id="0" rts:kind="PERIODIC" rts:rate="1000.0"/>
        <rtsExt:Location rtsExt:direction="DOWN" rtsExt:height="0" rtsExt:width="0" rtsExt:x="0" rtsExt:y="0"/>
        <rtsExt:Properties rtsExt:name="IOR" rtsExt:value="IOR:010000003500000049444c3a6f70656e72746d2e616973742e676f2e6a702f4f70656e52544d2f44617461466c6f77436f6d706f6e656e743a312e3000000000010000000000000086000000000102000000000d3137322e31362e3134392e3100000afc00000031afabcb0000000020b3a60c6c00000001000000000000000100000008526f6f74504f410000000008000000130000000014000000000000020000000100000020000000000001000100000002050100010001002000010109000000010001010000000026000000020002"/>
    </rts:Components>
    <rts:Components rts:activeConfigurationSet="default" rts:compositeType="None" rts:id="RTC:Sugar Sweet Robotics:Demonstration:MobileRobotController:1.0.1" rts:instanceName="MobileRobotController0" rts:isRequired="true" rts:pathUri="localhost/MobileRobotController0.rtc" rtsExt:visible="true">
        <rts:DataPorts rts:name="pos" rtsExt:visible="true"/>
        <rts:DataPorts rts:name="joy" rtsExt:visible="true"/>
        <rts:DataPorts rts:name="bumper" rtsExt:visible="true"/>
        <rts:DataPorts rts:name="vel" rtsExt:visible="true"/>
        <rts:ConfigurationSets rts:id="default"/>
        <rts:ExecutionContexts rts:id="0" rts:kind="PERIODIC" rts:rate="1000.0"/>
        <rtsExt:Location rtsExt:direction="DOWN" rtsExt:height="0" rtsExt:width="0" rtsExt:x="0" rtsExt:y="0"/>
        <rtsExt:Properties rtsExt:name="IOR" rtsExt:value="IOR:010000003500000049444c3a6f70656e72746d2e616973742e676f2e6a702f4f70656e52544d2f44617461466c6f77436f6d706f6e656e743a312e3000000000010000000000000086000000000102000000000d3137322e31362e3134392e3100000afc00000031afabcb0000000020b3a60c6c00000001000000000000000100000008526f6f74504f4100000000080000000c0000000014000000000000020000000100000020000000000001000100000002050100010001002000010109000000010001010000000026000000020002"/>
    </rts:Components>
    <rts:Components rts:activeConfigurationSet="default" rts:compositeType="None" rts:id="RTC:ysuga_net:Demonstration:VirtualJoystick:1.0.0" rts:instanceName="VirtualJoystick0" rts:isRequired="true" rts:pathUri="localhost/VirtualJoystick0.rtc" rtsExt:visible="true">
        <rts:DataPorts rts:name="out" rtsExt:visible="true"/>
        <rts:ConfigurationSets rts:id="default">
            <rts:ConfigurationData rts:data="1500" rts:name="gain"/>
        </rts:ConfigurationSets>
        <rts:ConfigurationSets rts:id="__widget__">
            <rts:ConfigurationData rts:data="text" rts:name="gain"/>
        </rts:ConfigurationSets>
        <rts:ExecutionContexts rts:id="0" rts:kind="PERIODIC" rts:rate="1000.0"/>
        <rtsExt:Location rtsExt:direction="DOWN" rtsExt:height="0" rtsExt:width="0" rtsExt:x="0" rtsExt:y="0"/>
        <rtsExt:Properties rtsExt:name="IOR" rtsExt:value="IOR:010000003500000049444c3a6f70656e72746d2e616973742e676f2e6a702f4f70656e52544d2f44617461466c6f77436f6d706f6e656e743a312e3000000000010000000000000086000000000102000000000d3137322e31362e3134392e3100000afc00000031afabcb0000000020b3a60c6c00000001000000000000000100000008526f6f74504f4100000000080000001a0000000014000000000000020000000100000020000000000001000100000002050100010001002000010109000000010001010000000026000000020002"/>
    </rts:Components>
    <rts:DataPortConnectors rts:connectorId="9f5a1ad0-6655-4606-8878-5867da1d11bf" rts:dataType="IDL:RTC/TimedPose2D:1.0" rts:dataflowType="push" rts:interfaceType="corba_cdr" rts:name="pospos" rts:pushInterval="0.0" rts:subscriptionType="new" rtsExt:visible="true">
        <rts:sourceDataPort rts:componentId="RTC:ysuga_net:Example:MobileRobot:1.0.0" rts:instanceName="MobileRobot0" rts:portName="MobileRobot0.pos">
            <rtsExt:Properties rtsExt:name="COMPONENT_PATH_ID" rtsExt:value="localhost/MobileRobot0.rtc"/>
        </rts:sourceDataPort>
        <rts:targetDataPort rts:componentId="RTC:Sugar Sweet Robotics:Demonstration:MobileRobotController:1.0.1" rts:instanceName="MobileRobotController0" rts:portName="MobileRobotController0.pos">
            <rtsExt:Properties rtsExt:name="COMPONENT_PATH_ID" rtsExt:value="localhost/MobileRobotController0.rtc"/>
        </rts:targetDataPort>
        <rtsExt:Properties rtsExt:name="dataport.dataflow_type" rtsExt:value="push"/>
        <rtsExt:Properties rtsExt:name="dataport.subscription_type" rtsExt:value="new"/>
        <rtsExt:Properties rtsExt:name="dataport.data_type" rtsExt:value="IDL:RTC/TimedPose2D:1.0"/>
        <rtsExt:Properties rtsExt:name="dataport.interface_type" rtsExt:value="corba_cdr"/>
        <rtsExt:Properties rtsExt:name="dataport.serializer.cdr.endian" rtsExt:value="little,big"/>
    </rts:DataPortConnectors>
    <rts:DataPortConnectors rts:connectorId="ea0e16df-f7f4-46ad-a733-2aa683e282de" rts:dataType="IDL:RTC/TimedBooleanSeq:1.0" rts:dataflowType="push" rts:interfaceType="corba_cdr" rts:name="bumperbumper" rts:pushInterval="0.0" rts:subscriptionType="new" rtsExt:visible="true">
        <rts:sourceDataPort rts:componentId="RTC:ysuga_net:Example:MobileRobot:1.0.0" rts:instanceName="MobileRobot0" rts:portName="MobileRobot0.bumper">
            <rtsExt:Properties rtsExt:name="COMPONENT_PATH_ID" rtsExt:value="localhost/MobileRobot0.rtc"/>
        </rts:sourceDataPort>
        <rts:targetDataPort rts:componentId="RTC:Sugar Sweet Robotics:Demonstration:MobileRobotController:1.0.1" rts:instanceName="MobileRobotController0" rts:portName="MobileRobotController0.bumper">
            <rtsExt:Properties rtsExt:name="COMPONENT_PATH_ID" rtsExt:value="localhost/MobileRobotController0.rtc"/>
        </rts:targetDataPort>
        <rtsExt:Properties rtsExt:name="dataport.dataflow_type" rtsExt:value="push"/>
        <rtsExt:Properties rtsExt:name="dataport.subscription_type" rtsExt:value="new"/>
        <rtsExt:Properties rtsExt:name="dataport.data_type" rtsExt:value="IDL:RTC/TimedBooleanSeq:1.0"/>
        <rtsExt:Properties rtsExt:name="dataport.interface_type" rtsExt:value="corba_cdr"/>
        <rtsExt:Properties rtsExt:name="dataport.serializer.cdr.endian" rtsExt:value="little,big"/>
    </rts:DataPortConnectors>
    <rts:DataPortConnectors rts:connectorId="169f8715-05e1-479c-b04f-6d64c4e7554b" rts:dataType="IDL:RTC/TimedVelocity2D:1.0" rts:dataflowType="push" rts:interfaceType="corba_cdr" rts:name="velvel" rts:pushInterval="0.0" rts:subscriptionType="new" rtsExt:visible="true">
        <rts:sourceDataPort rts:componentId="RTC:Sugar Sweet Robotics:Demonstration:MobileRobotController:1.0.1" rts:instanceName="MobileRobotController0" rts:portName="MobileRobotController0.vel">
            <rtsExt:Properties rtsExt:name="COMPONENT_PATH_ID" rtsExt:value="localhost/MobileRobotController0.rtc"/>
        </rts:sourceDataPort>
        <rts:targetDataPort rts:componentId="RTC:ysuga_net:Example:MobileRobot:1.0.0" rts:instanceName="MobileRobot0" rts:portName="MobileRobot0.vel">
            <rtsExt:Properties rtsExt:name="COMPONENT_PATH_ID" rtsExt:value="localhost/MobileRobot0.rtc"/>
        </rts:targetDataPort>
        <rtsExt:Properties rtsExt:name="dataport.dataflow_type" rtsExt:value="push"/>
        <rtsExt:Properties rtsExt:name="dataport.subscription_type" rtsExt:value="new"/>
        <rtsExt:Properties rtsExt:name="dataport.data_type" rtsExt:value="IDL:RTC/TimedVelocity2D:1.0"/>
        <rtsExt:Properties rtsExt:name="dataport.interface_type" rtsExt:value="corba_cdr"/>
        <rtsExt:Properties rtsExt:name="dataport.serializer.cdr.endian" rtsExt:value="little,big"/>
    </rts:DataPortConnectors>
    <rts:DataPortConnectors rts:connectorId="a8d5784a-da04-47dd-b087-95a1bb56d0f2" rts:dataType="IDL:RTC/TimedLongSeq:1.0" rts:dataflowType="push" rts:interfaceType="corba_cdr" rts:name="joyout" rts:pushInterval="0.0" rts:subscriptionType="new" rtsExt:visible="true">
        <rts:sourceDataPort rts:componentId="RTC:ysuga_net:Demonstration:VirtualJoystick:1.0.0" rts:instanceName="VirtualJoystick0" rts:portName="VirtualJoystick0.out">
            <rtsExt:Properties rtsExt:name="COMPONENT_PATH_ID" rtsExt:value="localhost/VirtualJoystick0.rtc"/>
        </rts:sourceDataPort>
        <rts:targetDataPort rts:componentId="RTC:Sugar Sweet Robotics:Demonstration:MobileRobotController:1.0.1" rts:instanceName="MobileRobotController0" rts:portName="MobileRobotController0.joy">
            <rtsExt:Properties rtsExt:name="COMPONENT_PATH_ID" rtsExt:value="localhost/MobileRobotController0.rtc"/>
        </rts:targetDataPort>
        <rtsExt:Properties rtsExt:name="dataport.dataflow_type" rtsExt:value="push"/>
        <rtsExt:Properties rtsExt:name="dataport.subscription_type" rtsExt:value="new"/>
        <rtsExt:Properties rtsExt:name="dataport.data_type" rtsExt:value="IDL:RTC/TimedLongSeq:1.0"/>
        <rtsExt:Properties rtsExt:name="dataport.interface_type" rtsExt:value="corba_cdr"/>
        <rtsExt:Properties rtsExt:name="dataport.serializer.cdr.endian" rtsExt:value="little,big"/>
    </rts:DataPortConnectors>
</rts:RtsProfile>''';

main() {
  rtsprofile.RTSProfile rtsProfile = rtsprofile.RTSProfile.createFromText(text);
  
  print('BasicInfomation: ');
  print(' - name: ${rtsProfile.name}');
  print(' - abstract: ${rtsProfile.abstract}');
      
}

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme
