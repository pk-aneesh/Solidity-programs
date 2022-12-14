pragma solidity ^0.6.0;

contract Invoice {
    // The PAN of the buyer
    string public buyerPAN;
    // The PAN of the seller
    string public sellerPAN;
    // The amount of the invoice
    uint256 public invoiceAmount;
    // The date of the invoice
    uint256 public invoiceDate;
    // The payment status of the invoice (true if paid, false if not paid)
    bool public paymentStatus;

    // Maps buyer PANs to their invoices
    mapping(string => Invoice[]) public buyerInvoices;

    // Initializes the contract with the given buyer and seller PANs,
    // invoice amount, and invoice date
    constructor(string memory _buyerPAN, string memory _sellerPAN, uint256 _invoiceAmount, uint256 _invoiceDate) public {
        buyerPAN = _buyerPAN;
        sellerPAN = _sellerPAN;
        invoiceAmount = _invoiceAmount;
        invoiceDate = _invoiceDate;
        paymentStatus = false;
    }

    // Changes the payment status of the invoice to paid
    function payInvoice() public {
        paymentStatus = true;
    }

    // Adds the current invoice to the list of invoices for the given buyer PAN
    function addToBuyerInvoices(string memory _buyerPAN) public {
        buyerInvoices[_buyerPAN].push(this);
    }

    // Returns the list of invoices for the given buyer PAN
    function getInvoicesForBuyer(string memory _buyerPAN) public view returns (Invoice[] memory) {
        return buyerInvoices[_buyerPAN];
    }
}
