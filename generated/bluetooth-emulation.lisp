;;;; BluetoothEmulation CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/bluetooth-emulation
  (:use #:cl)
  (:shadow
    #:disable
    #:enable
  )
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/bluetooth-emulation)

(define-domain-type central-state
  :cdp-id "CentralState" :type :string
  :properties nil
  :enum '("absent" "powered-off" "powered-on")
  :doc "Indicates the various states of Central." :experimental nil :deprecated nil)

(define-domain-type gatt-operation-type
  :cdp-id "GATTOperationType" :type :string
  :properties nil
  :enum '("connection" "discovery")
  :doc "Indicates the various types of GATT event." :experimental nil :deprecated nil)

(define-domain-type characteristic-write-type
  :cdp-id "CharacteristicWriteType" :type :string
  :properties nil
  :enum '("write-default-deprecated" "write-with-response" "write-without-response")
  :doc "Indicates the various types of characteristic write." :experimental nil :deprecated nil)

(define-domain-type characteristic-operation-type
  :cdp-id "CharacteristicOperationType" :type :string
  :properties nil
  :enum '("read" "write" "subscribe-to-notifications" "unsubscribe-from-notifications")
  :doc "Indicates the various types of characteristic operation." :experimental nil :deprecated nil)

(define-domain-type descriptor-operation-type
  :cdp-id "DescriptorOperationType" :type :string
  :properties nil
  :enum '("read" "write")
  :doc "Indicates the various types of descriptor operation." :experimental nil :deprecated nil)

(define-domain-type manufacturer-data
  :cdp-id "ManufacturerData" :type :object
  :properties (
        (:name :key :type :integer :ref nil :items nil :optional nil :doc "Company identifier https://bitbucket.org/bluetooth-SIG/public/src/main/assigned_numbers/company_identifiers/company_identifiers.yaml https://usb.org/developers")
        (:name :data :type :string :ref nil :items nil :optional nil :doc "Manufacturer-specific data (Encoded as a base64 string when passed over JSON)"))
  :enum nil
  :doc "Stores the manufacturer data" :experimental nil :deprecated nil)

(define-domain-type scan-record
  :cdp-id "ScanRecord" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional t :doc "")
        (:name :uuids :type :array :ref nil :items (:type :string :ref nil) :optional t :doc "")
        (:name :appearance :type :integer :ref nil :items nil :optional t :doc "Stores the external appearance description of the device.")
        (:name :tx-power :type :integer :ref nil :items nil :optional t :doc "Stores the transmission power of a broadcasting device.")
        (:name :manufacturer-data :type :array :ref nil :items (:type :ref :ref "ManufacturerData") :optional t :doc "Key is the company identifier and the value is an array of bytes of manufacturer specific data."))
  :enum nil
  :doc "Stores the byte data of the advertisement packet sent by a Bluetooth device." :experimental nil :deprecated nil)

(define-domain-type scan-entry
  :cdp-id "ScanEntry" :type :object
  :properties (
        (:name :device-address :type :string :ref nil :items nil :optional nil :doc "")
        (:name :rssi :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :scan-record :type :ref :ref "ScanRecord" :items nil :optional nil :doc ""))
  :enum nil
  :doc "Stores the advertisement packet information that is sent by a Bluetooth device." :experimental nil :deprecated nil)

(define-domain-type characteristic-properties
  :cdp-id "CharacteristicProperties" :type :object
  :properties (
        (:name :broadcast :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :read :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :write-without-response :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :write :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :notify :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :indicate :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :authenticated-signed-writes :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :extended-properties :type :boolean :ref nil :items nil :optional t :doc ""))
  :enum nil
  :doc "Describes the properties of a characteristic. This follows Bluetooth Core Specification BT 4.2 Vol 3 Part G 3.3.1. Characteristic Properties." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "BluetoothEmulation.enable"
  :params (
        (:name :state :type :ref :ref "CentralState" :items nil :optional nil :doc "State of the simulated central.")
        (:name :le-supported :type :boolean :ref nil :items nil :optional nil :doc "If the simulated central supports low-energy."))
  :returns nil
  :doc "Enable the BluetoothEmulation domain." :experimental nil :deprecated nil)

(define-domain-command set-simulated-central-state
  :method "BluetoothEmulation.setSimulatedCentralState"
  :params (
        (:name :state :type :ref :ref "CentralState" :items nil :optional nil :doc "State of the simulated central."))
  :returns nil
  :doc "Set the state of the simulated central." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "BluetoothEmulation.disable"
  :params nil
  :returns nil
  :doc "Disable the BluetoothEmulation domain." :experimental nil :deprecated nil)

(define-domain-command simulate-preconnected-peripheral
  :method "BluetoothEmulation.simulatePreconnectedPeripheral"
  :params (
        (:name :address :type :string :ref nil :items nil :optional nil :doc "")
        (:name :name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :manufacturer-data :type :array :ref nil :items (:type :ref :ref "ManufacturerData") :optional nil :doc "")
        (:name :known-service-uuids :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc ""))
  :returns nil
  :doc "Simulates a peripheral with |address|, |name| and |knownServiceUuids| that has already been connected to the system." :experimental nil :deprecated nil)

(define-domain-command simulate-advertisement
  :method "BluetoothEmulation.simulateAdvertisement"
  :params (
        (:name :entry :type :ref :ref "ScanEntry" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Simulates an advertisement packet described in |entry| being received by the central." :experimental nil :deprecated nil)

(define-domain-command simulate-gatt-operation-response
  :method "BluetoothEmulation.simulateGATTOperationResponse"
  :params (
        (:name :address :type :string :ref nil :items nil :optional nil :doc "")
        (:name :type :type :ref :ref "GATTOperationType" :items nil :optional nil :doc "")
        (:name :code :type :integer :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Simulates the response code from the peripheral with |address| for a GATT operation of |type|. The |code| value follows the HCI Error Codes from Bluetooth Core Specification Vol 2 Part D 1.3 List Of Error Codes." :experimental nil :deprecated nil)

(define-domain-command simulate-characteristic-operation-response
  :method "BluetoothEmulation.simulateCharacteristicOperationResponse"
  :params (
        (:name :characteristic-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :type :type :ref :ref "CharacteristicOperationType" :items nil :optional nil :doc "")
        (:name :code :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :data :type :string :ref nil :items nil :optional t :doc ""))
  :returns nil
  :doc "Simulates the response from the characteristic with |characteristicId| for a characteristic operation of |type|. The |code| value follows the Error Codes from Bluetooth Core Specification Vol 3 Part F 3.4.1.1 Error Response. The |data| is expected to exist when simulating a successful read operation response." :experimental nil :deprecated nil)

(define-domain-command simulate-descriptor-operation-response
  :method "BluetoothEmulation.simulateDescriptorOperationResponse"
  :params (
        (:name :descriptor-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :type :type :ref :ref "DescriptorOperationType" :items nil :optional nil :doc "")
        (:name :code :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :data :type :string :ref nil :items nil :optional t :doc ""))
  :returns nil
  :doc "Simulates the response from the descriptor with |descriptorId| for a descriptor operation of |type|. The |code| value follows the Error Codes from Bluetooth Core Specification Vol 3 Part F 3.4.1.1 Error Response. The |data| is expected to exist when simulating a successful read operation response." :experimental nil :deprecated nil)

(define-domain-command add-service
  :method "BluetoothEmulation.addService"
  :params (
        (:name :address :type :string :ref nil :items nil :optional nil :doc "")
        (:name :service-uuid :type :string :ref nil :items nil :optional nil :doc ""))
  :returns (
        (:name :service-id :type :string :ref nil :items nil :optional nil :doc "An identifier that uniquely represents this service."))
  :doc "Adds a service with |serviceUuid| to the peripheral with |address|." :experimental nil :deprecated nil)

(define-domain-command remove-service
  :method "BluetoothEmulation.removeService"
  :params (
        (:name :service-id :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Removes the service respresented by |serviceId| from the simulated central." :experimental nil :deprecated nil)

(define-domain-command add-characteristic
  :method "BluetoothEmulation.addCharacteristic"
  :params (
        (:name :service-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :characteristic-uuid :type :string :ref nil :items nil :optional nil :doc "")
        (:name :properties :type :ref :ref "CharacteristicProperties" :items nil :optional nil :doc ""))
  :returns (
        (:name :characteristic-id :type :string :ref nil :items nil :optional nil :doc "An identifier that uniquely represents this characteristic."))
  :doc "Adds a characteristic with |characteristicUuid| and |properties| to the service represented by |serviceId|." :experimental nil :deprecated nil)

(define-domain-command remove-characteristic
  :method "BluetoothEmulation.removeCharacteristic"
  :params (
        (:name :characteristic-id :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Removes the characteristic respresented by |characteristicId| from the simulated central." :experimental nil :deprecated nil)

(define-domain-command add-descriptor
  :method "BluetoothEmulation.addDescriptor"
  :params (
        (:name :characteristic-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :descriptor-uuid :type :string :ref nil :items nil :optional nil :doc ""))
  :returns (
        (:name :descriptor-id :type :string :ref nil :items nil :optional nil :doc "An identifier that uniquely represents this descriptor."))
  :doc "Adds a descriptor with |descriptorUuid| to the characteristic respresented by |characteristicId|." :experimental nil :deprecated nil)

(define-domain-command remove-descriptor
  :method "BluetoothEmulation.removeDescriptor"
  :params (
        (:name :descriptor-id :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Removes the descriptor with |descriptorId| from the simulated central." :experimental nil :deprecated nil)

(define-domain-command simulate-gatt-disconnection
  :method "BluetoothEmulation.simulateGATTDisconnection"
  :params (
        (:name :address :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Simulates a GATT disconnection from the peripheral with |address|." :experimental nil :deprecated nil)

(define-domain-event gatt-operation-received
  :method "BluetoothEmulation.gattOperationReceived"
  :params (
        (:name :address :type :string :ref nil :items nil :optional nil :doc "")
        (:name :type :type :ref :ref "GATTOperationType" :items nil :optional nil :doc ""))
  :doc "Event for when a GATT operation of |type| to the peripheral with |address| happened." :experimental nil :deprecated nil)

(define-domain-event characteristic-operation-received
  :method "BluetoothEmulation.characteristicOperationReceived"
  :params (
        (:name :characteristic-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :type :type :ref :ref "CharacteristicOperationType" :items nil :optional nil :doc "")
        (:name :data :type :string :ref nil :items nil :optional t :doc "")
        (:name :write-type :type :ref :ref "CharacteristicWriteType" :items nil :optional t :doc ""))
  :doc "Event for when a characteristic operation of |type| to the characteristic respresented by |characteristicId| happened. |data| and |writeType| is expected to exist when |type| is write." :experimental nil :deprecated nil)

(define-domain-event descriptor-operation-received
  :method "BluetoothEmulation.descriptorOperationReceived"
  :params (
        (:name :descriptor-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :type :type :ref :ref "DescriptorOperationType" :items nil :optional nil :doc "")
        (:name :data :type :string :ref nil :items nil :optional t :doc ""))
  :doc "Event for when a descriptor operation of |type| to the descriptor respresented by |descriptorId| happened. |data| is expected to exist when |type| is write." :experimental nil :deprecated nil)

