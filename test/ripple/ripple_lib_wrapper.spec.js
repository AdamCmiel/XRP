var test = require("tape");
var fs = require("brfs");
var XRPLib = require("xrp-app-lib")("test");

test("Library Tests", function(t) {

    var wallet, wallet1, wallet2;

    t.test("Private Wallet type", function(t) {
        wallet = new XRPLib._Wallet({
            secretKey: ""
        });
        t.equal(typeof wallet.publicKey, "string", "A wallet's public key should be a string");
        t.equal(typeof wallet.secretKey, "string", "A wallet's secret key should be a string");
        t.equal(typeof wallet.balance, "number", "A wallet's balance should be a float");
    });

    t.test("create a wallet", function(t) {
        wallet = XRPLib.createWallet();
        t.assert(wallet instanceof XRPLib._Wallet);
        t.assert(wallet.publicKey !== wallet.secretKey);
        t.equal(wallet.balance, 0, "A new wallet should have a zero balance");
        t.end();
    });

    t.test("import wallet by secret key QR code", function(t) {
        var secretFromQRCode = fs.readFileSync('../../secret.key');
        var walletFromQRSecret = XRPLib.importWalletFromSecret(secretFromQRCode);
        t.assert(wallet instanceof XRPLib._Wallet);
    });

    t.test("sent payment", function(t) {
        wallet1 = new XRPLib.createWallet();
        wallet1.balance = 100;
        wallet2 = new XRPLib.createWallet();

        XRPLib.sendPayment({
            from: wallet1,
            to: wallet2,
            amount: 50
        });

        t.assert(wallet1.balance < 100, "Wallet 1 should have made a payment");
        t.assert(wallet2.balance > 0, "Wallet 2 should be funded");
        t.end();
    });

    t.test("check balance", function(t) {
        XRPLib.checkBalance(wallet1);
        t.assert(wallet1.balance < 100, "Wallet 1 should have made a payment");
        t.end();
    });

});

