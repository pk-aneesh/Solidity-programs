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
 require(shipments[shipmentId].status == Status.Manufactured, "Shipment already initiated");
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
 if (status == Status.Wholesaler) {
 require(shipment.status == Status.Manufactured, "Invalid status update");
 shipment.wholesaler = party;
 } else if (status == Status.Dealer) {
 require(shipment.status == Status.Wholesaler, "Invalid status update");
 shipment.dealer = party;
 } else if (status == Status.Retailer) {
 require(shipment.status == Status.Dealer, "Invalid status update");
 shipment.retailer = party;
 } else if (status == Status.Delivered) {
 require(shipment.status == Status.Retailer, "Invalid status update");
 shipment.status = Status.Delivered;
 } else {
 revert("Invalid status update.");
 }
 shipment.status = status;
 }
}
