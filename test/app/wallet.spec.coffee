Wallet = require "../../src/models/wallet"
Account = require "../../src/models/account"
{expect, assert, should, use} = require "chai"
should()
Backbone = require "backbone"
XRP = require "xrp-app-lib"

key = "rfemvFrpCAPc4hUa1v8mPRYdmaCqR1iFpe"

describe "Wallet Model", ->

    wallet = new Wallet wallet: XRP.createWallet()

    it "should inherit the correct models", ->
        wallet.should.be.an.instanceof Wallet
        wallet.should.be.an.instanceof Account
        wallet.should.be.an.instanceof Backbone.Model
        wallet.get("wallet").updateBalance.should.be.a "function"

    it "should have a valid wallet", ->
        wallet.get("wallet").should.be.an.instanceof XRP._Wallet
        wallet.get("wallet").should.be.an.instanceof XRP._Account
        publicKey = wallet.get("wallet").publicKey
        accountFromPublic = XRP.importAccountFromAddress publicKey
        accountFromPublic.publicKey.should.equal publicKey

    it "should be able to make payments", ->
        wallet.payTo.should.be.a "function"
        
