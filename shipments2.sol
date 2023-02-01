pragma solidity ^0.8.0;
contract Shipment {
 enum Status { Manufactured, Wholesaler, Dealer, Retailer, Delivered }
 struct ShipmentDetails {
 address initiator;
 address manufacturer;
 address wholesaler;
 address dealer;
 address retailer;
 Status status;
 }
 mapping (bytes32 => ShipmentDetails) public shipments;
 function initiateShipment(bytes32 shipmentId, address manufacturer) public {
 shipments[shipmentId] = ShipmentDetails(
 msg.sender,
 manufacturer,
 address(0),
 address(0),
 address(0),
 Status.Manufactured
 );
 }
 function updateStatus(bytes32 shipmentId, Status status, address party) public {
 ShipmentDetails storage shipment = shipments[shipmentId];
 if (shipment.status == Status.Manufactured && status == Status.Wholesaler) {
 shipment.wholesaler = party;
 } else if (shipment.status == Status.Wholesaler && status == Status.Dealer) {
 shipment.dealer = party;
 } else if (shipment.status == Status.Dealer && status == Status.Retailer) {
 shipment.retailer = party;
 } else if (shipment.status == Status.Retailer && status == Status.Delivered) {
 shipment.status = Status.Delivered;
 } else {
 revert("Invalid status update.");
 }
 shipment.status = status;
 }
}
